-- Consultas SQL
USE oficina;
SHOW TABLES;

-- Recuperações simples com SELECT Statement
SELECT * FROM clients;
SELECT * FROM clients_pf;
SELECT * FROM clients_pj;
SELECT * FROM clients_type;
SELECT * FROM labor;
SELECT * FROM mechanics;
SELECT * FROM order_service_x_parts;
SELECT * FROM order_service_x_type_service;
SELECT * FROM orders_service;
SELECT * FROM parts;
SELECT * FROM team;
SELECT * FROM team_x_mechanic;
SELECT * FROM type_service;
SELECT * FROM vehicle_workshop;
SELECT * FROM vehicles;

-- Filtros com WHERE Statement
-- Quais clientes pessoa física pertencem à cidade de Recife (retornando Nome Completo, Telefone e Cidade)
SELECT concat(Fname, " ", Lname) AS Nome_completo, PF_FoneNumber AS Telefone, PF_City AS Cidade FROM clients_pf
	WHERE PF_City ="Recife";

-- Quantos veículos possuem ano de fabricação entre 2020 e 2023  ordenados por ano
desc vehicles;
SELECT count(*) AS Quantidade_de_Veículos, VYear AS Ano
	FROM vehicles
    WHERE VYear > 2019 AND VYear < 2024
    GROUP BY VYear
    ORDER BY VYear;

-- Quais clientes pessoa física estão presentes na Ofina 1 (retornando Nome Completo, Telefone, Cidade do Cliente, Nome da Oficina e Cidade da Oficina)
SELECT concat(Fname, " ", Lname) AS Nome_Completo, PF_FoneNumber AS Telefone, PF_City AS Cidade_Cliente, VWname AS Oficina, VW_City AS Cidade_Oficina
		FROM clients_pf
		INNER JOIN vehicle_workshop
        ON IdVWorkshop = 1;