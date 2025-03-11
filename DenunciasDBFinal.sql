CREATE DATABASE DenunciasDB;
USE DenunciasDB;


CREATE TABLE Usuario (
    ID_Usuario INT PRIMARY KEY AUTO_INCREMENT,
    Nome VARCHAR(100) NOT NULL,
    Email VARCHAR(100) UNIQUE NOT NULL,
    Senha VARCHAR(255) NOT NULL,
    Localizacao VARCHAR(255),
    PCD ENUM('Sim', 'Não')
);

CREATE TABLE Categoria (
    ID_Categoria INT PRIMARY KEY AUTO_INCREMENT,
    Nome VARCHAR(100) NOT NULL,
    Descricao TEXT,
    Nivel_Urgencia ENUM('Baixo', 'Médio', 'Alto') NOT NULL
);

CREATE TABLE Autoridade (
    ID_Autoridade INT PRIMARY KEY AUTO_INCREMENT,
    Nome VARCHAR(100) NOT NULL,
    Email VARCHAR(100) UNIQUE NOT NULL,
    Senha VARCHAR(255) NOT NULL,
    Tipo_Autoridade VARCHAR(100) NOT NULL
);



CREATE TABLE Denuncia (
    ID_Denuncia INT PRIMARY KEY AUTO_INCREMENT,
    Descricao TEXT NOT NULL,
    Localizacao VARCHAR(255),
    Fotos TEXT,
    Status ENUM('Aberta', 'Em Análise', 'Resolvida') NOT NULL,
    ID_Usuario INT NOT NULL,
    ID_Categoria INT NOT NULL,
    ID_Autoridade INT NOT NULL,
    FOREIGN KEY (ID_Usuario) REFERENCES Usuario(ID_Usuario),
    FOREIGN KEY (ID_Categoria) REFERENCES Categoria(ID_Categoria),
    FOREIGN KEY (ID_Autoridade) REFERENCES Autoridade(ID_Autoridade)
);



CREATE TABLE Comentario (
    ID_Comentario INT PRIMARY KEY AUTO_INCREMENT,
    Texto TEXT NOT NULL,
    ID_Usuario INT NOT NULL,
    ID_Denuncia INT NOT NULL,
    FOREIGN KEY (ID_Usuario) REFERENCES Usuario(ID_Usuario),
    FOREIGN KEY (ID_Denuncia) REFERENCES Denuncia(ID_Denuncia)
);

CREATE TABLE Historico_Status (
    ID_Historico INT PRIMARY KEY AUTO_INCREMENT,
    ID_Denuncia INT NOT NULL,
    ID_Autoridade INT NOT NULL,
    Status ENUM('Aberta', 'Em Análise', 'Resolvida') NOT NULL,
    Data_Hora TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (ID_Denuncia) REFERENCES Denuncia(ID_Denuncia),
    FOREIGN KEY (ID_Autoridade) REFERENCES Autoridade(ID_Autoridade)
);

CREATE TABLE Votos (
    ID_Voto INT PRIMARY KEY AUTO_INCREMENT,
    ID_Usuario INT NOT NULL,
    ID_Denuncia INT NOT NULL,
    Status ENUM('Upvote', 'Downvote') NOT NULL,
    FOREIGN KEY (ID_Usuario) REFERENCES Usuario(ID_Usuario),
    FOREIGN KEY (ID_Denuncia) REFERENCES Denuncia(ID_Denuncia)
);

CREATE TABLE Notificacao (
    ID_Notificacao INT PRIMARY KEY AUTO_INCREMENT,
    ID_Usuario INT NOT NULL,
    ID_Denuncia INT NOT NULL,
    Mensagem TEXT NOT NULL,
    Tipo VARCHAR(50) NOT NULL,
    Data_Hora TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (ID_Usuario) REFERENCES Usuario(ID_Usuario),
    FOREIGN KEY (ID_Denuncia) REFERENCES Denuncia(ID_Denuncia)
);

CREATE TABLE Preferencia_Acessibilidade (
    ID_Usuario INT PRIMARY KEY,
    Audio_Descricao BOOLEAN DEFAULT FALSE,
    Alto_Contraste BOOLEAN DEFAULT FALSE,
    Tamanho_Fonte ENUM('Pequeno', 'Médio', 'Grande') DEFAULT 'Médio',
    FOREIGN KEY (ID_Usuario) REFERENCES Usuario(ID_Usuario)
);



