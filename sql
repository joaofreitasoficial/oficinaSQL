CREATE TABLE Cliente (
    ID_Cliente INT AUTO_INCREMENT PRIMARY KEY,
    Nome VARCHAR(100) NOT NULL,
    CPF VARCHAR(14) UNIQUE NOT NULL,
    Endereco VARCHAR(200),
    Telefone VARCHAR(15)
);

CREATE TABLE Veiculo (
    ID_Veiculo INT AUTO_INCREMENT PRIMARY KEY,
    Placa VARCHAR(10) UNIQUE NOT NULL,
    Marca VARCHAR(50),
    Modelo VARCHAR(50),
    Ano INT,
    ID_Cliente INT,
    FOREIGN KEY (ID_Cliente) REFERENCES Cliente(ID_Cliente)
);

CREATE TABLE Equipe (
    ID_Equipe INT AUTO_INCREMENT PRIMARY KEY,
    Nome_Equipe VARCHAR(100) NOT NULL
);

CREATE TABLE Mecanico (
    ID_Mecanico INT AUTO_INCREMENT PRIMARY KEY,
    Nome VARCHAR(100) NOT NULL,
    Endereco VARCHAR(200),
    Especialidade VARCHAR(100),
    ID_Equipe INT,
    FOREIGN KEY (ID_Equipe) REFERENCES Equipe(ID_Equipe)
);

CREATE TABLE OrdemServico (
    ID_OS INT AUTO_INCREMENT PRIMARY KEY,
    Numero_OS VARCHAR(20) UNIQUE NOT NULL,
    Data_Emissao DATE NOT NULL,
    Valor_Total DECIMAL(10, 2),
    Status ENUM('Aguardando', 'Em andamento', 'Concluído') NOT NULL,
    Data_Conclusao DATE,
    ID_Veiculo INT,
    ID_Equipe INT,
    FOREIGN KEY (ID_Veiculo) REFERENCES Veiculo(ID_Veiculo),
    FOREIGN KEY (ID_Equipe) REFERENCES Equipe(ID_Equipe)
);

CREATE TABLE Servico (
    ID_Servico INT AUTO_INCREMENT PRIMARY KEY,
    Descricao VARCHAR(200) NOT NULL,
    Valor_MaoDeObra DECIMAL(10, 2) NOT NULL
);

CREATE TABLE Peca (
    ID_Peca INT AUTO_INCREMENT PRIMARY KEY,
    Nome VARCHAR(100) NOT NULL,
    Valor DECIMAL(10, 2) NOT NULL
);

CREATE TABLE Servicos_OS (
    ID_OS INT,
    ID_Servico INT,
    Quantidade INT,
    PRIMARY KEY (ID_OS, ID_Servico),
    FOREIGN KEY (ID_OS) REFERENCES OrdemServico(ID_OS),
    FOREIGN KEY (ID_Servico) REFERENCES Servico(ID_Servico)
);

CREATE TABLE Pecas_OS (
    ID_OS INT,
    ID_Peca INT,
    Quantidade INT,
    PRIMARY KEY (ID_OS, ID_Peca),
    FOREIGN KEY (ID_OS) REFERENCES OrdemServico(ID_OS),
    FOREIGN KEY (ID_Peca) REFERENCES Peca(ID_Peca)
);
