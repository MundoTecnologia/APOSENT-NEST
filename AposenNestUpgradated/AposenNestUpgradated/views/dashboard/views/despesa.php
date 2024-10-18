<div class="despesas-container">
    <h1 style="color: red;">Despesas Mensais</h1>

    <!-- Gráfico de Despesas -->
    <div id="despesasChart" style="width: 100%; height: 400px;"></div>

    <!-- Tabela com dados -->
    <h2>Resumo de Despesas</h2>
    <table class="despesas-table">
        <thead>
            <tr>
                <th>Mês</th>
                <th>Categoria</th>
                <th>Valor (R$)</th>
                <th>Percentual do Total (%)</th>
            </tr>
        </thead>
        <tbody>
            <?php
            // Supondo que você tenha um array com os dados
            $dadosDespesas = [
                ["Janeiro", "Alimentação", 1200, 20],
                ["Fevereiro", "Transporte", 800, 13.33],
                ["Março", "Moradia", 1500, 25],
                ["Abril", "Lazer", 600, 10],
                // Adicione mais meses e categorias conforme necessário
            ];

            foreach ($dadosDespesas as $dado) {
                echo "<tr>
                        <td>{$dado[0]}</td>
                        <td>{$dado[1]}</td>
                        <td>R$ {$dado[2]}</td>
                        <td>{$dado[3]}%</td>
                      </tr>";
            }
            ?>
        </tbody>
    </table>
</div>

<style>
    .despesas-container {
        background-color: #f9f9f9;
        padding: 20px;
        border-radius: 8px;
        box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
        margin: 20px 0;
    }

    .despesas-table {
        width: 100%;
        border-collapse: collapse;
        margin-top: 20px;
    }

    .despesas-table th, .despesas-table td {
        border: 1px solid #000;
        text-align: left;
        padding: 8px;
    }


    td{
        color: black;
    }

    .despesas-table th {
        background-color: #f44336;
        color: white;
    }

    .despesas-table tr:nth-child(even) {
        background-color: #f2f2f2;
    }
</style>

<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<script type="text/javascript">
    google.charts.load('current', {'packages':['corechart']});
    google.charts.setOnLoadCallback(drawDespesasChart);

    function drawDespesasChart() {
        var data = google.visualization.arrayToDataTable([
            ['Categoria', 'Valor (R$)'],
            ['Alimentação', 1200],
            ['Transporte', 800],
            ['Moradia', 1500],
            ['Lazer', 600],
            // Adicione mais categorias conforme necessário
        ]);

        var options = {
            title: 'Distribuição de Despesas',
            pieHole: 0.4,
            colors: ['#f44336', '#ff9800', '#ffc107', '#4caf50'],
            legend: { position: 'bottom' }
        };

        var chart = new google.visualization.PieChart(document.getElementById('despesasChart'));
        chart.draw(data, options);
    }
</script>
