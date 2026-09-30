/* ============================================================
   PROJETO: AUTOTECHNOLOGY EXPRESS
   BANCO DE DADOS: oficina_mecanica_db

   DDL = criação do banco e tabelas
   DML = INSERT, UPDATE, DELETE e SELECT

   SGBD: Microsoft SQL Server
   ============================================================ */


/* ============================================================
   1. EXCLUSÃO DO BANCO, CASO JÁ EXISTA
   ============================================================ */

USE master;
GO

IF DB_ID('oficina_mecanica_db') IS NOT NULL
BEGIN
    ALTER DATABASE oficina_mecanica_db
    SET SINGLE_USER
    WITH ROLLBACK IMMEDIATE;

    DROP DATABASE oficina_mecanica_db;
END;
GO


/* ============================================================
   2. CRIAÇÃO DO BANCO DE DADOS
   ============================================================ */

CREATE DATABASE oficina_mecanica_db;
GO


/* ============================================================
   3. SELECIONAR O BANCO
   ============================================================ */

USE oficina_mecanica_db;
GO


/* ============================================================
   4. CRIAÇÃO DA TABELA CLIENTES
   ============================================================ */

CREATE TABLE Clientes
(
    id_cliente INT IDENTITY(1,1) PRIMARY KEY,

    nome VARCHAR(100) NOT NULL,

    cpf VARCHAR(14) NOT NULL UNIQUE,

    telefone VARCHAR(20) NOT NULL,

    email VARCHAR(100) NOT NULL,

    logradouro VARCHAR(150) NOT NULL,

    numero VARCHAR(10) NOT NULL,

    bairro VARCHAR(80) NOT NULL,

    cidade VARCHAR(80) NOT NULL,

    estado CHAR(2) NOT NULL,

    cep VARCHAR(9) NOT NULL
);
GO


/* ============================================================
   5. CRIAÇÃO DA TABELA VEICULOS
   ============================================================ */

CREATE TABLE Veiculos
(
    id_veiculo INT IDENTITY(1,1) PRIMARY KEY,

    id_cliente INT NOT NULL,

    placa VARCHAR(7) NOT NULL UNIQUE,

    marca VARCHAR(50) NOT NULL,

    modelo VARCHAR(50) NOT NULL,

    ano_fabricacao INT NOT NULL,

    chassi VARCHAR(17) NOT NULL UNIQUE,

    CONSTRAINT FK_Veiculos_Clientes
        FOREIGN KEY (id_cliente)
        REFERENCES Clientes(id_cliente)
);
GO


/* ============================================================
   6. CRIAÇÃO DA TABELA MECANICOS
   ============================================================ */

CREATE TABLE Mecanicos
(
    id_mecanico INT IDENTITY(1,1) PRIMARY KEY,

    nome VARCHAR(100) NOT NULL,

    cpf VARCHAR(14) NOT NULL UNIQUE,

    telefone VARCHAR(20) NOT NULL,

    email VARCHAR(100) NOT NULL,

    data_contratacao DATE NOT NULL,

    funcao VARCHAR(100) NOT NULL
);
GO


/* ============================================================
   7. CRIAÇÃO DA TABELA ORDENS DE SERVIÇO
   ============================================================ */

CREATE TABLE OrdensServico
(
    id_ordem_servico INT IDENTITY(1,1) PRIMARY KEY,

    id_veiculo INT NOT NULL,

    id_mecanico INT NOT NULL,

    data_abertura DATETIME NOT NULL,

    estimativa_entrega DATETIME NOT NULL,

    descricao_servicos VARCHAR(500) NOT NULL,

    valor_total DECIMAL(10,2) NOT NULL,

    status VARCHAR(20) NOT NULL,

    CONSTRAINT FK_OrdensServico_Veiculos
        FOREIGN KEY (id_veiculo)
        REFERENCES Veiculos(id_veiculo),

    CONSTRAINT FK_OrdensServico_Mecanicos
        FOREIGN KEY (id_mecanico)
        REFERENCES Mecanicos(id_mecanico)
);
GO


/* ============================================================
   8. INSERÇÃO DOS CLIENTES
   ============================================================ */

INSERT INTO Clientes
(
    nome,
    cpf,
    telefone,
    email,
    logradouro,
    numero,
    bairro,
    cidade,
    estado,
    cep
)
VALUES
(
    'João da Silva',
    '123.456.789-00',
    '(14) 99876-1234',
    'joao.silva@email.com',
    'Rua das Flores',
    '100',
    'Centro',
    'Botucatu',
    'SP',
    '18600-000'
);

