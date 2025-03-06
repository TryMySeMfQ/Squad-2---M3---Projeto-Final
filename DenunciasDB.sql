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

CREATE TABLE Categoria (
    ID_Categoria INT PRIMARY KEY AUTO_INCREMENT,
    Nome VARCHAR(100) NOT NULL,
    Descricao TEXT,
    Nivel_Urgencia ENUM('Baixo', 'Médio', 'Alto') NOT NULL
);

CREATE TABLE Comentario (
    ID_Comentario INT PRIMARY KEY AUTO_INCREMENT,
    Texto TEXT NOT NULL,
    ID_Usuario INT NOT NULL,
    ID_Denuncia INT NOT NULL,
    FOREIGN KEY (ID_Usuario) REFERENCES Usuario(ID_Usuario),
    FOREIGN KEY (ID_Denuncia) REFERENCES Denuncia(ID_Denuncia)
);

CREATE TABLE Autoridade (
    ID_Autoridade INT PRIMARY KEY AUTO_INCREMENT,
    Nome VARCHAR(100) NOT NULL,
    Email VARCHAR(100) UNIQUE NOT NULL,
    Senha VARCHAR(255) NOT NULL,
    Tipo_Autoridade VARCHAR(100) NOT NULL
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