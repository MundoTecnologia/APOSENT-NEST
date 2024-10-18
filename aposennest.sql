-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 18/10/2024 às 11:00
-- Versão do servidor: 10.4.32-MariaDB
-- Versão do PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `aposennest`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `contato`
--

CREATE TABLE `contato` (
  `idContato` int(11) NOT NULL,
  `email` varchar(100) NOT NULL,
  `telefone` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Despejando dados para a tabela `contato`
--

INSERT INTO `contato` (`idContato`, `email`, `telefone`) VALUES
(1, 'claudiodomingosfaustinoandre@gmail.com', '937778359'),
(2, 'claudiodomingosfaustino@gmail.com', '925870889'),
(3, 'luciojose@gmail.com', '926987840'),
(4, 'anamaria1@gmail.com', '923832610'),
(5, 'ramires@gmail.com', '937778359'),
(6, 'eugenio@gmail.com', '937778359'),
(7, 'aldaircassange@gmail.com', '926987840'),
(8, 'manuelandre@gmail.com', '923832610'),
(9, 'claudiofaustino@gmail.com', '926987840'),
(10, 'edson@gmail.com', '941180836');

-- --------------------------------------------------------

--
-- Estrutura para tabela `despesas`
--

CREATE TABLE `despesas` (
  `id` int(11) NOT NULL,
  `categoria` enum('Alimentação','Transporte','Habitação','Saúde','Educação','Lazer','Roupas','Serviços','Impostos','Outras Despesas') NOT NULL,
  `valor` decimal(10,2) NOT NULL,
  `data_registro` date NOT NULL DEFAULT current_timestamp(),
  `data_atualizacao` date DEFAULT current_timestamp(),
  `usuario_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Despejando dados para a tabela `despesas`
--

INSERT INTO `despesas` (`id`, `categoria`, `valor`, `data_registro`, `data_atualizacao`, `usuario_id`) VALUES
(1, 'Alimentação', 50.00, '2024-10-15', '2024-10-15', 1),
(3, 'Transporte', 30.00, '2024-10-15', '2024-10-15', 2),
(4, 'Habitação', 90.00, '2024-10-15', '2024-10-15', 3),
(5, 'Educação', 100.00, '2024-10-16', '2024-10-16', 5),
(6, 'Alimentação', 20000.00, '2024-10-16', '2024-10-16', 6),
(7, 'Transporte', 30000.00, '2024-10-16', '2024-10-16', 6),
(8, 'Alimentação', 20000.00, '2024-10-16', '2024-10-16', 6),
(9, 'Transporte', 30000.00, '2024-10-16', '2024-10-16', 6),
(10, 'Alimentação', 20000.00, '2024-10-16', '2024-10-16', 6),
(11, 'Transporte', 30000.00, '2024-10-16', '2024-10-16', 6),
(13, 'Saúde', 5000.00, '2024-10-16', '2024-10-16', 6),
(14, 'Alimentação', 50000.00, '2024-10-17', '2024-10-17', 7),
(15, 'Transporte', 30000.00, '2024-10-17', '2024-10-17', 7),
(16, 'Alimentação', 50000.00, '2024-10-18', '2024-10-18', 8),
(17, 'Alimentação', 70000.00, '2024-10-18', '2024-10-18', 9),
(18, 'Alimentação', 70000.00, '2024-10-18', '2024-10-18', 9),
(19, 'Alimentação', 20000.00, '2024-10-18', '2024-10-18', 10),
(20, 'Transporte', 30000.00, '2024-10-18', '2024-10-18', 10);

-- --------------------------------------------------------

--
-- Estrutura para tabela `historico_cambio`
--

CREATE TABLE `historico_cambio` (
  `idHistorico_Cambio` int(11) NOT NULL,
  `Data_Historico` date DEFAULT NULL,
  `Taxa_Cambio` int(11) DEFAULT NULL,
  `Taxa_Inflacao` float DEFAULT NULL,
  `Data_Criacao` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `investimentos`
--

CREATE TABLE `investimentos` (
  `id` int(11) NOT NULL,
  `tipo_investimento` enum('Ações','Fundo Imobiliário','Renda Fixa') NOT NULL,
  `valor_atual` decimal(10,2) NOT NULL,
  `retorno_anual` decimal(10,2) NOT NULL,
  `nivel_de_risco` enum('Baixo','Médio','Alto') NOT NULL,
  `data_registro` date NOT NULL DEFAULT current_timestamp(),
  `data_atualizacao` date DEFAULT current_timestamp(),
  `usuario_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Despejando dados para a tabela `investimentos`
--

INSERT INTO `investimentos` (`id`, `tipo_investimento`, `valor_atual`, `retorno_anual`, `nivel_de_risco`, `data_registro`, `data_atualizacao`, `usuario_id`) VALUES
(1, 'Fundo Imobiliário', 20.00, 240.00, 'Médio', '2024-10-15', '2024-10-15', 1),
(3, 'Ações', 20.00, 100.00, 'Baixo', '2024-10-15', '2024-10-15', 2),
(4, 'Fundo Imobiliário', 20.00, 156.00, 'Baixo', '2024-10-15', '2024-10-15', 3),
(5, 'Renda Fixa', 20.00, 50.00, 'Baixo', '2024-10-16', '2024-10-16', 5),
(10, 'Ações', 30000.00, 5.00, 'Médio', '2024-10-16', '2024-10-16', 6),
(11, '', 100000.00, 45000.00, 'Baixo', '2024-10-17', '2024-10-17', 7),
(12, '', 80000.00, 123000.00, 'Médio', '2024-10-17', '2024-10-17', 7),
(13, '', 30000.00, 600000.00, 'Baixo', '2024-10-18', '2024-10-18', 8),
(14, '', 80000.00, 5.00, 'Baixo', '2024-10-18', '2024-10-18', 9),
(15, '', 80000.00, 5.00, 'Baixo', '2024-10-18', '2024-10-18', 9),
(16, '', 45000.00, 500000.00, 'Baixo', '2024-10-18', '2024-10-18', 10);

-- --------------------------------------------------------

--
-- Estrutura para tabela `login`
--

CREATE TABLE `login` (
  `idLogin` int(11) NOT NULL,
  `password` varchar(45) DEFAULT NULL,
  `Usuario_idUsuario` int(11) NOT NULL,
  `Contato_idContato` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Despejando dados para a tabela `login`
--

INSERT INTO `login` (`idLogin`, `password`, `Usuario_idUsuario`, `Contato_idContato`) VALUES
(1, '21232f297a57a5a743894a0e4a801fc3', 1, 1),
(2, '202cb962ac59075b964b07152d234b70', 2, 2),
(3, '21232f297a57a5a743894a0e4a801fc3', 3, 3),
(4, '202cb962ac59075b964b07152d234b70', 4, 4),
(5, '21232f297a57a5a743894a0e4a801fc3', 5, 5),
(6, '21232f297a57a5a743894a0e4a801fc3', 6, 6),
(7, '21232f297a57a5a743894a0e4a801fc3', 7, 7),
(8, '21232f297a57a5a743894a0e4a801fc3', 8, 8),
(9, '21232f297a57a5a743894a0e4a801fc3', 9, 9),
(10, '21232f297a57a5a743894a0e4a801fc3', 10, 10);

-- --------------------------------------------------------

--
-- Estrutura para tabela `meta_aposent`
--

CREATE TABLE `meta_aposent` (
  `idMeta_Aposent` int(11) NOT NULL,
  `Despesa_Mensal` int(11) DEFAULT NULL,
  `Taxa_Inflacao_Desejada` float DEFAULT NULL,
  `Fundo_Necessario` varchar(45) DEFAULT NULL,
  `Data_Criacao` date DEFAULT NULL,
  `Data_Atualizacao` timestamp NULL DEFAULT NULL,
  `Usuario_idUsuario` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Despejando dados para a tabela `meta_aposent`
--

INSERT INTO `meta_aposent` (`idMeta_Aposent`, `Despesa_Mensal`, `Taxa_Inflacao_Desejada`, `Fundo_Necessario`, `Data_Criacao`, `Data_Atualizacao`, `Usuario_idUsuario`) VALUES
(1, 20000, 10, '100000', '2024-10-14', '2024-10-18 03:00:00', 6),
(2, 3000, 2, '1000000', '2024-10-16', '2024-10-18 03:00:00', 6),
(3, 50000, 8, '10000000', '2024-10-17', '2024-10-19 03:00:00', 6),
(4, 70000, 25000, '1234098', '2024-10-17', '2024-10-18 03:00:00', 7),
(5, 40000, 2, '100090', '2024-10-18', '2024-10-25 03:00:00', 8),
(6, 80000, 8, '4000', '2024-10-18', '2024-10-26 03:00:00', 9),
(7, 80000, 8, '4000', '2024-10-18', '2024-10-26 03:00:00', 9),
(8, 70000, 3, '30000', '2024-10-18', '2024-10-31 03:00:00', 10);

-- --------------------------------------------------------

--
-- Estrutura para tabela `plano_aposent`
--

CREATE TABLE `plano_aposent` (
  `idPlano_Aposent` int(11) NOT NULL,
  `Tipo_Planos` varchar(45) DEFAULT NULL,
  `Valor_Plano` int(11) DEFAULT NULL,
  `Data_Criacao` timestamp NULL DEFAULT current_timestamp(),
  `Data_Atual` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Despejando dados para a tabela `plano_aposent`
--

INSERT INTO `plano_aposent` (`idPlano_Aposent`, `Tipo_Planos`, `Valor_Plano`, `Data_Criacao`, `Data_Atual`) VALUES
(1, 'Free', 0, '2024-10-15 05:15:01', '2024-10-15 05:15:01'),
(3, 'Pro', 20000, '2024-10-15 05:15:22', '2024-10-15 05:15:22');

-- --------------------------------------------------------

--
-- Estrutura para tabela `simulacao`
--

CREATE TABLE `simulacao` (
  `idSimulacao` int(11) NOT NULL,
  `Data_Simulacao` date DEFAULT NULL,
  `Fundo_Final` varchar(38) DEFAULT NULL,
  `Data_Criacao` date DEFAULT NULL,
  `Taxa_Sucesso` int(11) DEFAULT NULL,
  `Usuario_idUsuario` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `usuario`
--

CREATE TABLE `usuario` (
  `idUsuario` int(11) NOT NULL,
  `nome` varchar(20) DEFAULT NULL,
  `data_Nasc` date DEFAULT NULL,
  `renda_Atual` int(11) DEFAULT NULL,
  `idade_Aposent` int(11) DEFAULT NULL,
  `data_registo` timestamp NULL DEFAULT current_timestamp(),
  `data_Atualizacao` timestamp NULL DEFAULT current_timestamp(),
  `Plano_Aposent_idPlano_Aposent` int(11) NOT NULL,
  `bilhete` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Despejando dados para a tabela `usuario`
--

INSERT INTO `usuario` (`idUsuario`, `nome`, `data_Nasc`, `renda_Atual`, `idade_Aposent`, `data_registo`, `data_Atualizacao`, `Plano_Aposent_idPlano_Aposent`, `bilhete`) VALUES
(1, 'Cláudio André', '2004-07-19', 25000, 2026, NULL, NULL, 1, '00084LA00045388'),
(2, 'Gaspar Lourenço', '2004-02-26', 20000, 2027, NULL, NULL, 1, '00084LA00045389'),
(3, 'Lúcio José', '2000-02-02', 100, 2028, '2024-10-15 22:27:31', '2024-10-15 22:27:31', 1, '00084LA00045367'),
(4, 'Baia de Luanda', '2004-10-31', 123456, 2024, '2024-10-16 06:57:59', '2024-10-16 06:57:59', 1, '00084LA00045390'),
(5, 'Ramires', '2004-02-10', 100, 2027, '2024-10-16 08:57:35', '2024-10-16 08:57:35', 1, '00084LA00045310'),
(6, 'Eugênio Prego', '2003-07-19', 200, 2028, '2024-10-16 09:20:55', '2024-10-16 09:20:55', 1, '00084LA00045310'),
(7, 'Aldair Cassange', '2003-06-19', 900000, 2028, '2024-10-17 20:29:19', '2024-10-17 20:29:19', 1, '007467LA123456'),
(8, 'Manuel André', '2003-06-20', 1000000, 2028, '2024-10-18 07:30:45', '2024-10-18 07:30:45', 1, '00079LA0987654'),
(9, 'Cláudio Faustino', '2003-07-19', 200000, 2028, '2024-10-18 07:43:22', '2024-10-18 07:43:22', 1, '000987LA345212'),
(10, 'Edson simão Morais', '1998-12-12', 150000, 2028, '2024-10-18 08:28:57', '2024-10-18 08:28:57', 1, '009876LA1234');

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `contato`
--
ALTER TABLE `contato`
  ADD PRIMARY KEY (`idContato`);

--
-- Índices de tabela `despesas`
--
ALTER TABLE `despesas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `usuario_id` (`usuario_id`);

--
-- Índices de tabela `historico_cambio`
--
ALTER TABLE `historico_cambio`
  ADD PRIMARY KEY (`idHistorico_Cambio`);

--
-- Índices de tabela `investimentos`
--
ALTER TABLE `investimentos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `usuario_id` (`usuario_id`);

--
-- Índices de tabela `login`
--
ALTER TABLE `login`
  ADD PRIMARY KEY (`idLogin`),
  ADD KEY `Usuario_idUsuario` (`Usuario_idUsuario`),
  ADD KEY `Contato_idContato` (`Contato_idContato`);

--
-- Índices de tabela `meta_aposent`
--
ALTER TABLE `meta_aposent`
  ADD PRIMARY KEY (`idMeta_Aposent`),
  ADD KEY `Usuario_idUsuario` (`Usuario_idUsuario`);

--
-- Índices de tabela `plano_aposent`
--
ALTER TABLE `plano_aposent`
  ADD PRIMARY KEY (`idPlano_Aposent`);

--
-- Índices de tabela `simulacao`
--
ALTER TABLE `simulacao`
  ADD PRIMARY KEY (`idSimulacao`),
  ADD KEY `Usuario_idUsuario` (`Usuario_idUsuario`);

--
-- Índices de tabela `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`idUsuario`),
  ADD KEY `Plano_Aposent_idPlano_Aposent` (`Plano_Aposent_idPlano_Aposent`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `contato`
--
ALTER TABLE `contato`
  MODIFY `idContato` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de tabela `despesas`
--
ALTER TABLE `despesas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT de tabela `historico_cambio`
--
ALTER TABLE `historico_cambio`
  MODIFY `idHistorico_Cambio` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `investimentos`
--
ALTER TABLE `investimentos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT de tabela `login`
--
ALTER TABLE `login`
  MODIFY `idLogin` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de tabela `meta_aposent`
--
ALTER TABLE `meta_aposent`
  MODIFY `idMeta_Aposent` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de tabela `plano_aposent`
--
ALTER TABLE `plano_aposent`
  MODIFY `idPlano_Aposent` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de tabela `simulacao`
--
ALTER TABLE `simulacao`
  MODIFY `idSimulacao` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `usuario`
--
ALTER TABLE `usuario`
  MODIFY `idUsuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Restrições para tabelas despejadas
--

--
-- Restrições para tabelas `despesas`
--
ALTER TABLE `despesas`
  ADD CONSTRAINT `despesas_ibfk_1` FOREIGN KEY (`usuario_id`) REFERENCES `usuario` (`idUsuario`);

--
-- Restrições para tabelas `investimentos`
--
ALTER TABLE `investimentos`
  ADD CONSTRAINT `investimentos_ibfk_1` FOREIGN KEY (`usuario_id`) REFERENCES `usuario` (`idUsuario`);

--
-- Restrições para tabelas `login`
--
ALTER TABLE `login`
  ADD CONSTRAINT `login_ibfk_1` FOREIGN KEY (`Usuario_idUsuario`) REFERENCES `usuario` (`idUsuario`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `login_ibfk_2` FOREIGN KEY (`Contato_idContato`) REFERENCES `contato` (`idContato`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Restrições para tabelas `meta_aposent`
--
ALTER TABLE `meta_aposent`
  ADD CONSTRAINT `meta_aposent_ibfk_1` FOREIGN KEY (`Usuario_idUsuario`) REFERENCES `usuario` (`idUsuario`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Restrições para tabelas `simulacao`
--
ALTER TABLE `simulacao`
  ADD CONSTRAINT `simulacao_ibfk_1` FOREIGN KEY (`Usuario_idUsuario`) REFERENCES `usuario` (`idUsuario`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Restrições para tabelas `usuario`
--
ALTER TABLE `usuario`
  ADD CONSTRAINT `usuario_ibfk_1` FOREIGN KEY (`Plano_Aposent_idPlano_Aposent`) REFERENCES `plano_aposent` (`idPlano_Aposent`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