SELECT * FROM Clientes;
GO


INSERT INTO Clientes
(
    nome,
    cpf,
    telefone,
    email,
    logradouro,
    numero,
    bairro,
    cidade,
    estado,
    cep
)
VALUES
(
    'Mariana de Oliveira',
    '987.654.321-00',
    '(14) 99123-4567',
    'mariana.oliveira@email.com',
    'Rua das Acácias',
    '250',
    'Vila Nova',
    'Pardinho',
    'SP',
    '18640-000'
);

SELECT * FROM Clientes;
GO


INSERT INTO Clientes
(
    nome,
    cpf,
    telefone,
    email,
    logradouro,
    numero,
    bairro,
    cidade,
    estado,
    cep
)
VALUES
(
    'Carlos Menezes',
    '321.987.654-11',
    '(14) 99654-3210',
    'carlos.mennezis@email.com',
    'Avenida Brasil',
    '500',
    'Centro',
    'São Manuel',
    'SP',
    '18650-000'
);

SELECT * FROM Clientes;
GO


INSERT INTO Clientes
(
    nome,
    cpf,
    telefone,
    email,
    logradouro,
    numero,
    bairro,
    cidade,
    estado,
    cep
)
VALUES
(
    'Ana Beatriz de Souza',
    '456.789.123-22',
    '(14) 99444-8899',
    'ana.souza@email.com',
    'Rua dos Ipês',
    '75',
    'Jardim Paraíso',
    'Botucatu',
    'SP',
    '18600-000'
);

SELECT * FROM Clientes;
GO


/* ============================================================
   9. INSERÇÃO DOS VEÍCULOS
   ============================================================

   id_cliente:
   1 = João da Silva
   2 = Mariana de Oliveira
   3 = Carlos Menezes
   4 = Ana Beatriz de Souza
   ============================================================ */

INSERT INTO Veiculos
(
    id_cliente,
    placa,
    marca,
    modelo,
    ano_fabricacao,
    chassi
)
VALUES
(
    1,
    'ABC1A23',
    'Fiat',
    'Uno',
    2015,
    '9BWZZZ377VT004251'
);

SELECT * FROM Veiculos;
GO


INSERT INTO Veiculos
(
    id_cliente,
    placa,
    marca,
    modelo,
    ano_fabricacao,
    chassi
)
VALUES
(
    2,
    'XYZ9Z99',
    'Chevrolet',
    'Onix',
    2020,
    '9BG116GW04C400001'
);

SELECT * FROM Veiculos;
GO


INSERT INTO Veiculos
(
    id_cliente,
    placa,
    marca,
    modelo,
    ano_fabricacao,
    chassi
)
VALUES
(
    3,
    'JKL3D45',
    'Toyota',
    'Corolla',
    2018,
    '8AJZZZ123J1234567'
);

SELECT * FROM Veiculos;
GO


INSERT INTO Veiculos
(
    id_cliente,
    placa,
    marca,
    modelo,
    ano_fabricacao,
    chassi
)
VALUES
(
    4,
    'QWE7E77',
    'Honda',
    'Fit',
    2017,
    '93HGE8850EZ500123'
);

SELECT * FROM Veiculos;
GO


/* ============================================================
   10. INSERÇÃO DOS MECÂNICOS
   ============================================================ */

INSERT INTO Mecanicos
(
    nome,
    cpf,
    telefone,
    email,
    data_contratacao,
    funcao
)
VALUES
(
    'Rafael dos Santos',
    '888.999.000-11',
    '(14) 99777-1234',
    'rafael.santos@autotechnology.com',
    '2025-01-01',
    'Mecânico Geral'
);

SELECT * FROM Mecanicos;
GO


INSERT INTO Mecanicos
(
    nome,
    cpf,
    telefone,
    email,
    data_contratacao,
    funcao
)
VALUES
(
    'Luciana Fernandes',
    '777.888.999-22',
    '(14) 99666-4567',
    'luciana.fernandes@autotechnology.com',
    '2025-06-15',
    'Especialista em Freios'
);

SELECT * FROM Mecanicos;
GO


INSERT INTO Mecanicos
(
    nome,
    cpf,
    telefone,
    email,
    data_contratacao,
    funcao
)
VALUES
(
    'Pedro Almeida',
    '666.777.888-33',
    '(14) 99555-7890',
    'pedro.almeida@autotechnology.com',
    '2023-09-10',
    'Eletricista Automotivo'
);

