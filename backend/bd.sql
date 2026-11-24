-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 24/11/2026 às 13:23
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
-- Banco de dados: `moodtracker`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `logs_auditoria`
--

CREATE TABLE `logs_auditoria` (
  `id` int(11) NOT NULL,
  `usuario_id` int(11) DEFAULT NULL,
  `acao` varchar(50) NOT NULL,
  `recurso` varchar(50) DEFAULT NULL,
  `recurso_id` int(11) DEFAULT NULL,
  `detalhes` text DEFAULT NULL,
  `ip` varchar(45) DEFAULT NULL,
  `user_agent` varchar(255) DEFAULT NULL,
  `criado_em` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Despejando dados para a tabela `logs_auditoria`
--

INSERT INTO `logs_auditoria` (`id`, `usuario_id`, `acao`, `recurso`, `recurso_id`, `detalhes`, `ip`, `user_agent`, `criado_em`) VALUES
(1, 4, 'CADASTRO', 'USUARIO', 4, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/158.0.0.0 Safari/537.36', '2026-11-24 12:17:26'),
(2, 4, 'LOGIN', 'AUTENTICACAO', NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/158.0.0.0 Safari/537.36', '2026-11-24 12:17:29'),
(3, 4, 'VISUALIZAR_REGISTROS', 'REGISTROS', NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/158.0.0.0 Safari/537.36', '2026-11-24 12:17:29'),
(4, 4, 'CRIAR_REGISTRO', 'REGISTRO', 5, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/158.0.0.0 Safari/537.36', '2026-11-24 12:17:41'),
(5, 4, 'VISUALIZAR_REGISTROS', 'REGISTROS', NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/158.0.0.0 Safari/537.36', '2026-11-24 12:17:41'),
(6, 4, 'CRIAR_REGISTRO', 'REGISTRO', 6, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/158.0.0.0 Safari/537.36', '2026-11-24 12:19:00'),
(7, 4, 'VISUALIZAR_REGISTROS', 'REGISTROS', NULL, NULL, '::1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/158.0.0.0 Safari/537.36', '2026-11-24 12:19:00');

-- --------------------------------------------------------

--
-- Estrutura para tabela `registros`
--

CREATE TABLE `registros` (
  `id` int(11) NOT NULL,
  `data` date NOT NULL,
  `horario` time NOT NULL,
  `humor` varchar(50) NOT NULL,
  `intensidade` int(11) NOT NULL,
  `atividade` varchar(255) DEFAULT NULL,
  `acontecimento` text DEFAULT NULL,
  `gatilho` varchar(255) DEFAULT NULL,
  `observacao` text DEFAULT NULL,
  `usuario_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Despejando dados para a tabela `registros`
--

INSERT INTO `registros` (`id`, `data`, `horario`, `humor`, `intensidade`, `atividade`, `acontecimento`, `gatilho`, `observacao`, `usuario_id`) VALUES
(1, '2026-11-24', '08:02:00', 'Animada', 5, 'Estudando ', 'não', 'meus maravilhosos amigos', '', 1),
(2, '2026-11-24', '08:06:00', 'Triste', 9, 'Chorando', 'Não', 'Atividades', '', 1),
(3, '2026-11-24', '08:29:00', 'Tranquila', 7, 'Lendo um bom livro', 'Os personagens finalmente se resolveram ', 'Está calmo e pacifico na minha casa', 'Tudo certoooo!', 2),
(4, '2026-11-24', '08:49:00', 'Confusa', 2, 'Estudando programação', 'React é muito legal, mas é meio complicado', 'Falta de materiais para ajudar', 'nada não', 3),
(5, '2026-11-24', '09:06:00', 'Confusa', 5, 'sad', 'ASSDCA', 'A', 'ZX', 4),
(6, '2026-11-24', '09:17:00', 'Tranquila', 9, 'XZ', 'zxc Rh', 'xzct 8une4k', ' 4xmcel', 4);

-- --------------------------------------------------------

--
-- Estrutura para tabela `usuarios`
--

CREATE TABLE `usuarios` (
  `id` int(11) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `email` varchar(150) NOT NULL,
  `pin_hash` varchar(255) NOT NULL,
  `criado_em` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Despejando dados para a tabela `usuarios`
--

INSERT INTO `usuarios` (`id`, `nome`, `email`, `pin_hash`, `criado_em`) VALUES
(1, 'Santana', 'leti@gmail.com', '$2b$10$0TDq.nWtOHcBu8w9hGJak.Mt4ZyA2KgchMpyOzKH3HBjaAYhPDyFC', '2026-11-24 11:05:09'),
(2, 'Maria Julia', 'mariaaa@gmail.com', '$2b$10$Alm9uYLwdDCF409zAXGBYeE5tfGCCdZ/iCBCRXQgnxd.R4wEck/yi', '2026-11-24 11:48:35'),
(3, 'Matheus', 'matt21@gmail.com', '$2b$10$GFx7VAogR3a/1XpaJhyadOAYuXe1IvPFF7gdwc87.zVm/yPWzgTRG', '2026-11-24 12:05:47'),
(4, 'João', 'joao@gmail.com', '$2b$10$KfN7MCxkiYynJdkMFvTRnOGcaA/y7mpjL5e4CczzLG65uD6DNzSAK', '2026-11-24 12:17:26');

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `logs_auditoria`
--
ALTER TABLE `logs_auditoria`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_logs_usuario` (`usuario_id`);

--
-- Índices de tabela `registros`
--
ALTER TABLE `registros`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_registros_usuarios` (`usuario_id`);

--
-- Índices de tabela `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `logs_auditoria`
--
ALTER TABLE `logs_auditoria`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de tabela `registros`
--
ALTER TABLE `registros`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de tabela `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Restrições para tabelas despejadas
--

--
-- Restrições para tabelas `logs_auditoria`
--
ALTER TABLE `logs_auditoria`
  ADD CONSTRAINT `fk_logs_usuario` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`) ON DELETE SET NULL;

--
-- Restrições para tabelas `registros`
--
ALTER TABLE `registros`
  ADD CONSTRAINT `fk_registros_usuarios` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
