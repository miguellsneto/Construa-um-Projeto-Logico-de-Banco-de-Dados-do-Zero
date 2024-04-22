-- Criação do Banco de Dados para o cenário de Oficina
DROP DATABASE oficina;
CREATE DATABASE oficina;
USE oficina;

-- criar tabela de tipos de clientes (Pessoa Física / Pessoa Jurídica)
CREATE TABLE clients_type(
	IdClientsType INT PRIMARY KEY,
    TypeDescription VARCHAR(20) NOT NULL
);

-- criar tabela clientes
CREATE TABLE clients(
	IdClients INT PRIMARY KEY AUTO_INCREMENT,
    IdC_ClientsType INT NOT NULL,
    CONSTRAINT fk_clientsType FOREIGN KEY (IdC_ClientsType) REFERENCES clients_type (IdClientsType)
);
ALTER TABLE clients AUTO_INCREMENT=1;

-- criar tabela cliente pessoa física
CREATE TABLE clients_pf(
	IdClient_pf INT NOT NULL AUTO_INCREMENT,
    IdPF_Clients INT NOT NULL,
    Fname VARCHAR(15) NOT NULL,
    Lname VARCHAR(15) NOT NULL,
    Sex ENUM('Masculino','Feminino') NOT NULL,
    CPF CHAR(11) NOT NULL COMMENT 'Restrição 1 CPF por Pessoa Pessoa',
    PublicSpace VARCHAR(50) NOT NULL,
    PSNumber VARCHAR(10) NOT NULL,
    Neighborhood VARCHAR(25) NOT NULL,
    City VARCHAR(25) NOT NULL,
    State CHAR(2) NOT NULL,
    Email VARCHAR(45) NOT NULL,
    FoneNumber CHAR(11) NOT NULL,
    CONSTRAINT pk_client_pf PRIMARY KEY (IdClient_pf),
    CONSTRAINT fk_client_pf FOREIGN KEY (IdPF_Clients) REFERENCES clients (IdClients),
    CONSTRAINT uq_client_pf UNIQUE (CPF)
);
ALTER TABLE clients_pf AUTO_INCREMENT=1;

-- criar tabela cliente pessoa jurídica
CREATE TABLE clients_pj(
	IdClient_pj INT AUTO_INCREMENT,
    IdPJ_Clients INT NOT NULL,
    CorporateReason VARCHAR(50) NOT NULL,
    FantasyName VARCHAR(50) NOT NULL,
    CNPJ CHAR(14) NOT NULL COMMENT 'Restrição 1 CNPJ por Pessoa Jurídica',
    PublicSpace VARCHAR(50) NOT NULL,
    PSNumber VARCHAR(10) NOT NULL,
    Neighborhood VARCHAR(25) NOT NULL,
    City VARCHAR(25) NOT NULL,
    State CHAR(2) NOT NULL,
    Email VARCHAR(45),
    FoneNumber CHAR(11),
	CONSTRAINT pk_client_pj PRIMARY KEY (idClient_pj),
    CONSTRAINT fk_client_pj FOREIGN KEY (IdPJ_Clients) REFERENCES clients (IdClients),
    CONSTRAINT uq_client_pj UNIQUE (CNPJ)
);
ALTER TABLE clients_pj AUTO_INCREMENT=1;

-- criar tabela veículos
CREATE TABLE vehicles(
	IdVehicle INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    IdV_Clients INT NOT NULL,
    Vplate CHAR(8),
    Vbrand VARCHAR(20),
    Vmodel VARCHAR(20),
    Vyear INT,
    CONSTRAINT fk_V_Clients FOREIGN KEY (IdV_Clients) REFERENCES clients (IdClients),
    CONSTRAINT uq_vehicle UNIQUE (Vplate)
);
ALTER TABLE vehicles AUTO_INCREMENT=1;

-- criar tabela oficina
CREATE TABLE vehicle_workshop(
	IdVWorkshop INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    VWname VARCHAR(50) NOT NULL,
    CNPJ VARCHAR(14) NOT NULL COMMENT 'Restrição 1 CNPJ por Pessoa Jurídica',
    PublicSpace VARCHAR(50) NOT NULL,
    PSNumber VARCHAR(10) NOT NULL,
    Neighborhood VARCHAR(25) NOT NULL,
    City VARCHAR(25) NOT NULL,
    State CHAR(2) NOT NULL,
    Email VARCHAR(45),
    FoneNumber CHAR(11),
    CONSTRAINT uq_vehicleWorkshop UNIQUE (CNPJ)
);
ALTER TABLE vehicle_workshop AUTO_INCREMENT=1;

