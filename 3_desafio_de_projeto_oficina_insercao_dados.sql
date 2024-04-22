-- INSERÇÃO DE DADOS
USE oficina;

-- inserir o tipo de Cliente (Pessoa Física / Pessoa Jurídica) na tabela clients_type
INSERT INTO clients_type(idClientsType, typeDescription)
	VALUES
		(1, 'Pessoa Física'),
        (2, 'Pessoa Jurídica');

-- inserir os respectivos tipos de clientes na tabela clients
INSERT INTO clients(IdC_ClientsType)
	VALUES
		(1),(1),(1),(1),(1),(2),(2),(2),(2),(2);

-- Inserir dados na tabela Cliente Pessoa Física (clients_pf)
INSERT INTO clients_pf(IdPF_Clients, Fname, Lname, Sex, CPF, PublicSpace, PSNumber, Neighborhood, City, State, Email, FoneNumber)
	VALUES
		(1,'Cláudio','Silva','Masculino','12345678912','Rua Santos Dummont','434','Aflitos','Recife','PE','clausilva@email.com','81999512323'),
		(2,'Manoel','Souza','Masculino','32165498721','Avenida das Artes','777','Casa Caiada','Olinda','PE','manosouza@email.com','81987541542'),
        (3,'Luciana','Pedrozza','Feminino','65415975332','Rua Canto da Sereia','13','Piedade','Jaboatão dos Guaratapes','PE','lupedrozza@email.com','81985214587'),
        (4,'Patrícia','Goes','Feminino','75395185256','Rua da Paz','999','Afogados','Recife','PE','patgoes@email.com','81982574598'),
        (5,'Samantha','Pereira','Feminino','45678912351','Avenida da Serenidade','421','Ouro Preto','Olinda','PE','samanthapere@email.com','81985917532');

-- Inserir dados na tabela Cliente Pessoa Jurídica (clients_pj)
INSERT INTO clients_pj(IdPJ_Clients, CorporateReason, FantasyName, CNPJ, PublicSpace, PSNumber, Neighborhood, City, State, Email, FoneNumber)
	VALUES
		(6,'LocaCar LTDA','Locação de Carros de Passeio','15528645000185','Avenida Caxangá','4643','Iputinga','Recife','PE','locacar@email,com','81982515214'),
        (7,'RentBus LTDA','Ônibus toda hora','52842862000145','Avenida Mascarenhas de Moraes','452','Imbiribeira','Recife','PE','rentbus@email.com','81985247548'),
        (8,'Preserv Ambiental LTDA','Paisagismo e Limpeza Urbana S/A','35842753000148','Avenida Ruy Barbosa','485','Casa Forte','Recife','PE','preserv@email.com','81994359428'),
        (9,'Curupira Trasportes LTDA','Trasnportadora Curupira de Produtos Naturais','75456987000115','Rua da Biblioteca','69','Dois Irmãos','Recife','PE','curupa@email.com','81995129632'),
        (10,'Axé Distribuidora S/A','Axé Distribuidora de Bebidas','45894585000129','Rua do Axé','12','Varadouro','Olinda','PE','axe@email.com','81985212547');

-- Inserir dados na tabela Veículos
INSERT INTO vehicles(IdV_Clients, Vplate, Vbrand, Vmodel,Vyear)
	VALUES
		(1,'KXA-6176','Ford','Ka',2015),
        (2,'KWG-7374','Volkswagen','GOL',2019),
        (3,'KAM-8384','Fiat','Palio',2002),
        (4,'KLA-2323','Chevrolet','Onix',2022),
        (5,'KDK-4344','Renault','Logan',2024),
        (6,'KSD-5453','Renault','Sandero',2020),
        (7,'KAS-6252','Scania','R480',2018),
        (8,'KMM-3945','Mercedes-Benz','Actroz 2653',2023),
        (9,'KAA-3455','Volvo','FH',2024),
        (10,'KSD-5353','Scania','P360',2024),
        (1,'JFD-3454','Renault','Sandero',2017),
        (2,'HHF-7655','Fiat','Marea',2021),
        (3,'DSL-4366','Ford','Focus',2012),
        (6,'UOE-8787','Volkswagen','Polo',2016),
        (7,'DEP-7977','Ford','EcoSport',2019);

