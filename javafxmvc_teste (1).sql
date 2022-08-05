-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Tempo de geração: 05-Ago-2022 às 05:51
-- Versão do servidor: 8.0.21
-- versão do PHP: 7.3.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `javafxmvc_teste`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `categorias`
--

DROP TABLE IF EXISTS `categorias`;
CREATE TABLE IF NOT EXISTS `categorias` (
  `cdCategoria` int NOT NULL AUTO_INCREMENT,
  `descricao` varchar(50) NOT NULL,
  PRIMARY KEY (`cdCategoria`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Extraindo dados da tabela `categorias`
--

INSERT INTO `categorias` (`cdCategoria`, `descricao`) VALUES
(1, 'Eletrônicos'),
(2, 'Vestuário'),
(5, 'Moveis'),
(8, 'Cozinha');

-- --------------------------------------------------------

--
-- Estrutura da tabela `clientes`
--

DROP TABLE IF EXISTS `clientes`;
CREATE TABLE IF NOT EXISTS `clientes` (
  `cdCliente` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(50) NOT NULL,
  `cpf` varchar(50) NOT NULL,
  `telefone` varchar(50) NOT NULL,
  PRIMARY KEY (`cdCliente`)
) ENGINE=MyISAM AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Extraindo dados da tabela `clientes`
--

INSERT INTO `clientes` (`cdCliente`, `nome`, `cpf`, `telefone`) VALUES
(1, 'Rafael', '111.111.111-11', '(11) 1111-1111'),
(2, 'João', '222.222.222-22', '(22) 2222-2222'),
(3, 'Maria', '333.333.333-33', '(33) 3333-3333');

-- --------------------------------------------------------

--
-- Estrutura da tabela `itensdevenda`
--

DROP TABLE IF EXISTS `itensdevenda`;
CREATE TABLE IF NOT EXISTS `itensdevenda` (
  `cdItemDeVenda` int NOT NULL AUTO_INCREMENT,
  `quantidade` int NOT NULL,
  `valor` float NOT NULL,
  `cdProduto` int DEFAULT NULL,
  `cdVenda` int DEFAULT NULL,
  PRIMARY KEY (`cdItemDeVenda`),
  KEY `fk_itensdevenda_produtos` (`cdProduto`),
  KEY `fk_itensdevenda_vendas` (`cdVenda`)
) ENGINE=MyISAM AUTO_INCREMENT=47 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Extraindo dados da tabela `itensdevenda`
--

INSERT INTO `itensdevenda` (`cdItemDeVenda`, `quantidade`, `valor`, `cdProduto`, `cdVenda`) VALUES
(1, 1, 2000, 1, 1),
(2, 1, 3000, 2, 1),
(3, 1, 550, 3, 2),
(4, 1, 215, 4, 2),
(25, 1, 2000, 1, 0),
(46, 4, 4000, 18, 35),
(44, 1, 250.5, 17, 33),
(43, 1, 1000, 18, 33),
(42, 2, 501, 17, 32),
(41, 1, 215, 4, 31),
(40, 2, 501, 17, 30),
(39, 2, 430, 4, 29);

-- --------------------------------------------------------

--
-- Estrutura da tabela `produtos`
--

DROP TABLE IF EXISTS `produtos`;
CREATE TABLE IF NOT EXISTS `produtos` (
  `cdProduto` int NOT NULL AUTO_INCREMENT,
  `nome` varchar(50) NOT NULL,
  `preco` float NOT NULL,
  `quantidade` int NOT NULL,
  `cdCategoria` int NOT NULL,
  PRIMARY KEY (`cdProduto`),
  KEY `fk_produtos_categorias` (`cdCategoria`)
) ENGINE=MyISAM AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Extraindo dados da tabela `produtos`
--

INSERT INTO `produtos` (`cdProduto`, `nome`, `preco`, `quantidade`, `cdCategoria`) VALUES
(1, 'TV 32 Sony', 2000, 7, 1),
(2, 'TV 40 Sony', 3000, 4, 1),
(3, 'Tênis Nike Tri Fusion Run 40', 550, 5, 2),
(4, 'Tênis Adidas Galaxy Trainer 36', 215, 4, 2),
(17, 'Camisa Internacional', 250.5, 5, 2),
(18, 'Placa de video', 1000, 10, 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `vendas`
--

DROP TABLE IF EXISTS `vendas`;
CREATE TABLE IF NOT EXISTS `vendas` (
  `cdVenda` int NOT NULL AUTO_INCREMENT,
  `data` date NOT NULL,
  `valor` float NOT NULL,
  `pago` tinyint(1) NOT NULL,
  `cdCliente` int DEFAULT NULL,
  PRIMARY KEY (`cdVenda`),
  KEY `fk_vendas_clientes` (`cdCliente`)
) ENGINE=MyISAM AUTO_INCREMENT=36 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Extraindo dados da tabela `vendas`
--

INSERT INTO `vendas` (`cdVenda`, `data`, `valor`, `pago`, `cdCliente`) VALUES
(1, '2016-04-30', 5000, 0, 1),
(2, '2016-04-01', 765, 0, 1),
(25, '2022-07-14', 3000, 1, 3),
(30, '2020-07-17', 501, 1, 2),
(29, '2022-07-13', 430, 1, 2),
(31, '2019-07-17', 215, 1, 3),
(32, '2018-07-19', 501, 1, 2),
(33, '2013-07-25', 1250.5, 1, 3),
(35, '2022-08-05', 4000, 1, 3);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
