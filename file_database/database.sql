

-- $servername = "127.0.0.1";
-- $username = "root";
-- $password = "";
-- $dbname = "romanrisiko";

-- --------------------------------------------------------

--
-- Struttura della tabella `active`
--

CREATE TABLE `active` (
  `id` int(11) NOT NULL,
  `user` varchar(255) NOT NULL,
  `session_id` int(11) DEFAULT NULL,
  `card1` int(11) DEFAULT NULL,
  `card2` int(11) DEFAULT NULL,
  `card3` int(11) DEFAULT NULL,
  `card4` int(11) DEFAULT NULL,
  `card5` int(11) DEFAULT NULL,
  `card6` int(11) DEFAULT NULL,
  `card7` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struttura della tabella `card`
--

CREATE TABLE `card` (
  `number` int(11) NOT NULL,
  `task` varchar(500) NOT NULL,
  `power_up` int(11) DEFAULT NULL,
  `completed` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struttura della tabella `map`
--

CREATE TABLE `map` (
  `map_id` int(11) NOT NULL,
  `m1` int(11) DEFAULT NULL,
  `m2` int(11) DEFAULT NULL,
  `m3` int(11) DEFAULT NULL,
  `m4` int(11) DEFAULT NULL,
  `m5` int(11) DEFAULT NULL,
  `m6` int(11) DEFAULT NULL,
  `m7` int(11) DEFAULT NULL,
  `m8` int(11) DEFAULT NULL,
  `m9` int(11) DEFAULT NULL,
  `m10` int(11) DEFAULT NULL,
  `m11` int(11) DEFAULT NULL,
  `m12` int(11) DEFAULT NULL,
  `m13` int(11) DEFAULT NULL,
  `m14` int(11) DEFAULT NULL,
  `m15` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struttura della tabella `player`
--

CREATE TABLE `player` (
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Struttura della tabella `session`
--

CREATE TABLE `session` (
  `code` int(11) NOT NULL,
  `start_time` datetime NOT NULL,
  `end_time` datetime NOT NULL,
  `map` int(11) DEFAULT NULL,
  `player1` int(11) DEFAULT NULL,
  `player2` int(11) DEFAULT NULL,
  `player3` int(11) DEFAULT NULL,
  `player4` int(11) DEFAULT NULL,
  `player5` int(11) DEFAULT NULL,
  `player6` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indici per le tabelle scaricate
--

--
-- Indici per le tabelle `active`
--
ALTER TABLE `active`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user` (`user`),
  ADD KEY `card1` (`card1`),
  ADD KEY `card2` (`card2`),
  ADD KEY `card3` (`card3`),
  ADD KEY `card4` (`card4`),
  ADD KEY `card5` (`card5`),
  ADD KEY `card6` (`card6`),
  ADD KEY `card7` (`card7`);

--
-- Indici per le tabelle `card`
--
ALTER TABLE `card`
  ADD PRIMARY KEY (`number`);

--
-- Indici per le tabelle `map`
--
ALTER TABLE `map`
  ADD PRIMARY KEY (`map_id`);


--
-- Indici per le tabelle `player`
--
ALTER TABLE `player`
  ADD PRIMARY KEY (`username`);

--
-- Indici per le tabelle `session`
--
ALTER TABLE `session`
  ADD PRIMARY KEY (`code`,`start_time`,`end_time`),
  ADD UNIQUE KEY `player1` (`player1`),
  ADD UNIQUE KEY `player2` (`player2`),
  ADD UNIQUE KEY `player3` (`player3`),
  ADD UNIQUE KEY `player4` (`player4`),
  ADD UNIQUE KEY `player5` (`player5`),
  ADD UNIQUE KEY `player6` (`player6`),
  ADD KEY `map` (`map`);

--
-- Limiti per le tabelle scaricate
--

--
-- Limiti per la tabella `active`
--
ALTER TABLE `active`
  ADD CONSTRAINT `active_ibfk_1` FOREIGN KEY (`user`) REFERENCES `player` (`username`),
  ADD CONSTRAINT `active_ibfk_2` FOREIGN KEY (`card1`) REFERENCES `card` (`number`),
  ADD CONSTRAINT `active_ibfk_3` FOREIGN KEY (`card2`) REFERENCES `card` (`number`),
  ADD CONSTRAINT `active_ibfk_4` FOREIGN KEY (`card3`) REFERENCES `card` (`number`),
  ADD CONSTRAINT `active_ibfk_5` FOREIGN KEY (`card4`) REFERENCES `card` (`number`),
  ADD CONSTRAINT `active_ibfk_6` FOREIGN KEY (`card5`) REFERENCES `card` (`number`),
  ADD CONSTRAINT `active_ibfk_7` FOREIGN KEY (`card6`) REFERENCES `card` (`number`),
  ADD CONSTRAINT `active_ibfk_8` FOREIGN KEY (`card7`) REFERENCES `card` (`number`);

--
-- Limiti per la tabella `map`
--
ALTER TABLE `map`
  ADD CONSTRAINT `map_ibfk_1` FOREIGN KEY (`m1`) REFERENCES `active` (`id`),
  ADD CONSTRAINT `map_ibfk_10` FOREIGN KEY (`m10`) REFERENCES `active` (`id`),
  ADD CONSTRAINT `map_ibfk_11` FOREIGN KEY (`m11`) REFERENCES `active` (`id`),
  ADD CONSTRAINT `map_ibfk_12` FOREIGN KEY (`m12`) REFERENCES `active` (`id`),
  ADD CONSTRAINT `map_ibfk_13` FOREIGN KEY (`m13`) REFERENCES `active` (`id`),
  ADD CONSTRAINT `map_ibfk_14` FOREIGN KEY (`m14`) REFERENCES `active` (`id`),
  ADD CONSTRAINT `map_ibfk_15` FOREIGN KEY (`m15`) REFERENCES `active` (`id`),
  ADD CONSTRAINT `map_ibfk_2` FOREIGN KEY (`m2`) REFERENCES `active` (`id`),
  ADD CONSTRAINT `map_ibfk_3` FOREIGN KEY (`m3`) REFERENCES `active` (`id`),
  ADD CONSTRAINT `map_ibfk_4` FOREIGN KEY (`m4`) REFERENCES `active` (`id`),
  ADD CONSTRAINT `map_ibfk_5` FOREIGN KEY (`m5`) REFERENCES `active` (`id`),
  ADD CONSTRAINT `map_ibfk_6` FOREIGN KEY (`m6`) REFERENCES `active` (`id`),
  ADD CONSTRAINT `map_ibfk_7` FOREIGN KEY (`m7`) REFERENCES `active` (`id`),
  ADD CONSTRAINT `map_ibfk_8` FOREIGN KEY (`m8`) REFERENCES `active` (`id`),
  ADD CONSTRAINT `map_ibfk_9` FOREIGN KEY (`m9`) REFERENCES `active` (`id`);

--
-- Limiti per la tabella `session`
--
ALTER TABLE `session`
  ADD CONSTRAINT `session_ibfk_1` FOREIGN KEY (`player1`) REFERENCES `active` (`id`),
  ADD CONSTRAINT `session_ibfk_2` FOREIGN KEY (`player2`) REFERENCES `active` (`id`),
  ADD CONSTRAINT `session_ibfk_3` FOREIGN KEY (`player3`) REFERENCES `active` (`id`),
  ADD CONSTRAINT `session_ibfk_4` FOREIGN KEY (`player4`) REFERENCES `active` (`id`),
  ADD CONSTRAINT `session_ibfk_5` FOREIGN KEY (`player5`) REFERENCES `active` (`id`),
  ADD CONSTRAINT `session_ibfk_6` FOREIGN KEY (`player6`) REFERENCES `active` (`id`),
  ADD CONSTRAINT `session_ibfk_7` FOREIGN KEY (`map`) REFERENCES `map` (`map_id`);