SELECT * FROM Mecanicos;
GO


INSERT INTO Mecanicos
(
    nome,
    cpf,
    telefone,
    email,
    data_contratacao,
    funcao
)
VALUES
(
    'Carla Monteiro',
    '555.666.777-44',
    '(14) 99444-3210',
    'carla.monteiro@autotechnology.com',
    '2024-06-01',
    'Mecânica de Veículos Leves'
);

SELECT * FROM Mecanicos;
GO


/* ============================================================
   11. INSERÇÃO DAS ORDENS DE SERVIÇO
   ============================================================

   id_veiculo:
   1 = Fiat Uno - João
   2 = Chevrolet Onix - Mariana
   3 = Toyota Corolla - Carlos
   4 = Honda Fit - Ana

   id_mecanico:
   1 = Rafael
   2 = Luciana
   3 = Pedro
   4 = Carla
   ============================================================ */

INSERT INTO OrdensServico
(
    id_veiculo,
    id_mecanico,
    data_abertura,
    estimativa_entrega,
    descricao_servicos,
    valor_total,
    status
)
VALUES
(
    1,
    1,
    '2025-09-20 08:30:00',
    '2025-09-21 08:30:00',
    'Troca de óleo e filtro',
    150.00,
    'Concluída'
);

SELECT * FROM OrdensServico;
GO


INSERT INTO OrdensServico
(
    id_veiculo,
    id_mecanico,
    data_abertura,
    estimativa_entrega,
    descricao_servicos,
    valor_total,
    status
)
VALUES
(
    2,
    2,
    '2025-09-21 10:00:00',
    '2025-09-23 10:00:00',
    'Substituição de pastilhas de freio dianteiras',
    300.00,
    'Em Andamento'
);

SELECT * FROM OrdensServico;
GO


INSERT INTO OrdensServico
(
    id_veiculo,
    id_mecanico,
    data_abertura,
    estimativa_entrega,
    descricao_servicos,
    valor_total,
    status
)
VALUES
(
    3,
    3,
    '2025-09-22 14:15:00',
    '2025-09-23 08:00:00',
    'Diagnóstico de falha no sistema elétrico',
    120.00,
    'Aberta'
);

SELECT * FROM OrdensServico;
GO


INSERT INTO OrdensServico
(
    id_veiculo,
    id_mecanico,
    data_abertura,
    estimativa_entrega,
    descricao_servicos,
    valor_total,
    status
)
VALUES
(
    4,
    4,
    '2025-09-23 09:45:00',
    '2025-09-24 09:45:00',
    'Alinhamento e balanceamento',
    100.00,
    'Cancelada'
);

SELECT * FROM OrdensServico;
GO


/* ============================================================
   12. ATUALIZAÇÃO DO MODELO DO VEÍCULO
   ============================================================

   O veículo QWE7E77 foi cadastrado como Fit.
   O modelo correto é Civic.
   ============================================================ */

UPDATE Veiculos
SET modelo = 'Civic'
WHERE placa = 'QWE7E77';

SELECT * FROM Veiculos
WHERE placa = 'QWE7E77';
GO


/* ============================================================
   13. ATUALIZAÇÃO DO E-MAIL DE CARLOS MENEZES
   ============================================================

   E-mail incorreto:
   carlos.mennezis@email.com

   E-mail correto:
   carlos.menezes@email.com
   ============================================================ */

UPDATE Clientes
SET email = 'carlos.menezes@email.com'
WHERE cpf = '321.987.654-11';

SELECT * FROM Clientes
WHERE cpf = '321.987.654-11';
GO


/* ============================================================
   14. REMOÇÃO DA ORDEM DE SERVIÇO CANCELADA
   ============================================================

   A ordem pertence ao veículo de placa QWE7E77.
   ============================================================ */

DELETE FROM OrdensServico
WHERE id_veiculo =
(
    SELECT id_veiculo
    FROM Veiculos
    WHERE placa = 'QWE7E77'
);

SELECT * FROM OrdensServico;
GO


/* ============================================================
   15. CONSULTAS FINAIS PARA CONFERÊNCIA
   ============================================================ */

SELECT * FROM Clientes;
GO

SELECT * FROM Veiculos;
GO

SELECT * FROM Mecanicos;
GO

SELECT * FROM OrdensServico;
GO