INSERT INTO Usuario (Nome, Email, Senha, Localizacao, PCD) VALUES
('João Silva', 'joao.silva@example.com', 'senha123', 'São Paulo', 'Não'),
('Maria Oliveira', 'maria.oliveira@example.com', 'senha456', 'Rio de Janeiro', 'Sim'),
('Carlos Souza', 'carlos.souza@example.com', 'senha789', 'Belo Horizonte', 'Não'),
('Ana Costa', 'ana.costa@example.com', 'senha101', 'Curitiba', 'Não'),
('Pedro Rocha', 'pedro.rocha@example.com', 'senha112', 'Porto Alegre', 'Sim'),
('Fernanda Lima', 'fernanda.lima@example.com', 'senha113', 'Recife', 'Não'),
('Ricardo Alves', 'ricardo.alves@example.com', 'senha114', 'Salvador', 'Não'),
('Juliana Santos', 'juliana.santos@example.com', 'senha115', 'Fortaleza', 'Sim'),
('Lucas Pereira', 'lucas.pereira@example.com', 'senha116', 'Manaus', 'Não'),
('Patrícia Gomes', 'patricia.gomes@example.com', 'senha117', 'Brasília', 'Não'),
('Roberto Fernandes', 'roberto.fernandes@example.com', 'senha118', 'Goiânia', 'Sim'),
('Camila Ribeiro', 'camila.ribeiro@example.com', 'senha119', 'Florianópolis', 'Não'),
('Gustavo Martins', 'gustavo.martins@example.com', 'senha120', 'Natal', 'Não'),
('Isabela Castro', 'isabela.castro@example.com', 'senha121', 'João Pessoa', 'Sim'),
('Marcos Oliveira', 'marcos.oliveira@example.com', 'senha122', 'Maceió', 'Não'),
('Tatiane Souza', 'tatiane.souza@example.com', 'senha123', 'Campinas', 'Não'),
('Felipe Costa', 'felipe.costa@example.com', 'senha124', 'São Luís', 'Sim'),
('Larissa Rocha', 'larissa.rocha@example.com', 'senha125', 'Teresina', 'Não'),
('Bruno Lima', 'bruno.lima@example.com', 'senha126', 'Cuiabá', 'Não'),
('Vanessa Alves', 'vanessa.alves@example.com', 'senha127', 'Porto Velho', 'Sim');

INSERT INTO Categoria (Nome, Descricao, Nivel_Urgencia) VALUES
('Buraco na Rua', 'Buraco na via pública que pode causar acidentes.', 'Alto'),
('Iluminação Pública', 'Problemas com iluminação em vias públicas.', 'Médio'),
('Coleta de Lixo', 'Falta de coleta de lixo em determinada área.', 'Baixo'),
('Vazamento de Água', 'Vazamento de água em via pública.', 'Alto'),
('Poluição Sonora', 'Excesso de barulho em determinada área.', 'Médio'),
('Pichação', 'Pichações em muros e prédios públicos.', 'Baixo'),
('Árvore Caída', 'Árvore caída bloqueando via pública.', 'Alto'),
('Esgoto a Céu Aberto', 'Esgoto exposto em vias públicas.', 'Alto'),
('Falta de Sinalização', 'Falta de sinalização em cruzamentos perigosos.', 'Médio'),
('Animais Abandonados', 'Presença de animais abandonados na via pública.', 'Baixo');

INSERT INTO Autoridade (Nome, Email, Senha, Tipo_Autoridade) VALUES
('Prefeitura de São Paulo', 'prefeitura.sp@example.com', 'senha123', 'Prefeitura'),
('Defesa Civil', 'defesacivil@example.com', 'senha456', 'Defesa Civil'),
('SAMU', 'samu@example.com', 'senha789', 'Saúde'),
('Polícia Militar', 'pm@example.com', 'senha101', 'Segurança'),
('Secretaria de Meio Ambiente', 'meioambiente@example.com', 'senha112', 'Meio Ambiente'),
('Secretaria de Transportes', 'transportes@example.com', 'senha113', 'Transportes'),
('Secretaria de Obras', 'obras@example.com', 'senha114', 'Obras'),
('Secretaria de Educação', 'educacao@example.com', 'senha115', 'Educação'),
('Secretaria de Saúde', 'saude@example.com', 'senha116', 'Saúde'),
('Secretaria de Segurança', 'seguranca@example.com', 'senha117', 'Segurança');