-- Inserir dados na tabela Oficinas
INSERT INTO vehicle_workshop(VWname, CNPJ, PublicSpace, PSNumber, Neighborhood, City, State, Email, FoneNumber)
	VALUES
		('Centro Automotivo','43928384000185','Rua do Girassol','342','Afogados','Recife','PE','centroauto@email.com','81987234512'),
        ('Tudo em Peças','23848020000109','Rua da Alegria','232','Imbiribeira','Recife','PE','tudopecas@email.com','81994358387'),
        ('UTI do Automóvel','23982018000123','Rua da Junta','42','Jardim São Paulo','Recife','PE','utiauto@email.com','81989392934');

-- Inserir dados na tabela Equipe
INSERT INTO team(TDescription)
	VALUES
		('Mecânica'), ('Elétrica');

-- Inserir dados na tabela Mecânicos
INSERT INTO mechanics(MCode, Mname, Specialty)
	VALUES
		(150, 'Marcos Aurélio', 'Motor'),
        (250, 'Tiago José', 'Suspensão'),
        (350, 'Cláudio Fernando', 'Hidráulica'),
        (450, 'Laura Meireles', 'Elétrica Geral'),
        (550, 'Rosana Rocha', 'Ignição');

-- Inserir dados na tabela Equipe x Mecânicos
INSERT INTO team_x_mechanic(IdTxM_Team, IdTxM_Mechanic)
	VALUES
		(1,1), (1,2), (1,3), (2,4), (2,5);

-- Inserir dados na tabela Ordem de Serviço
INSERT INTO orders_service(IdOS_Vehicle, IdOS_VWorkshop, IdOS_Team, OpeningDate, DeliveryDate, Amount)
	VALUES
		(1, 1, 1, "2024-03-15", "2024-03-17", 350.00),
		(2, 2, 2, "2024-01-22", "2024-01-25", 250.00),
		(3, 3, 2, "2024-02-25", "2024-02-27", 450.00),
        (4, 2, 1, "2024-04-10", "2024-04-12", 300.00),
        (5, 3, 2, "2024-02-25", "2024-02-27", 450.00),
        (6, 3, 2, "2024-03-20", "2024-03-21", 500.00),
        (7, 3, 2, "2024-01-20", "2024-01-28", 150.00),
        (8, 2, 1, "2024-02-03", "2024-02-05", 270.00),
        (9, 1, 1, "2024-03-20", "2024-03-21", 220.00),
        (10, 3, 2, "2024-01-20", "2024-01-28", 170.00),
        (11, 2, 1, "2024-02-03", "2024-02-05", 120.00),
        (12, 2, 1, "2024-02-03", "2024-02-05", 270.00),
        (13, 1, 1, "2024-03-20", "2024-03-21", 220.00),
        (14, 3, 2, "2024-01-20", "2024-01-28", 170.00),
        (15, 2, 1, "2024-02-03", "2024-02-05", 120.00);

-- Inserir dados na tabela Peças
INSERT INTO parts(PDescription, Price)
	VALUES
		('Óleo Motor', 120.00),
        ('Kit Ignição', 300.00),
        ('Kit Suspensão', 450.00);

-- Inserir dados na tabela Ordem de Serviço x Peças
INSERT INTO order_service_x_parts(IdOSxP_OrderService, IdOSxP_Part)
	VALUES
		(1,1),(2,2),(3,2),(4,3),(5,2),(6,2),(7,2),(8,1),(9,1),(10,2),(11,1),(12,1),(13,3),(14,2),(15,3);

-- Inserir dados na tabela Mão de Obra
INSERT INTO labor(LValor)
	VALUES
		(50.00),(75.00),(100.00);

-- Inserir dados na tabela Tipos de Serviço
INSERT INTO type_service(IDTS_Labor,TSDescription)
	VALUES
		(1, 'Troca de Óleo'),
        (2, 'Troca do Kit de Ignição'),
        (3, 'Reparos na Suspensão');

-- Inserir dados na tabela Ordem de Serviço x Tipos de Serviço
DESC order_service_x_type_service;
INSERT INTO order_service_x_type_service(IdOSxTS_OrderService, IdOSxTS_TypeService)
	VALUES
		(1,1),(2,2),(3,2),(4,3),(5,2),(6,2),(7,2),(8,1),(9,1),(10,2),(11,1),(12,1),(13,3),(14,2),(15,3);
SHOW TABLE STATUS;