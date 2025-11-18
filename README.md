## ☕ Atividade Acadêmica: Banco de Dados de uma Cafeteria

Este repositório contém o script SQL para a criação e manipulação de um banco de dados relacional (BD) fictício, denominado **`CafeteriaDoIdu`**. O projeto foi desenvolvido como parte de uma atividade acadêmica para demonstrar o uso prático dos comandos **DDL** (Data Definition Language) e **DML** (Data Manipulation Language).

---

### 🎯 Objetivo

O objetivo desta atividade é simular um sistema de gerenciamento de dados para uma cafeteria, aplicando os seguintes conceitos de SQL:

* **DDL:** Criação de tabelas, definição de tipos de dados, chaves primárias e restrições (`UNIQUE`, `NOT NULL`, `DEFAULT`).
* **DML:** Inserção, atualização, exclusão e consulta de dados.
* **Modelagem Básica:** Criação de entidades e identificação de relacionamentos (Chaves Estrangeiras).

---

### 📝 Sobre o Projeto (Descrição, Objetivos e Aprendizados)

#### **1. Descrição do Banco de Dados**
O **`TheDailyGrindDB`** simula um sistema de gerenciamento de informações para uma cafeteria fictícia. Ele é estruturado para lidar com três entidades principais: **`Produtos`** (o que é vendido), **`Clientes`** (quem compra) e **`Pedidos`** (as transações de venda). Este modelo permite registrar o estoque, preços, dados de fidelidade do cliente e o histórico de compras.

#### **2. Objetivo do Projeto**
O principal objetivo foi consolidar o entendimento e a aplicação dos fundamentos da linguagem SQL, especificamente:
* **Modelagem de Dados:** Definir entidades, atributos e escolher os tipos de dados apropriados.
* **DDL (Definição):** Utilizar `CREATE TABLE`, `ALTER TABLE` e definir restrições de integridade (como $\text{PRIMARY KEY}$, $\text{FOREIGN KEY}$, $\text{UNIQUE}$ e $\text{NOT NULL}$).
* **DML (Manipulação):** Realizar operações básicas de CRUD (Create, Read, Update, Delete) utilizando os comandos `INSERT`, `SELECT`, `UPDATE` e `DELETE`.

#### **3. Aprendizados Principais**
A conclusão desta atividade reforçou a importância de:
* **Integridade de Dados:** A necessidade de definir restrições (`NOT NULL`, $\text{UNIQUE}$) para garantir que o banco de dados armazene informações corretas e consistentes.
* **Relacionamentos:** A aplicação da $\text{FOREIGN KEY}$ na tabela **`Pedidos`** para ligá-la à tabela **`Clientes`**, demonstrando o conceito de integridade referencial e o relacionamento *Um-para-Muitos*.
* **Planejamento:** A fase de planejamento (identificar entidades e atributos) é crucial para uma construção eficiente e lógica do script SQL.

---

### 🧱 Estrutura do Banco de Dados (`CafeteriaDoIdu`)

O banco de dados é composto por três tabelas principais, que representam as entidades essenciais para o negócio da cafeteria:

#### 1. `Produtos`
Detalha os itens vendidos (cafés, comidas, etc.).

| Coluna | Tipo de Dado | Restrições | Descrição |
| :--- | :--- | :--- | :--- |
| `ProdutoID` | `INT` | **PRIMARY KEY**, `AUTO_INCREMENT` | Identificador único do produto. |
| `NomeProduto` | `VARCHAR(100)` | `NOT NULL`, `UNIQUE` | Nome do item. |
| `Preco` | `DECIMAL(5, 2)` | `NOT NULL` | Preço de venda. |
| `Estoque` | `INT` | `DEFAULT 0` | Quantidade disponível. |
| `Categoria` | `VARCHAR(50)` | | Tipo do produto (ex: "Café", "Comida"). |
| `DataUltimaAtualizacao` | `DATE` | | Adicionada via comando `ALTER TABLE`. |