INSERT INTO Denuncia (Descricao, Localizacao, Fotos, Status, ID_Usuario, ID_Categoria, ID_Autoridade) VALUES
('Buraco na Avenida Paulista', 'Avenida Paulista, 1000', 'foto1.jpg', 'Aberta', 1, 1, 1),
('Poste quebrado na Rua Augusta', 'Rua Augusta, 500', 'foto2.jpg', 'Em Análise', 2, 2, 2),
('Lixo acumulado no Parque Ibirapuera', 'Parque Ibirapuera', 'foto3.jpg', 'Resolvida', 3, 3, 3),
('Vazamento de água na Rua Oscar Freire', 'Rua Oscar Freire, 200', 'foto4.jpg', 'Aberta', 4, 4, 4),
('Barulho excessivo na Rua da Consolação', 'Rua da Consolação, 300', 'foto5.jpg', 'Em Análise', 5, 5, 5),
('Pichação no muro da escola', 'Rua das Flores, 150', 'foto6.jpg', 'Aberta', 6, 6, 6),
('Árvore caída na Rua das Palmeiras', 'Rua das Palmeiras, 400', 'foto7.jpg', 'Resolvida', 7, 7, 7),
('Esgoto a céu aberto na Rua das Margaridas', 'Rua das Margaridas, 250', 'foto8.jpg', 'Aberta', 8, 8, 8),
('Falta de sinalização na Rua dos Girassóis', 'Rua dos Girassóis, 350', 'foto9.jpg', 'Em Análise', 9, 9, 9),
('Cachorro abandonado na Praça Central', 'Praça Central', 'foto10.jpg', 'Aberta', 10, 10, 10),
('Buraco na Rua das Acácias', 'Rua das Acácias, 100', 'foto11.jpg', 'Aberta', 11, 1, 1),
('Poste apagado na Rua das Hortênsias', 'Rua das Hortênsias, 200', 'foto12.jpg', 'Em Análise', 12, 2, 2),
('Lixo acumulado na Rua das Violetas', 'Rua das Violetas, 300', 'foto13.jpg', 'Resolvida', 13, 3, 3),
('Vazamento de água na Rua das Rosas', 'Rua das Rosas, 400', 'foto14.jpg', 'Aberta', 14, 4, 4),
('Barulho excessivo na Rua das Tulipas', 'Rua das Tulipas, 500', 'foto15.jpg', 'Em Análise', 15, 5, 5),
('Pichação no muro do hospital', 'Rua das Azaleias, 600', 'foto16.jpg', 'Aberta', 16, 6, 6),
('Árvore caída na Rua das Orquídeas', 'Rua das Orquídeas, 700', 'foto17.jpg', 'Resolvida', 17, 7, 7),
('Esgoto a céu aberto na Rua das Begônias', 'Rua das Begônias, 800', 'foto18.jpg', 'Aberta', 18, 8, 8),
('Falta de sinalização na Rua das Camélias', 'Rua das Camélias, 900', 'foto19.jpg', 'Em Análise', 19, 9, 9),
('Gato abandonado na Praça da Liberdade', 'Praça da Liberdade', 'foto20.jpg', 'Aberta', 20, 10, 10),
('Buraco na Rua das Magnólias', 'Rua das Magnólias, 1000', 'foto21.jpg', 'Aberta', 1, 1, 1),
('Poste quebrado na Rua das Dálias', 'Rua das Dálias, 1100', 'foto22.jpg', 'Em Análise', 2, 2, 2),
('Lixo acumulado na Rua das Gardênias', 'Rua das Gardênias, 1200', 'foto23.jpg', 'Resolvida', 3, 3, 3),
('Vazamento de água na Rua das Bromélias', 'Rua das Bromélias, 1300', 'foto24.jpg', 'Aberta', 4, 4, 4),
('Barulho excessivo na Rua das Lírios', 'Rua das Lírios, 1400', 'foto25.jpg', 'Em Análise', 5, 5, 5),
('Pichação no muro da prefeitura', 'Rua das Margaridas, 1500', 'foto26.jpg', 'Aberta', 6, 6, 6),
('Árvore caída na Rua das Violetas', 'Rua das Violetas, 1600', 'foto27.jpg', 'Resolvida', 7, 7, 7),
('Esgoto a céu aberto na Rua das Rosas', 'Rua das Rosas, 1700', 'foto28.jpg', 'Aberta', 8, 8, 8),
('Falta de sinalização na Rua das Tulipas', 'Rua das Tulipas, 1800', 'foto29.jpg', 'Em Análise', 9, 9, 9),
('Cachorro abandonado na Praça da República', 'Praça da República', 'foto30.jpg', 'Aberta', 10, 10, 10),
('Buraco na Rua das Acácias', 'Rua das Acácias, 1900', 'foto31.jpg', 'Aberta', 11, 1, 1),
('Poste apagado na Rua das Hortênsias', 'Rua das Hortênsias, 2000', 'foto32.jpg', 'Em Análise', 12, 2, 2),
('Lixo acumulado na Rua das Violetas', 'Rua das Violetas, 2100', 'foto33.jpg', 'Resolvida', 13, 3, 3),
('Vazamento de água na Rua das Rosas', 'Rua das Rosas, 2200', 'foto34.jpg', 'Aberta', 14, 4, 4),
('Barulho excessivo na Rua das Tulipas', 'Rua das Tulipas, 2300', 'foto35.jpg', 'Em Análise', 15, 5, 5),
('Pichação no muro da escola', 'Rua das Flores, 2400', 'foto36.jpg', 'Aberta', 16, 6, 6),
('Árvore caída na Rua das Palmeiras', 'Rua das Palmeiras, 2500', 'foto37.jpg', 'Resolvida', 17, 7, 7),
('Esgoto a céu aberto na Rua das Margaridas', 'Rua das Margaridas, 2600', 'foto38.jpg', 'Aberta', 18, 8, 8),
('Falta de sinalização na Rua dos Girassóis', 'Rua dos Girassóis, 2700', 'foto39.jpg', 'Em Análise', 19, 9, 9),
('Cachorro abandonado na Praça Central', 'Praça Central, 2800', 'foto40.jpg', 'Aberta', 20, 10, 10);

