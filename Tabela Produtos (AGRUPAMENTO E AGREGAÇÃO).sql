CREATE DATABASE prod;
USE prod;

-- Crie uma tabela Produtos com os seguintes itens id_produto; nome; preço; estoque; perecível; marca; nacionalidade;

CREATE TABLE Produtos (
    id_produto INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    preço DECIMAL(10, 2) NOT NULL,
    estoque INT NOT NULL,
    perecível BOOLEAN NOT NULL,
    marca VARCHAR(50),
    nacionalidade VARCHAR(50)
);

-- Após a criação insira cinco produtos, todos devem ter seus respectivos campos preenchidos;

INSERT INTO Produtos (nome, preço, estoque, perecível, marca, nacionalidade) VALUES
('Energetico', 10.50, 100, true, 'Monster', 'Estados Unidos'),
('Refrigerante', 5.30, 50, true, 'Kuat', 'Brasil'),
('Leite', 3.65, 80, true, 'Jussara', 'Brasil'),
('Arroz', 12.20, 30, false, 'Solito', 'Brasil'),
('Vinho', 15.80, 20, true, 'Vinicula Goes', 'Brasil');

-- verifica inserção
SELECT * FROM Produtos;

-- Gere um relatório informando quantos produtos estão cadastrados;
SELECT COUNT(*) AS total_produtos FROM Produtos;

-- Gere um relatório informando o preço médio dos produtos;
SELECT AVG(preço) AS preço_médio FROM Produtos;

-- Selecione a média dos preços dos produtos em 2 grupos: perecíveis e não perecíveis;
SELECT perecível, AVG(preço) AS preço_médio FROM Produtos GROUP BY perecível;

-- Selecione a média dos preços dos produtos agrupados pelo nome do produto;
SELECT nome, AVG(preço) AS preço_médio FROM Produtos GROUP BY nome;

-- Selecione a média dos preços e total em estoque dos produtos;
SELECT AVG(preço) AS preço_médio, SUM(estoque) AS total_em_estoque FROM Produtos;

-- Selecione o nome, marca e quantidade em estoque do produto mais caro;
SELECT nome, marca, estoque FROM Produtos WHERE preço = (SELECT MAX(preço) FROM Produtos);

-- Selecione os produtos com preço acima da média;
SELECT * FROM Produtos WHERE preço > (SELECT AVG(preço) FROM Produtos);

-- Selecione a quantidade de produtos de cada nacionalidade.
SELECT nacionalidade, COUNT(*) AS quantidade FROM Produtos GROUP BY nacionalidade;





