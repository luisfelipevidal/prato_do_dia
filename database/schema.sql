CREATE DATABASE IF NOT EXISTS pratododia_db;
USE pratododia_db;

CREATE TABLE clientes (
    id_cliente INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    senha VARCHAR(255) NOT NULL
);

CREATE TABLE estabelecimentos (
    id_estabelecimento INT AUTO_INCREMENT PRIMARY KEY,
    razao_social VARCHAR(100) NOT NULL,
    cnpj VARCHAR(18) UNIQUE NOT NULL,
    cidade VARCHAR(100) NOT NULL
);

CREATE TABLE caixas_surpresa (
    id_caixa INT AUTO_INCREMENT PRIMARY KEY,
    estabelecimento_id INT NOT NULL,
    descricao VARCHAR(255) NOT NULL,
    preco_original DECIMAL(10,2) NOT NULL,
    preco_desconto DECIMAL(10,2) NOT NULL,
    quantidade INT NOT NULL,
    FOREIGN KEY (estabelecimento_id) REFERENCES estabelecimentos(id_estabelecimento)
);

CREATE TABLE pedidos (
    id_pedido INT AUTO_INCREMENT PRIMARY KEY,
    cliente_id INT NOT NULL,
    caixa_id INT NOT NULL,
    data_pedido TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (cliente_id) REFERENCES clientes(id_cliente),
    FOREIGN KEY (caixa_id) REFERENCES caixas_surpresa(id_caixa)
);