INSERT INTO Comentario (Texto, ID_Usuario, ID_Denuncia) VALUES
('Esse buraco já causou vários acidentes!', 1, 1),
('O poste está quebrado há semanas.', 2, 2),
('O lixo está acumulado há mais de uma semana.', 3, 3),
('O vazamento está piorando a cada dia.', 4, 4),
('O barulho está insuportável!', 5, 5),
('As pichações estão degradando a cidade.', 6, 6),
('A árvore caída bloqueia a passagem de carros.', 7, 7),
('O esgoto a céu aberto é um perigo para a saúde.', 8, 8),
('A falta de sinalização causa acidentes.', 9, 9),
('O cachorro abandonado precisa de ajuda.', 10, 10),
('Esse buraco é muito perigoso!', 11, 11),
('O poste apagado está causando acidentes.', 12, 12),
('O lixo acumulado está atraindo ratos.', 13, 13),
('O vazamento está alagando a rua.', 14, 14),
('O barulho está atrapalhando o sono.', 15, 15),
('As pichações estão piorando a imagem da cidade.', 16, 16),
('A árvore caída está bloqueando a calçada.', 17, 17),
('O esgoto a céu aberto é um risco para as crianças.', 18, 18),
('A falta de sinalização está causando engarrafamentos.', 19, 19),
('O gato abandonado precisa de cuidados.', 20, 20),
('Esse buraco precisa ser consertado urgentemente!', 1, 21),
('O poste quebrado está causando escuridão.', 2, 22),
('O lixo acumulado está causando mau cheiro.', 3, 23),
('O vazamento está desperdiçando água.', 4, 24),
('O barulho está perturbando os vizinhos.', 5, 25),
('As pichações estão destruindo o patrimônio público.', 6, 26),
('A árvore caída está causando transtornos.', 7, 27),
('O esgoto a céu aberto está contaminando o solo.', 8, 28),
('A falta de sinalização está causando confusão.', 9, 29),
('O cachorro abandonado está assustando as pessoas.', 10, 30),
('Esse buraco é um perigo para os pedestres.', 11, 31),
('O poste apagado está causando insegurança.', 12, 32),
('O lixo acumulado está sujando a cidade.', 13, 33),
('O vazamento está causando desperdício de água.', 14, 34),
('O barulho está incomodando os moradores.', 15, 35),
('As pichações estão vandalizando a cidade.', 16, 36),
('A árvore caída está bloqueando a rua.', 17, 37),
('O esgoto a céu aberto está causando doenças.', 18, 38),
('A falta de sinalização está causando acidentes.', 19, 39),
('O cachorro abandonado está precisando de ajuda.', 20, 40);