#### 2. `Clientes`
Armazena dados dos clientes fidelizados.

| Coluna | Tipo de Dado | Restrições | Descrição |
| :--- | :--- | :--- | :--- |
| `ClienteID` | `INT` | **PRIMARY KEY**, `AUTO_INCREMENT` | Identificador único do cliente. |
| `Nome` | `VARCHAR(100)` | `NOT NULL` | Nome completo. |
| `Email` | `VARCHAR(100)` | `UNIQUE` | E-mail do cliente. |
| `DataRegistro` | `DATE` | | Data de adesão ao programa. |

#### 3. `Pedidos`
Registra cada transação de venda.

| Coluna | Tipo de Dado | Restrições | Descrição |
| :--- | :--- | :--- | :--- |
| `PedidoID` | `INT` | **PRIMARY KEY**, `AUTO_INCREMENT` | Identificador único do pedido. |
| `ClienteID` | `INT` | **FOREIGN KEY** | Liga ao cliente que fez o pedido. |
| `DataHora` | `DATETIME` | `NOT NULL` | Data e hora da transação. |
| `ValorTotal` | `DECIMAL(6, 2)` | `NOT NULL` | Valor total pago. |

---

### 💻 Script SQL (`cafeteria_script.sql`)

O arquivo `cafeteria_script.sql` contém a sequência de comandos para criar e popular o banco de dados.

#### A. Comandos DDL (Definição da Estrutura)

```sql
-- DDL: Criação do Banco de Dados
CREATE DATABASE CafeteriaDoIdu;
USE CafeteriaDoIdu;

-- DDL: Criação da Tabela Produtos
CREATE TABLE Produtos (
    ProdutoID INT PRIMARY KEY AUTO_INCREMENT,
    NomeProduto VARCHAR(100) NOT NULL UNIQUE,
    Preco DECIMAL(5, 2) NOT NULL,
    Estoque INT DEFAULT 0,
    Categoria VARCHAR(50)
);

-- DDL: Criação da Tabela Clientes
CREATE TABLE Clientes (
    ClienteID INT PRIMARY KEY AUTO_INCREMENT,
    Nome VARCHAR(100) NOT NULL,
    Email VARCHAR(100) UNIQUE,
    DataRegistro DATE
);

-- DDL: Criação da Tabela Pedidos (com Chave Estrangeira)
CREATE TABLE Pedidos (
    PedidoID INT PRIMARY KEY AUTO_INCREMENT,
    ClienteID INT,
    DataHora DATETIME NOT NULL,
    ValorTotal DECIMAL(6, 2) NOT NULL,
);
````
#### B. Comandos DML (Manipulação de Dados)
```sql
-- DML: Inserir dados iniciais na Tabela Produtos
INSERT INTO Produtos (NomeProduto, Preco, Estoque, Categoria) VALUES
('Latte', 15.50, 50, 'Café'),
('Croissant', 8.00, 30, 'Comida'),
('Chá Gelado', 12.00, 45, 'Bebida Gelada');

-- DML: Inserir dados iniciais na Tabela Clientes
INSERT INTO Clientes (Nome, Email, DataRegistro) VALUES
('Ana Silva', 'ana.s@email.com', '2025-10-01'),
('Bruno Costa', 'bruno.c@email.com', '2025-10-05');

-- DML: Inserir dados iniciais na Tabela Pedidos
INSERT INTO Pedidos (ClienteID, DataHora, ValorTotal) VALUES
(1, '2025-11-18 09:30:00', 23.50),
(2, '2025-11-18 10:15:00', 12.00);

-- DML: Atualizar o preço de um produto (UPDATE)
UPDATE Produtos
SET Preco = 16.00
WHERE NomeProduto = 'Latte';

-- DML: Consultar produtos com estoque alto (SELECT)
SELECT NomeProduto, Preco, Estoque
FROM Produtos
WHERE Estoque > 40;

-- DML: Excluir um pedido (DELETE)
DELETE FROM Pedidos
WHERE PedidoID = 2;
