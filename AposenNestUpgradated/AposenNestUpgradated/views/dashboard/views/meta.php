<?php

include "../../../models/config.php"; // Certifique-se de que este arquivo tenha a conexão PDO configurada

// Supondo que você já tenha uma conexão com o banco de dados e o id do usuário logado
$idUsuario = $_SESSION['idUsuario'];

// Consulta ao banco de dados para obter os dados da meta de aposentadoria
$query = $conn->prepare("SELECT Despesa_Mensal, Taxa_Inflacao_Desejada, Fundo_Necessario, Data_Criacao FROM meta_aposent WHERE Usuario_idUsuario = :idusuario");
$query->bindValue(":idusuario", $idUsuario);
$query->execute(); // Execute a consulta

$dadosContribuicoes = [];
$graficoDados = [['Ano', 'Contribuição', 'Renda Acumulada']];

// Processando os dados
while ($row = $query->fetch(PDO::FETCH_ASSOC)) {
    $mes = date('Y-m', strtotime($row['Data_Criacao']));
    $contribuicao = $row['Despesa_Mensal'];
    $rendaAcumulada = $row['Fundo_Necessario'] * ($row['Taxa_Inflacao_Desejada'] / 100); // Exemplo de cálculo

    $dadosContribuicoes[] = [$mes, $contribuicao, $rendaAcumulada, $row['Taxa_Inflacao_Desejada']];
    $graficoDados[] = [$mes, $contribuicao, $rendaAcumulada];
}
?>

<div class="meta-aposentadoria-container">
    <h1 style="color: green;">Meta de Aposentadoria</h1>

    <!-- Gráfico de Progresso -->
    <div id="progressChart" style="width: 100%; height: 400px;"></div>

    <!-- Tabela com dados -->
    <h2>Contribuições Mensais</h2>
    <table class="meta-table">
        <thead>
            <tr>
                <th>Mês</th>
                <th>Contribuição</th>
                <th>Renda Acumulada</th>
                <th>Progresso (%)</th>
            </tr>
        </thead>
        <tbody>
            <?php
            foreach ($dadosContribuicoes as $dado) {
                echo "<tr>
                        <td>{$dado[0]}</td>
                        <td>R$ {$dado[1]}</td>
                        <td>R$ {$dado[2]}</td>
                        <td>{$dado[3]}%</td>
                      </tr>";
            }
            ?>
        </tbody>
    </table>
</div>

<style>
    .meta-aposentadoria-container {
        background-color: #f9f9f9;
        padding: 20px;
        border-radius: 8px;
        box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
        margin: 20px 0;
    }

    .meta-table {
        width: 100%;
        border-collapse: collapse;
        margin-top: 20px;
    }

    .meta-table th, .meta-table td {
        border: 1px solid #000;
        text-align: left;
        padding: 8px;
    }

    td {
    
    color: black;

}

    .meta-table th {
        background-color: #4caf50;
        color: white;
    }

    .meta-table tr:nth-child(even) {
        background-color: #f2f2f2;
    }
</style>

<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<script type="text/javascript">
    google.charts.load('current', {'packages':['corechart']});
    google.charts.setOnLoadCallback(drawProgressChart);

    function drawProgressChart() {
        var data = google.visualization.arrayToDataTable(<?php echo json_encode($graficoDados); ?>);

        var options = {
            title: 'Progresso da Meta de Aposentadoria',
            hAxis: {
                title: 'Ano'
            },
            vAxis: {
                title: 'Valores (R$)',
                minValue: 0
            },
            colors: ['#4caf50', '#2196F3'],
            legend: { position: 'bottom' }
        };

        var chart = new google.visualization.ColumnChart(document.getElementById('progressChart'));
        chart.draw(data, options);
    }
</script>