INSERT INTO Votos (ID_Usuario, ID_Denuncia, Status) VALUES
-- Usuário 1: Mais upvotes
(1, 1, 'Upvote'),
(1, 2, 'Upvote'),
(1, 3, 'Upvote'),
(1, 4, 'Upvote'),
(1, 5, 'Downvote'),

-- Usuário 2: Mais downvotes
(2, 6, 'Downvote'),
(2, 7, 'Downvote'),
(2, 8, 'Downvote'),
(2, 9, 'Upvote'),
(2, 10, 'Downvote'),

-- Usuário 3: Mistura de upvotes e downvotes
(3, 11, 'Upvote'),
(3, 12, 'Downvote'),
(3, 13, 'Upvote'),
(3, 14, 'Downvote'),
(3, 15, 'Upvote'),

-- Usuário 4: Poucos votos
(4, 16, 'Upvote'),
(4, 17, 'Downvote'),

-- Usuário 5: Muitos upvotes
(5, 18, 'Upvote'),
(5, 19, 'Upvote'),
(5, 20, 'Upvote'),
(5, 21, 'Upvote'),
(5, 22, 'Upvote'),
(5, 23, 'Upvote'),

-- Usuário 6: Muitos downvotes
(6, 24, 'Downvote'),
(6, 25, 'Downvote'),
(6, 26, 'Downvote'),
(6, 27, 'Downvote'),
(6, 28, 'Downvote'),
(6, 29, 'Downvote'),

-- Usuário 7: Mistura equilibrada
(7, 30, 'Upvote'),
(7, 31, 'Downvote'),
(7, 32, 'Upvote'),
(7, 33, 'Downvote'),
(7, 34, 'Upvote'),
(7, 35, 'Downvote'),

-- Usuário 8: Poucos votos
(8, 36, 'Upvote'),
(8, 37, 'Upvote'),

-- Usuário 9: Muitos votos misturados
(9, 38, 'Upvote'),
(9, 39, 'Upvote'),
(9, 40, 'Downvote'),
(9, 1, 'Downvote'),
(9, 2, 'Upvote'),
(9, 3, 'Downvote'),

-- Usuário 10: Muitos upvotes
(10, 4, 'Upvote'),
(10, 5, 'Upvote'),
(10, 6, 'Upvote'),
(10, 7, 'Upvote'),
(10, 8, 'Upvote'),
(10, 9, 'Upvote');



-- Denúncias por Nível de Urgência
SELECT C.Nivel_Urgencia, COUNT(D.ID_Denuncia) AS Total_Denuncias
FROM Denuncia D
JOIN Categoria C ON D.ID_Categoria = C.ID_Categoria
GROUP BY C.Nivel_Urgencia
ORDER BY Total_Denuncias DESC;

-- Usuários com Maior Número de Votos em geral (Upvotes e Downvotes)
SELECT U.Nome AS Usuario, 
       SUM(CASE WHEN V.Status = 'Upvote' THEN 1 ELSE 0 END) AS Upvotes,
       SUM(CASE WHEN V.Status = 'Downvote' THEN 1 ELSE 0 END) AS Downvotes,
       COUNT(V.ID_Voto) AS Total_Votos
FROM Usuario U
LEFT JOIN Votos V ON U.ID_Usuario = V.ID_Usuario
GROUP BY U.Nome
ORDER BY Total_Votos DESC;

-- Usuários Mais Positivos
SELECT U.Nome AS Usuario, 
       COUNT(V.ID_Voto) AS Total_Upvotes
FROM Usuario U
LEFT JOIN Votos V ON U.ID_Usuario = V.ID_Usuario AND V.Status = 'Upvote'
GROUP BY U.Nome
ORDER BY Total_Upvotes DESC
LIMIT 5; 

-- Usuários Mais Negativos
SELECT U.Nome AS Usuario, 
       COUNT(V.ID_Voto) AS Total_Downvotes
FROM Usuario U
LEFT JOIN Votos V ON U.ID_Usuario = V.ID_Usuario AND V.Status = 'Downvote'
GROUP BY U.Nome
ORDER BY Total_Downvotes DESC
LIMIT 5;
