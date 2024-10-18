<?php

$host = "localhost";
$username = "root";
$dbname = "aposennest";
$password = "";

// Criando a conexão
$conn = mysqli_connect($host, $username, $password, $dbname);

// Verificando a conexão
if (!$conn) {
    die("Erro: " . mysqli_connect_error());
}

// Se precisar, pode exibir uma mensagem de sucesso
// echo "Base de dados configurada com sucesso!";

?>
