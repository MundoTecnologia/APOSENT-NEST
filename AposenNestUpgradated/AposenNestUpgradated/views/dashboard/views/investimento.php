<div class="investimentos-container">
    <h1 style="color: blue;">Investimentos</h1>

    <!-- Gráfico de Investimentos -->
    <div id="investimentosChart" style="width: 100%; height: 400px;"></div>

    <!-- Tabela com dados -->
    <h2>Resumo de Investimentos</h2>
    <table class="investimentos-table">
        <thead>
            <tr>
                <th>Categoria</th>
                <th>Valor Investido (R$)</th>
                <th>Rendimento (R$)</th>
                <th>Valor Total (R$)</th>
            </tr>
        </thead>
        <tbody>
            <?php
            // Supondo que você tenha um array com os dados
            $dadosInvestimentos = [
                ["Ações", 10000, 2000, 12000],
                ["Fundos Imobiliários", 8000, 1200, 9200],
                ["Renda Fixa", 5000, 500, 5500],
                // Adicione mais categorias conforme necessário
            ];

            foreach ($dadosInvestimentos as $dado) {
                echo "<tr>
                        <td>{$dado[0]}</td>
                        <td>R$ {$dado[1]}</td>
                        <td>R$ {$dado[2]}</td>
                        <td>R$ {$dado[3]}</td>
                      </tr>";
            }
            ?>
        </tbody>
    </table>
</div>

<style>
    .investimentos-container {
        background-color: #f9f9f9;
        padding: 20px;
        border-radius: 8px;
        box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
        margin: 20px 0;
    }

    .investimentos-table {
        width: 100%;
        border-collapse: collapse;
        margin-top: 20px;
    }

    .investimentos-table th, .investimentos-table td {
        border: 1px solid #000;
        text-align: left;
        padding: 8px;
    }

    td{
        color: #000;
    }

    .investimentos-table th {
        background-color: #2196F3;
        color: white;
    }

    .investimentos-table tr:nth-child(even) {
        background-color: #f2f2f2;
    }
</style>

<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<script type="text/javascript">
    google.charts.load('current', {'packages':['corechart']});
    google.charts.setOnLoadCallback(drawInvestimentosChart);

    function drawInvestimentosChart() {
        var data = google.visualization.arrayToDataTable([
            ['Categoria', 'Valor Investido (R$)', 'Rendimento (R$)'],
            ['Ações', 10000, 2000],
            ['Fundos Imobiliários', 8000, 1200],
            ['Renda Fixa', 5000, 500],
            // Adicione mais categorias conforme necessário
        ]);

        var options = {
            title: 'Desempenho dos Investimentos',
            hAxis: { title: 'Categoria' },
            vAxis: { title: 'Valor (R$)' },
            isStacked: true,
            colors: ['#2196F3', '#ff9800'],
            legend: { position: 'top' }
        };

        var chart = new google.visualization.ColumnChart(document.getElementById('investimentosChart'));
        chart.draw(data, options);
    }
</script>