-- criar tabela equipe
CREATE TABLE team(
	IdTeam INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
	TDescription VARCHAR(30)
);
ALTER TABLE team AUTO_INCREMENT=1;

-- criar tabela mecânico
CREATE TABLE mechanics(
	IdMechanic INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    MCode INT NOT NULL,
    Mname VARCHAR(45),
	Specialty VARCHAR (30)
);
ALTER TABLE mechanics AUTO_INCREMENT=1;

-- criar tabela team x mecânico
CREATE TABLE team_x_mechanic(
	IdTxM_Team INT,
    IdTxM_Mechanic INT,
    PRIMARY KEY (IdTxM_Team, IdTxM_Mechanic),
    CONSTRAINT fk_TxM_Team FOREIGN KEY (IdTxM_Team) REFERENCES team (IdTeam),
    CONSTRAINT fk_TxM_Mechanic FOREIGN KEY (IdTxM_Mechanic) REFERENCES mechanics (IDMechanic)
    );

-- criar tabela ordem de serviço
CREATE TABLE orders_service(
	IdOrderService INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    IdOS_Vehicle INT NOT NULL,
    IdOS_VWorkshop INT NOT NULL,
    IdOS_Team INT NOT NULL,
    OpeningDate DATE NOT NULL,
    DeliveryDate DATE NOT NULL,
    Amount FLOAT NOT NULL,
    CONSTRAINT fk_orders_service_vehicle FOREIGN KEY (IdOS_Vehicle) REFERENCES vehicles(IdVehicle),
    CONSTRAINT fk_orders_service_vworkshop FOREIGN KEY (IdOS_VWorkshop) REFERENCES vehicle_workshop (IdVWorkshop),
    CONSTRAINT fk_orders_service_team FOREIGN KEY (IdOS_Team) REFERENCES team (IdTeam)
);
ALTER TABLE orders_service AUTO_INCREMENT=1;

-- criar tabela peças
CREATE TABLE parts(
	IdPart INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
	PDescription VARCHAR(50) NOT NULL,
	Price FLOAT NOT NULL
);
ALTER TABLE parts AUTO_INCREMENT=1;

-- criar tabela ordem de serviço x peças
CREATE TABLE order_service_x_parts(
	IdOSxP_OrderService INT NOT NULL,
    IdOSxP_Part INT NOT NULL,
    PRIMARY KEY (IdOSxP_OrderService, IdOSxP_Part),
    CONSTRAINT fk_OSxP_OrderService FOREIGN KEY (IdOSxP_OrderService) REFERENCES orders_service (IdOrderService),
    CONSTRAINT fk_OSxP_Part FOREIGN KEY (IdOSxP_Part) REFERENCES parts (IdPart)
);

-- criar tabela mão de obra
CREATE TABLE labor(
	IdLabor INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    LValor FLOAT NOT NULL
);
ALTER TABLE labor AUTO_INCREMENT=1;

-- criar tabela tipo de serviço
CREATE TABLE type_service(
	IdTypeService INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    IDTS_Labor INT NOT NULL,
    TSDescription VARCHAR(100),
    CONSTRAINT fk_TS_Labor FOREIGN KEY (IDTS_Labor) REFERENCES labor (IdLabor)
);
ALTER TABLE type_service AUTO_INCREMENT=1;

-- criar tabela ordem de serviço x tipo de serviço
CREATE TABLE order_service_x_type_service(
	IdOSxTS_OrderService INT NOT NULL,
    IdOSxTS_TypeService INT NOT NULL,
    PRIMARY KEY (IdOSxTS_OrderService, IdOSxTS_TypeService),
    CONSTRAINT fk_OSxTS_OrderService FOREIGN KEY (IdOSxTS_OrderService) REFERENCES orders_service (IdOrderService),
    CONSTRAINT fk_OS_TS_TypeService FOREIGN KEY (IdOSxTS_TypeService) REFERENCES type_service (IdTypeService)
);
