CREATE DATABASE apuracao_eleitoral;
USE apuracao_eleitoral;


CREATE TABLE Zona_Eleitoral (
    id_zona INT AUTO_INCREMENT PRIMARY KEY,
    numero_zona VARCHAR(45),
    municipio VARCHAR(45)
);


CREATE TABLE Secao_Eleitoral (
    id_secao INT AUTO_INCREMENT PRIMARY KEY,
    numero_secao VARCHAR(45),
    local_votacao VARCHAR(45),
    id_zona INT,
    FOREIGN KEY (id_zona) REFERENCES Zona_Eleitoral(id_zona)
);


CREATE TABLE Eleitor (
    id_eleitor INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(45),
    cpf VARCHAR(45),
    data_nascimento DATE,
    titulo_eleitoral VARCHAR(45),
    id_secao INT,
    FOREIGN KEY (id_secao) REFERENCES Secao_Eleitoral(id_secao)
);


CREATE TABLE Partido_Politico (
    id_partido INT AUTO_INCREMENT PRIMARY KEY,
    sigla VARCHAR(45),
    nome_partido VARCHAR(45)
);


CREATE TABLE Candidato (
    id_candidato INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(45),
    numero_urna VARCHAR(45),
    cargo VARCHAR(45),
    id_partido INT,
    FOREIGN KEY (id_partido) REFERENCES Partido_Politico(id_partido)
);


CREATE TABLE Voto (
    id_voto INT AUTO_INCREMENT PRIMARY KEY,
    data_hora DATETIME,
    id_eleitor INT,
    id_secao INT,
    FOREIGN KEY (id_eleitor) REFERENCES Eleitor(id_eleitor),
    FOREIGN KEY (id_secao) REFERENCES Secao_Eleitoral(id_secao)
);

