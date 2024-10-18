<?php
require_once "../../models/config.php";
session_start(); // Inicie a sessão

if (isset($_POST['nome'])) {
    // Sanitização das entradas
    $nome = addslashes($_POST['nome']);
    $nascimento = addslashes($_POST['nascimento']);
    $bilhete = addslashes($_POST['bilhete']);
    $renda = addslashes($_POST['renda_atual']);
    $data_aposent = addslashes($_POST['nascimento_aposent']);
    $plano_aposent = $_POST['plano_aposent'];
    $telefone = addslashes($_POST['telefone']);
    $email = addslashes($_POST['email']);
    $senha = addslashes($_POST['senha']);
    $confSenha = addslashes($_POST['conf_senha']);

    // Verificação de campos não vazios
    if (!empty($nome) && !empty($nascimento) && !empty($bilhete) && !empty($renda) && 
        !empty($data_aposent) && !empty($plano_aposent) && !empty($telefone) && 
        !empty($email) && !empty($senha) && !empty($confSenha)) {

        // Verificar se o ano de nascimento é menor que 2004
        $ano_nascimento = date('Y', strtotime($nascimento));
        if ($ano_nascimento > 2004) {
            $_SESSION['error'] = "A data de nascimento deve ser anterior a 2004.";
            header("Location: ../../views/login/login.php"); // Redireciona para a página de login ou outra
            exit;
        }

        // Verificar se o bilhete já está cadastrado
        $sql_bi = $conn->prepare("SELECT COUNT(bilhete) as b FROM usuario WHERE bilhete = :bilhete");
        $sql_bi->bindValue(":bilhete", $bilhete);
        $sql_bi->execute();
        $sql_bi_verify = $sql_bi->fetch();

        if ($sql_bi_verify['b'] > 0) {
            $_SESSION['error'] = "Bilhete já cadastrado na base de dados.";
            header("Location: ../../views/login/login.php");
            exit;
        }

        // Verificar se o email já está cadastrado
        $sql_email = $conn->prepare("SELECT COUNT(email) as e FROM contato WHERE email = :email");
        $sql_email->bindValue(":email", $email);
        $sql_email->execute();
        $sql_email_verify = $sql_email->fetch();

        if ($sql_email_verify['e'] > 0) {
            $_SESSION['error'] = "Email já encontrado na base de dados.";
            header("Location: ../../views/login/login.php");
            exit;
        }

        // Validar a data de aposentadoria
        $ano_atual = date('Y');
        if ($data_aposent < $ano_atual) {
            $_SESSION['error'] = "A data de aposentadoria deve ser igual ou superior a $ano_atual.";
            header("Location: ../../views/login/login.php");
            exit;
        }

        // Verificar se as senhas correspondem
        if ($senha !== $confSenha) {
            $_SESSION['error'] = "Senhas não correspondem!";
            header("Location: ../../views/login/login.php");
            exit;
        }

        // Iniciar transação
        $conn->beginTransaction();

        try {
            // Inserir usuário
            $sql_usuario = $conn->prepare("INSERT INTO usuario(nome, data_Nasc, renda_Atual, idade_Aposent, Plano_Aposent_idPlano_Aposent, bilhete) 
                                            VALUES (:n, :dt, :rnd, :pl_ap, :id_pl, :bi)");
            $sql_usuario->bindValue(":n", $nome);
            $sql_usuario->bindValue(":dt", $nascimento);
            $sql_usuario->bindValue(":rnd", $renda);
            $sql_usuario->bindValue(":id_pl", $plano_aposent);
            $sql_usuario->bindValue(":pl_ap", $data_aposent);
            $sql_usuario->bindValue(":bi", $bilhete);
            $sql_usuario->execute();

            // Inserir contato
            $sql_contacto = $conn->prepare("INSERT INTO contato(telefone, email) VALUES(:tel, :email)");
            $sql_contacto->bindValue(":tel", $telefone);
            $sql_contacto->bindValue(":email", $email);
            $sql_contacto->execute();

            // Inserir login com senha usando md5
            $sql_login = $conn->prepare("INSERT INTO login(password, Usuario_idUsuario, Contato_idContato) 
                                          VALUES(:senha, :usuario, :contacto)");
            $sql_login->bindValue(":senha", md5($senha));
            $sql_login->bindValue(":usuario", $conn->lastInsertId());
            $sql_login->bindValue(":contacto", $conn->lastInsertId());
            $sql_login->execute();

            // Confirmar transação
            $conn->commit();
            $_SESSION['success'] = "Usuário cadastrado com sucesso!";
            header("Location: ../../views/login/login.php"); // Redireciona para a página de login ou outra
            exit;

        } catch (Exception $e) {
            $conn->rollBack();
            $_SESSION['error'] = "Não foi possível cadastrar o usuário! Erro: " . $e->getMessage();
            header("Location: ../../views/login/login.php");
            exit;
        }
    } else {
        $_SESSION['error'] = "Preencha todos os campos!";
        header("Location: ../../views/login/login.php");
        exit;
    }
}
?>
