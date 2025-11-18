-- DDL 1: Criação do Banco de Dados
CREATE DATABASE CafeteriaDoIdu;
USE CafeteriaDoIdu;

-- DDL 2: Criação da Tabela Produtos
CREATE TABLE Produtos (
    ProdutoID INT PRIMARY KEY AUTO_INCREMENT, -- AUTO_INCREMENT para IDs automáticos
    NomeProduto VARCHAR(100) NOT NULL UNIQUE,
    Preco DECIMAL(5, 2) NOT NULL,
    Estoque INT DEFAULT 0, -- DEFAULT para estoque inicial
    Categoria VARCHAR(50)
);

-- DDL 3: Criação da Tabela Clientes
CREATE TABLE Clientes (
    ClienteID INT PRIMARY KEY AUTO_INCREMENT,
    Nome VARCHAR(100) NOT NULL,
    Email VARCHAR(100) UNIQUE, -- UNIQUE para garantir que não haja emails duplicados
    DataRegistro DATE
);

-- DDL 4: Criação da Tabela Pedidos (com Chave Estrangeira)
CREATE TABLE Pedidos (
    PedidoID INT PRIMARY KEY AUTO_INCREMENT,
    ClienteID INT,
    DataHora DATETIME NOT NULL,
    ValorTotal DECIMAL(6, 2) NOT NULL,
    -- DDL para definir a Chave Estrangeira (opcional, mas recomendado)
    FOREIGN KEY (ClienteID) REFERENCES Clientes(ClienteID)
);

-- DDL 5: Exemplo de ALTER para adicionar uma coluna (DDL)
ALTER TABLE Produtos
ADD COLUMN DataUltimaAtualizacao DATE;

-- DML 1: Inserir dados na Tabela Produtos (INSERT)
INSERT INTO Produtos (NomeProduto, Preco, Estoque, Categoria) VALUES
('Latte', 15.50, 50, 'Café'),
('Croissant', 8.00, 30, 'Comida'),
('Chá Gelado', 12.00, 45, 'Bebida Gelada');

-- DML 2: Inserir dados na Tabela Clientes (INSERT)
INSERT INTO Clientes (Nome, Email, DataRegistro) VALUES
('Ana Silva', 'ana.s@email.com', '2025-10-01'),
('Bruno Costa', 'bruno.c@email.com', '2025-10-05');

-- DML 3: Inserir dados na Tabela Pedidos (INSERT)
-- Assumindo que Ana Silva tem ClienteID 1 e Bruno Costa tem ClienteID 2
INSERT INTO Pedidos (ClienteID, DataHora, ValorTotal) VALUES
(1, '2025-11-18 09:30:00', 23.50), -- Ana comprou Latte e Croissant
(2, '2025-11-18 10:15:00', 12.00); -- Bruno comprou Chá Gelado

-- DML 4: Atualizar dados (UPDATE)
-- Aumentar o preço do Latte em R$ 0,50
UPDATE Produtos
SET Preco = 16.00
WHERE NomeProduto = 'Latte';

-- DML 5: Consultar dados (SELECT)
SELECT NomeProduto, Preco, Estoque
FROM Produtos
WHERE Estoque > 40;

-- DML 6: Excluir dados (DELETE)
-- Remover um pedido (ex: foi cancelado)
DELETE FROM Pedidos
WHERE PedidoID = 2; -- Exclui o pedido de Bruno (se PedidoID era 2)