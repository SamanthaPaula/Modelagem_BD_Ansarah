
-- 1. CREATE DATABASE
CREATE DATABASE db_ansarah
  CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE db_ansarah;

-- 2. CREATE TABLE

CREATE TABLE Fornecedor (
    id_fornecedor INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nome_fornecedor VARCHAR(150) NOT NULL,
    razao_social_fornecedor VARCHAR(180) NOT NULL,
    cnpj_fornecedor CHAR(14) NOT NULL,
    inscricao_estadual_fornecedor VARCHAR(20),
    telefone_fornecedor VARCHAR(20),
    email_fornecedor VARCHAR(150),
    endereco_fornecedor VARCHAR(255),
    status_fornecedor VARCHAR(20) NOT NULL,
    data_cadastro_fornecedor DATE NOT NULL
) ENGINE=InnoDB;

CREATE TABLE Departamento (
    id_departamento INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nome_departamento VARCHAR(100) NOT NULL
) ENGINE=InnoDB;

CREATE TABLE Funcionario (
    id_funcionario INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nome_funcionario VARCHAR(150) NOT NULL,
    cargo_funcionario VARCHAR(100) NOT NULL,
    id_departamento INT NOT NULL
) ENGINE=InnoDB;

CREATE TABLE Cliente (
    id_cliente INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nome_completo VARCHAR(160) NOT NULL,
    tipo_cliente VARCHAR(3) NOT NULL,
    cpf_cliente CHAR(11),
    cnpj_cliente CHAR(14),
    email_cliente VARCHAR(150),
    telefone_cliente VARCHAR(20),
    endereco_cliente VARCHAR(255),

    CONSTRAINT chk_cliente_tipo
    CHECK (tipo_cliente IN ('B2C', 'B2B'))
) ENGINE=InnoDB;

CREATE TABLE Marca (
    id_marca INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nome_marca VARCHAR(120) NOT NULL
) ENGINE=InnoDB;

CREATE TABLE Cor (
    id_cor INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nome_cor VARCHAR(50) NOT NULL,
    hexadecimal CHAR(7) NOT NULL
) ENGINE=InnoDB;

CREATE TABLE Tamanho (
    id_tamanho INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    sigla_tamanho VARCHAR(20) NOT NULL
) ENGINE=InnoDB;

CREATE TABLE Produto (
    id_produto INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nome_produto VARCHAR(150) NOT NULL,
    codigo_produto VARCHAR(50) NOT NULL,
    descricao_produto VARCHAR(255) NOT NULL,
    referencia_produto VARCHAR(80),
    codigo_fiscal_produto VARCHAR(50),
    codigo_ncm CHAR(8),
    classificacao_produto VARCHAR(100),
    colecao_produto VARCHAR(100),
    subcolecao_produto VARCHAR(100),
    grupo_produto VARCHAR(100) NOT NULL,
    categoria_produto VARCHAR(100) NOT NULL,
    tipo_produto VARCHAR(100) NOT NULL,
    pais_origem_produto VARCHAR(80),
    unidade_tributacao_produto VARCHAR(20) NOT NULL,
    id_marca INT NOT NULL
) ENGINE=InnoDB;

CREATE TABLE Produto_SKU (
    id_sku INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    codigo_sku VARCHAR(50) NOT NULL UNIQUE,
    altura FLOAT,
    peso FLOAT,
    comprimento FLOAT,
    quantidade_estoque INT,
    id_cor INT,
    id_tamanho INT,
    id_produto INT NOT NULL
) ENGINE=InnoDB;
 
CREATE TABLE Venda (
    id_venda INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    data_venda DATETIME NOT NULL,
    canal_venda VARCHAR(30) NOT NULL,
    desconto_venda FLOAT NOT NULL DEFAULT 0,
    status_venda VARCHAR(30) NOT NULL,
    id_cliente INT,
    id_funcionario INT
) ENGINE=InnoDB;

CREATE TABLE Item_venda (
    id_item_venda INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    quantidade_item_venda INT NOT NULL,
    preco_unitario_venda FLOAT NOT NULL,
    id_sku INT NOT NULL,
    id_venda INT NOT NULL
) ENGINE=InnoDB;

CREATE TABLE Pagamento (
    id_pagamento INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    forma_pagamento VARCHAR(30) NOT NULL,
    valor_pagamento FLOAT NOT NULL,
    status_pagamento VARCHAR(30) NOT NULL,
    data_pagamento DATETIME,
    codigo_transacao VARCHAR(100),
    data_confirmacao DATETIME,
    id_venda INT NOT NULL
) ENGINE=InnoDB;

CREATE TABLE pedido_online (
    id_pedido INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    codigo_rastreamento_pedido VARCHAR(100),
    data_envio_pedido DATETIME,
    data_pedido DATETIME NOT NULL,
    status_pedido VARCHAR(30) NOT NULL,
    status_pagamento_pedido VARCHAR(30) NOT NULL,
    data_entrega_pedido DATETIME,
    data_confirmacao DATETIME,
    id_cliente INT NOT NULL,
    id_venda INT NOT NULL
) ENGINE=InnoDB;

CREATE TABLE troca_devolucao (
    id_ocorrencia INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    tipo_ocorrencia VARCHAR(30) NOT NULL,
    motivo_ocorrencia VARCHAR(500) NOT NULL,
    status_ocorrencia VARCHAR(30) NOT NULL,
    data_solicitacao_ocorrencia DATETIME NOT NULL,
    valor_estorno_ocorrencia FLOAT,
    id_pedido INT NOT NULL
) ENGINE=InnoDB;

CREATE TABLE pedido_reposicao (
    id_reposicao INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    data_reposicao DATE NOT NULL,
    data_prevista_entrega DATE,
    data_entrega_real DATE,
    status_reposicao VARCHAR(30) NOT NULL,
    observacao_reposicao VARCHAR(500),
    valor_total_reposicao FLOAT NOT NULL,
    id_fornecedor INT NOT NULL
) ENGINE=InnoDB;

CREATE TABLE Item_reposicao (
    id_item_reposicao INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    quantidade_solicitada INT NOT NULL,
    quantidade_recebida INT NOT NULL DEFAULT 0,
    preco_item_reposicao FLOAT NOT NULL,
    status_item_reposicao VARCHAR(30) NOT NULL,
    desconto_item FLOAT NOT NULL DEFAULT 0,
    id_reposicao INT NOT NULL,
    id_sku INT NOT NULL
) ENGINE=InnoDB;

CREATE TABLE Movimentacao_estoque (
    id_movimentacao INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    tipo_movimentacao VARCHAR(50) NOT NULL,
    quantidade_movimentada INT NOT NULL,
    data_movimentacao DATETIME NOT NULL,
    motivo_movimentacao VARCHAR(250) NOT NULL,
    documento_referencia VARCHAR(100),
    observacao_movimentacao VARCHAR(500),
    data_atualizacao_estoque DATETIME,
    id_sku INT NOT NULL,
    id_item_reposicao INT,
    id_funcionario INT NOT NULL
) ENGINE=InnoDB;

CREATE TABLE tabela_preco (
    id_tabela_preco INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nome_tabela_preco VARCHAR(100) NOT NULL,
    tipo_cliente_tabela_preco VARCHAR(50) NOT NULL,
    data_inicio_tabela_preco DATETIME NOT NULL,
    data_fim_tabela_preco DATETIME,
    canal_venda_tabela_preco VARCHAR(50) NOT NULL
) ENGINE=InnoDB;

CREATE TABLE Item_tabela_preco (
    id_item_tabela_preco INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    preco_unitario_venda FLOAT NOT NULL,
    data_inicio_vigencia DATE NOT NULL,
    data_fim_vigencia DATE,
    id_tabela_preco INT NOT NULL,
    id_sku INT NOT NULL
) ENGINE=InnoDB;

CREATE TABLE historico_preco (
    id_historico_preco INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    preco_anterior FLOAT NOT NULL,
    preco_novo FLOAT NOT NULL,
    preco_compra_reposicao FLOAT NOT NULL,
    data_inicio_preco DATE NOT NULL,
    data_alteracao_preco DATETIME NOT NULL,
    data_fim_preco DATE,
    id_sku INT NOT NULL,
    id_tabela_preco INT NOT NULL
) ENGINE=InnoDB;

CREATE TABLE conta_a_pagar (
    id_conta_pagar INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    numero_documento VARCHAR(100) NOT NULL,
    data_emissao DATE NOT NULL,
    data_vencimento DATE NOT NULL,
    data_pagamento DATE,
    valor_total FLOAT NOT NULL,
    status_conta VARCHAR(50) NOT NULL,
    data_cadastro DATE NOT NULL,
    id_reposicao INT NOT NULL
) ENGINE=InnoDB;

CREATE TABLE usuario_sistema (
    id_usuario INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    login_usuario VARCHAR(80) NOT NULL,
    senha_hash VARCHAR(255) NOT NULL,
    perfil_acesso VARCHAR(50) NOT NULL,
    status_usuario VARCHAR(20) NOT NULL,
    data_criacao DATETIME NOT NULL,
    ultimo_acesso DATETIME,
    id_funcionario INT NOT NULL
) ENGINE=InnoDB;

CREATE TABLE LOG_AUDITORIA (
    id_log BIGINT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    data_hora_log DATETIME NOT NULL,
    tipo_operacao VARCHAR(30) NOT NULL,
    entidade_afetada VARCHAR(60) NOT NULL,
    descricao_operacao TEXT NOT NULL,
    justificativa_operacao TEXT,
    id_registro_afetado VARCHAR(100) NOT NULL,
    valor_anterior TEXT,
    valor_novo TEXT,
    id_usuario INT NOT NULL
) ENGINE=InnoDB;

CREATE TABLE BACKUP_SISTEMA (
    id_backup INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    tipo_backup VARCHAR(30) NOT NULL,
    data_inicio_backup DATETIME NOT NULL,
    data_fim_backup DATETIME,
    local_armazenamento VARCHAR(500) NOT NULL,
    status_backup VARCHAR(30) NOT NULL,
    tamanho_backup_bytes BIGINT UNSIGNED,
    id_usuario INT NULL
) ENGINE=InnoDB;

CREATE TABLE REGISTRO_RESTAURACAO (
    id_restauracao INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    data_inicio_restauracao DATETIME NOT NULL,
    data_fim_restauracao DATETIME,
    status_restauracao VARCHAR(30) NOT NULL,
    motivo_restauracao VARCHAR(255) NOT NULL,
    observacao_restauracao VARCHAR(255),
    id_backup INT NOT NULL,
    id_usuario INT NOT NULL
) ENGINE=InnoDB;

-- 3. CONSTRAINTS: FK, UNIQUE E CHECK
ALTER TABLE Cor
ADD CONSTRAINT uq_cor_nome UNIQUE (nome_cor),
ADD CONSTRAINT chk_cor_hex CHECK (hexadecimal REGEXP '^#[0-9A-Fa-f]{6}$');

ALTER TABLE Tamanho
ADD CONSTRAINT uq_tamanho_sigla UNIQUE (sigla_tamanho);

ALTER TABLE Marca
ADD CONSTRAINT uq_marca_nome UNIQUE (nome_marca);

ALTER TABLE Cliente
ADD CONSTRAINT uq_cliente_cpf UNIQUE (cpf_cliente),
ADD CONSTRAINT uq_cliente_cnpj UNIQUE (cnpj_cliente);

ALTER TABLE Departamento
ADD CONSTRAINT uq_departamento_nome UNIQUE (nome_departamento);

ALTER TABLE Fornecedor
ADD CONSTRAINT uq_fornecedor_cnpj UNIQUE (cnpj_fornecedor),
ADD CONSTRAINT chk_fornecedor_status CHECK (status_fornecedor IN ('Ativo', 'Inativo', 'Bloqueado'));

ALTER TABLE Produto
ADD CONSTRAINT uq_produto_codigo UNIQUE (codigo_produto),
ADD CONSTRAINT fk_produto_marca FOREIGN KEY (id_marca) REFERENCES Marca(id_marca);

ALTER TABLE Produto_SKU
ADD CONSTRAINT chk_sku_estoque CHECK (quantidade_estoque IS NULL OR quantidade_estoque >= 0),
ADD CONSTRAINT chk_sku_dimensoes CHECK (
    (altura IS NULL OR altura >= 0)
    AND (peso IS NULL OR peso >= 0)
    AND (comprimento IS NULL OR comprimento >= 0)
),
ADD CONSTRAINT fk_sku_cor FOREIGN KEY (id_cor) REFERENCES Cor(id_cor),
ADD CONSTRAINT fk_sku_tamanho FOREIGN KEY (id_tamanho) REFERENCES Tamanho(id_tamanho),
ADD CONSTRAINT fk_sku_produto FOREIGN KEY (id_produto) REFERENCES Produto(id_produto);

ALTER TABLE Funcionario
ADD CONSTRAINT fk_funcionario_departamento FOREIGN KEY (id_departamento) REFERENCES Departamento(id_departamento);

ALTER TABLE Venda
ADD CONSTRAINT chk_venda_desconto CHECK (desconto_venda >= 0),
ADD CONSTRAINT fk_venda_cliente FOREIGN KEY (id_cliente) REFERENCES Cliente(id_cliente),
ADD CONSTRAINT fk_venda_funcionario FOREIGN KEY (id_funcionario) REFERENCES Funcionario(id_funcionario);

ALTER TABLE Item_venda
ADD CONSTRAINT chk_item_venda_qtd CHECK (quantidade_item_venda > 0),
ADD CONSTRAINT chk_item_venda_preco CHECK (preco_unitario_venda >= 0),
ADD CONSTRAINT fk_item_venda_sku FOREIGN KEY (id_sku) REFERENCES Produto_SKU(id_sku),
ADD CONSTRAINT fk_item_venda_venda FOREIGN KEY (id_venda) REFERENCES Venda(id_venda);

ALTER TABLE tabela_preco
ADD CONSTRAINT chk_tabela_preco_periodo CHECK (
    data_fim_tabela_preco IS NULL
    OR data_fim_tabela_preco >= data_inicio_tabela_preco
);

ALTER TABLE Item_tabela_preco
ADD CONSTRAINT chk_item_tabela_preco_valor CHECK (preco_unitario_venda >= 0),
ADD CONSTRAINT fk_item_tabela_preco_tabela FOREIGN KEY (id_tabela_preco) REFERENCES tabela_preco(id_tabela_preco),
ADD CONSTRAINT fk_item_tabela_preco_sku FOREIGN KEY (id_sku) REFERENCES Produto_SKU(id_sku);

ALTER TABLE historico_preco
ADD CONSTRAINT chk_historico_preco CHECK (
    preco_anterior >= 0
    AND preco_novo >= 0
    AND preco_compra_reposicao >= 0
),
ADD CONSTRAINT fk_historico_preco_sku FOREIGN KEY (id_sku) REFERENCES Produto_SKU(id_sku),
ADD CONSTRAINT fk_historico_preco_tabela FOREIGN KEY (id_tabela_preco) REFERENCES tabela_preco(id_tabela_preco);

ALTER TABLE pedido_online
ADD CONSTRAINT uq_pedido_venda UNIQUE (id_venda),
ADD CONSTRAINT fk_pedido_cliente FOREIGN KEY (id_cliente) REFERENCES Cliente(id_cliente),
ADD CONSTRAINT fk_pedido_venda FOREIGN KEY (id_venda) REFERENCES Venda(id_venda);

ALTER TABLE troca_devolucao
ADD CONSTRAINT chk_estorno CHECK (
    valor_estorno_ocorrencia IS NULL
    OR valor_estorno_ocorrencia >= 0
),
ADD CONSTRAINT fk_troca_pedido FOREIGN KEY (id_pedido) REFERENCES pedido_online(id_pedido);

ALTER TABLE Pagamento
ADD CONSTRAINT chk_pagamento_valor CHECK (valor_pagamento > 0),
ADD CONSTRAINT fk_pagamento_venda FOREIGN KEY (id_venda) REFERENCES Venda(id_venda);

ALTER TABLE pedido_reposicao
ADD CONSTRAINT chk_reposicao_valor CHECK (valor_total_reposicao >= 0),
ADD CONSTRAINT fk_reposicao_fornecedor FOREIGN KEY (id_fornecedor) REFERENCES Fornecedor(id_fornecedor);

ALTER TABLE Item_reposicao
ADD CONSTRAINT chk_item_reposicao_qtd CHECK (
    quantidade_solicitada > 0
    AND quantidade_recebida >= 0
    AND quantidade_recebida <= quantidade_solicitada
),
ADD CONSTRAINT chk_item_reposicao_preco CHECK (preco_item_reposicao >= 0),
ADD CONSTRAINT chk_item_reposicao_desconto CHECK (desconto_item >= 0),
ADD CONSTRAINT fk_item_reposicao_pedido FOREIGN KEY (id_reposicao) REFERENCES pedido_reposicao(id_reposicao),
ADD CONSTRAINT fk_item_reposicao_sku FOREIGN KEY (id_sku) REFERENCES Produto_SKU(id_sku);

ALTER TABLE conta_a_pagar
ADD CONSTRAINT chk_conta_valor CHECK (valor_total > 0),
ADD CONSTRAINT fk_conta_reposicao FOREIGN KEY (id_reposicao) REFERENCES pedido_reposicao(id_reposicao);

ALTER TABLE Movimentacao_estoque
ADD CONSTRAINT chk_movimentacao_qtd CHECK (quantidade_movimentada <> 0),
ADD CONSTRAINT fk_movimentacao_sku FOREIGN KEY (id_sku) REFERENCES Produto_SKU(id_sku),
ADD CONSTRAINT fk_movimentacao_item_reposicao FOREIGN KEY (id_item_reposicao) REFERENCES Item_reposicao(id_item_reposicao),
ADD CONSTRAINT fk_movimentacao_funcionario FOREIGN KEY (id_funcionario) REFERENCES Funcionario(id_funcionario);

ALTER TABLE usuario_sistema
ADD CONSTRAINT uq_usuario_login UNIQUE (login_usuario),
ADD CONSTRAINT fk_usuario_funcionario FOREIGN KEY (id_funcionario) REFERENCES Funcionario(id_funcionario);

ALTER TABLE LOG_AUDITORIA
ADD CONSTRAINT fk_log_usuario FOREIGN KEY (id_usuario) REFERENCES usuario_sistema(id_usuario);

ALTER TABLE BACKUP_SISTEMA
ADD CONSTRAINT fk_backup_usuario FOREIGN KEY (id_usuario) REFERENCES usuario_sistema(id_usuario);

ALTER TABLE REGISTRO_RESTAURACAO
ADD CONSTRAINT fk_restauracao_backup FOREIGN KEY (id_backup) REFERENCES BACKUP_SISTEMA(id_backup);

ALTER TABLE REGISTRO_RESTAURACAO
ADD CONSTRAINT fk_restauracao_usuario FOREIGN KEY (id_usuario) REFERENCES usuario_sistema(id_usuario);

ALTER TABLE BACKUP_SISTEMA
ADD CONSTRAINT chk_backup_periodo CHECK (data_fim_backup IS NULL OR data_fim_backup >= data_inicio_backup);

ALTER TABLE REGISTRO_RESTAURACAO
ADD CONSTRAINT chk_restauracao_periodo CHECK ( data_fim_restauracao IS NULL OR data_fim_restauracao >= data_inicio_restauracao);

-- 4. INSERT INTO - MASSA DE DADOS 

INSERT INTO `Fornecedor` (`id_fornecedor`, `nome_fornecedor`, `razao_social_fornecedor`, `cnpj_fornecedor`, `inscricao_estadual_fornecedor`, `telefone_fornecedor`, `email_fornecedor`, `endereco_fornecedor`, `status_fornecedor`, `data_cadastro_fornecedor`) VALUES
(1, 'Malharia Horizonte', 'Horizonte Indústria Têxtil Ltda.', '28471635000142', '114.829.330.118', '1133224455', 'vendas@horizonte.example', 'Rua da Mooca, 1250, Mooca, São Paulo - SP', 'Ativo', '2024-02-15'),
(2, 'Tecidos Vale Sul', 'Vale Sul Tecidos e Aviamentos Ltda.', '39625184000176', '208.551.420.110', '1932345678', 'comercial@valesul.example', 'Av. das Indústrias, 420, Americana - SP', 'Ativo', '2023-11-08'),
(3, 'Confecções Estrela do Sul', 'Estrela do Sul Confecções Ltda.', '51739462000105', '908.173.622.114', '4733456789', 'pedidos@estreladosul.example', 'Rua Blumenau, 770, Joinville - SC', 'Ativo', '2024-06-20'),
(4, 'Embalagens Nova Era', 'Nova Era Embalagens Ltda.', '16283745000163', '147.258.369.110', '1144556677', 'atendimento@novaera.example', 'Rua do Gasômetro, 510, Brás, São Paulo - SP', 'Ativo', '2025-01-10'),
(5, 'Malhas Primavera', 'Primavera Indústria de Malhas Ltda.', '62847135000120', '123.456.789.110', '1133556677', 'vendas@primavera.example', 'Rua Miller, 250, Brás, São Paulo - SP', 'Ativo', '2024-08-12'),
(6, 'Têxtil Santa Catarina', 'Santa Catarina Têxtil Ltda.', '73915284000161', '234.567.890.121', '4733221100', 'comercial@santacatarina.example', 'Rua das Fábricas, 180, Blumenau - SC', 'Ativo', '2024-09-20'),
(7, 'Confecções Bela Vista', 'Bela Vista Confecções Ltda.', '84126395000102', '345.678.901.132', '1133445566', 'pedidos@belavista.example', 'Rua Bresser, 640, Brás, São Paulo - SP', 'Ativo', '2025-02-14'),
(8, 'Aviamentos Central', 'Central de Aviamentos Ltda.', '95237416000143', '456.789.012.143', '1133667788', 'atendimento@aviamentoscentral.example', 'Rua Joli, 320, Brás, São Paulo - SP', 'Ativo', '2025-03-05'),
(9, 'Malharia Dois Irmãos', 'Dois Irmãos Malharia Ltda.', '16348527000184', '567.890.123.154', '1933557799', 'vendas@doisirmaos.example', 'Av. Brasil, 900, Americana - SP', 'Ativo', '2025-04-18'),
(10, 'Têxtil Nova Estação', 'Nova Estação Têxtil Ltda.', '27459638000125', '678.901.234.165', '1133778899', 'comercial@novaestacao.example', 'Rua Oriente, 880, Brás, São Paulo - SP', 'Ativo', '2025-05-22');

INSERT INTO `Departamento` (`id_departamento`, `nome_departamento`) VALUES
(1, 'Vendas e Atendimento'),
(2, 'Estoque e Logística'),
(3, 'Financeiro'),
(4, 'Tecnologia da Informação'),
(5, 'Compras'),
(6, 'Marketing'),
(7, 'Recursos Humanos'),
(8, 'E-commerce'),
(9, 'Controle de Qualidade'),
(10, 'Expedição');

INSERT INTO `Funcionario` (`id_funcionario`, `nome_funcionario`, `cargo_funcionario`, `id_departamento`) VALUES
(1, 'Fernanda Lima Carvalho', 'Supervisora de Vendas', 1),
(2, 'Diego Almeida Santos', 'Assistente de Estoque', 2),
(3, 'Patrícia Nunes Ribeiro', 'Analista Financeira', 3),
(4, 'Lucas Barros Mendes', 'Analista de Sistemas', 4),
(5, 'Renata Souza Martins', 'Analista de Compras', 5),
(6, 'Bruno Teixeira Costa', 'Vendedor', 1),
(7, 'Gabriela Ferreira Lopes', 'Analista de Marketing', 6),
(8, 'André Luiz Moreira', 'Assistente de Recursos Humanos', 7),
(9, 'Isabela Costa Almeida', 'Assistente de E-commerce', 8),
(10, 'Marcelo Ribeiro Santos', 'Conferente de Qualidade', 9);

INSERT INTO `Cliente`
(`id_cliente`, `nome_completo`, `tipo_cliente`, `cpf_cliente`, `cnpj_cliente`, `email_cliente`, `telefone_cliente`, `endereco_cliente`)
VALUES
(1, 'Mariana Oliveira Costa', 'B2C', '48392017605', NULL, 'mariana.costa@example.com', '11987654321', 'Rua Harmonia, 215, Vila Madalena, São Paulo - SP'),
(2, 'Rafael Mendes Ferreira', 'B2C', '52718493062', NULL, 'rafael.ferreira@example.com', '11976543210', 'Rua dos Pinheiros, 840, Pinheiros, São Paulo - SP'),
(3, 'Camila Rodrigues Alves', 'B2C', '61483920571', NULL, 'camila.alves@example.com', '11965432109', 'Av. Jabaquara, 1420, Saúde, São Paulo - SP'),
(4, 'Estilo Urbano Comércio de Roupas Ltda.', 'B2B', NULL, '48372615000190', 'compras@estilourbano.example', '1132456789', 'Rua Silva Teles, 380, Brás, São Paulo - SP'),
(5, 'Bella Forma Moda Fitness Ltda.', 'B2B', NULL, '57294163000108', 'pedidos@bellaforma.example', '1134567890', 'Rua Oriente, 615, Brás, São Paulo - SP'),
(6, 'Juliana Martins Ribeiro', 'B2C', '39581726409', NULL, 'juliana.ribeiro@example.com', '11954321098', 'Rua Vergueiro, 2210, Vila Mariana, São Paulo - SP'),
(7, 'Beatriz Almeida Santos', 'B2C', '72849163520', NULL, 'beatriz.santos@example.com', '11981234567', 'Rua Augusta, 520, Consolação, São Paulo - SP'),
(8, 'Gabriel Henrique Lima', 'B2C', '83915274601', NULL, 'gabriel.lima@example.com', '11982345678', 'Rua Tuiuti, 780, Tatuapé, São Paulo - SP'),
(9, 'Moda Ativa Comércio Ltda.', 'B2B', NULL, '68429173000156', 'compras@modaativa.example', '1134567891', 'Rua Maria Marcolina, 420, Brás, São Paulo - SP'),
(10, 'Corpo em Movimento Fitness Ltda.', 'B2B', NULL, '79531284000197', 'pedidos@corpoemmovimento.example', '1135678902', 'Rua Miller, 390, Brás, São Paulo - SP');

INSERT INTO `Marca` (`id_marca`, `nome_marca`) VALUES
(1, 'Farm'),
(2, 'Nike'),
(3, 'Vitta Move'),
(4, 'Hering'),
(5, 'Live!'),
(6, 'Lupo'),
(7, 'Track & Field'),
(8, 'Puma'),
(9, 'Adidas'),
(10, 'Hope');

INSERT INTO `Cor` (`id_cor`, `nome_cor`, `hexadecimal`) VALUES
(1, 'Preto', '#000000'),
(2, 'Branco', '#FFFFFF'),
(3, 'Azul-marinho', '#172A4A'),
(4, 'Rosa-claro', '#F2B8C6'),
(5, 'Vinho', '#722F37'),
(6, 'Verde-oliva', '#708238'),
(7, 'Cinza-mescla', '#B8B8B8'),
(8, 'Bege', '#D8C3A5'),
(9, 'Lilás', '#C8A2C8'),
(10, 'Vermelho', '#FF0000');

INSERT INTO `Tamanho` (`id_tamanho`, `sigla_tamanho`) VALUES
(1, 'PP'),
(2, 'P'),
(3, 'M'),
(4, 'G'),
(5, 'GG'),
(6, '36'),
(7, '38'),
(8, '40'),
(9, '42'),
(10, '44'),
(11, 'Único');

INSERT INTO `Produto`
(`id_produto`, `nome_produto`, `codigo_produto`, `descricao_produto`,`referencia_produto`, `codigo_fiscal_produto`, `codigo_ncm`,`classificacao_produto`, `colecao_produto`, `subcolecao_produto`,`grupo_produto`, `categoria_produto`, `tipo_produto`,`pais_origem_produto`, `unidade_tributacao_produto`, `id_marca`) VALUES
(1, 'Legging Cintura Alta', 'LEG-001', 'Legging fitness de cintura alta', 'LA-001', '789100000001', '61046300', 'Vestuário feminino', 'Essencial 2026', 'Performance', 'Roupas fitness', 'Calças', 'Legging', 'Brasil', 'UN', 1),
(2, 'Top Esportivo', 'TOP-014', 'Top esportivo de sustentação média', 'TA-014', '789100000014', '62121000', 'Vestuário feminino', 'Essencial 2026', 'Performance', 'Roupas fitness', 'Tops', 'Top esportivo', 'Brasil', 'UN', 1),
(3, 'Sutiã Microfibra', 'SUT-022', 'Sutiã sem aro em microfibra', 'LI-022', '789100000022', '62121000', 'Moda íntima', 'Conforto Diário', 'Microfibra', 'Moda íntima', 'Sutiãs', 'Sutiã', 'Brasil', 'UN', 2),
(4, 'Calcinha Biquíni', 'CAL-008', 'Calcinha biquíni em algodão', 'LI-008', '789100000008', '61082100', 'Moda íntima', 'Conforto Diário', 'Algodão', 'Moda íntima', 'Calcinhas', 'Biquíni', 'Brasil', 'UN', 2),
(5, 'Camiseta Básica', 'CAM-031', 'Camiseta básica de algodão', 'VB-031', '789100000031', '61091000', 'Vestuário básico', 'Básicos Atemporais', 'Algodão', 'Roupas casuais', 'Camisetas', 'Camiseta', 'Brasil', 'UN', 4),
(6, 'Short Fitness', 'SHO-005', 'Short fitness com bolso lateral', 'VM-005', '789100000005', '61046300', 'Vestuário feminino', 'Movimento 2026', 'Treino', 'Roupas fitness', 'Shorts', 'Short esportivo', 'Brasil', 'UN', 3),
(7, 'Blusa Canelada', 'BLU-012', 'Blusa canelada de manga curta', 'VB-012', '789100000012', '61061000', 'Vestuário feminino', 'Básicos Atemporais', 'Canelados', 'Roupas casuais', 'Blusas', 'Blusa', 'Brasil', 'UN', 4),
(8, 'Jaqueta Fitness', 'JAQ-018', 'Jaqueta esportiva leve para atividades físicas.', 'JF-018', '789100000018', '61023000', 'Vestuário feminino', 'Movimento 2026', 'Academia', 'Roupas fitness', 'Jaquetas', 'Jaqueta esportiva', 'Brasil', 'UN', 5),
(9, 'Body Microfibra', 'BOD-025', 'Body feminino confeccionado em microfibra.', 'BM-025', '789100000025', '62121000', 'Moda íntima', 'Conforto Diário', 'Microfibra', 'Moda íntima', 'Bodies', 'Body', 'Brasil', 'UN', 6),
(10, 'Calça Jogger', 'CAL-042', 'Calça jogger feminina com cós elástico.', 'CJ-042', '789100000042', '61046300', 'Vestuário feminino', 'Essencial 2026', 'Casual', 'Roupas casuais', 'Calças', 'Jogger', 'Brasil', 'UN', 7),
(11, 'Regata Fitness', 'REG-011', '', 'RF-011','789100000011', '61099000', 'Vestuário feminino','Movimento 2026', 'Treino', 'Roupas fitness','Regatas', 'Regata', 'Brasil', 'UN', 3);

INSERT INTO `Produto_SKU`
(`id_sku`, `codigo_sku`, `altura`, `peso`, `comprimento`, `quantidade_estoque`, `id_cor`, `id_tamanho`, `id_produto`)
VALUES
(1, 'LEG001-PRE-P', 2.0, 0.24, 28.0, 42, 1, 2, 1),
(2, 'LEG001-PRE-M', 2.0, 0.255, 30.0, 35, 1, 3, 1),
(3, 'LEG001-VIN-G', 2.0, 0.27, 32.0, 18, 5, 4, 1),
(4, 'TOP014-PRE-M', 2.0, 0.12, 20.0, 27, 1, 3, 2),
(5, 'TOP014-RCL-P', 2.0, 0.115, 19.0, 16, 4, 2, 2),
(6, 'SUT022-BRA-M', 2.0, 0.09, 18.0, 31, 2, 3, 3),
(7, 'SUT022-PRE-G', 2.0, 0.095, 20.0, 14, 1, 4, 3),
(8, 'CAL008-BRA-M', 1.5, 0.055, 15.0, 60, 2, 3, 4),
(9, 'CAL008-PRE-G', 1.5, 0.06, 16.0, 44, 1, 4, 4),
(10, 'CAM031-BRA-M', 2.5, 0.18, 27.0, 50, 2, 3, 5),
(11, 'CAM031-CNZ-G', 2.5, 0.19, 29.0, 22, 7, 4, 5),
(12, 'SHO005-OLI-M', 2.0, 0.21, 25.0, 19, 6, 3, 6),
(13, 'SHO005-PRE-G', 2.0, 0.225, 27.0, 11, 1, 4, 6),
(14, 'BLU012-BEG-P', 2.0, 0.16, 24.0, 25, 8, 2, 7),
(15, 'BLU012-AZM-M', 2.0, 0.17, 26.0, 17, 3, 3, 7),
(16,'ANS-001-AZ-P', 2.00, 0.20, 20.00, 15, 1, 1, 1),
(17,'ANS-001-PT-M', 2.00, 0.20, 20.00, 0, 2, 2, 1);

INSERT INTO `Venda` (`id_venda`, `data_venda`, `canal_venda`, `desconto_venda`, `status_venda`, `id_cliente`, `id_funcionario`) VALUES
(1, '2026-10-28 10:24:00', 'Loja física', 0.0, 'Concluída', 1, 1),
(2, '2026-10-28 14:42:00', 'E-commerce', 10.0, 'Concluída', 2, NULL),
(3, '2026-10-29 11:16:00', 'Atacado', 35.0, 'Concluída', 4, 6),
(4, '2026-10-30 16:08:00', 'E-commerce', 0.0, 'Aguardando pagamento', 3, NULL),
(5, '2026-10-31 09:37:00', 'Loja física', 5.0, 'Concluída', 6, 1),
(6, '2026-11-01 13:51:00', 'Atacado', 50.0, 'Em separação', 5, 6),
(7, '2026-11-01 15:20:00', 'E-commerce', 0.0, 'Concluída', 6, NULL),
(8, '2026-11-02 10:12:00', 'Loja física', 5.0, 'Concluída', 7, 7),
(9, '2026-11-03 09:45:00', 'E-commerce', 0.0, 'Em separação', 8, NULL),
(10, '2026-11-02 14:50:00', 'Atacado', 25.0, 'Concluída', 9, 6),
(11, '2026-11-04 11:30:00', 'E-commerce', 10.0, 'Em separação', 10, NULL),
(12,'2026-11-02', 'Loja Física', 10.00, 'Cancelada', 2, 1);

INSERT INTO `Item_venda` (`id_item_venda`, `quantidade_item_venda`, `preco_unitario_venda`, `id_sku`, `id_venda`) VALUES
(1, 1, 129.9, 2, 1),
(2, 1, 79.9, 4, 1),
(3, 2, 89.9, 10, 2),
(4, 1, 119.9, 12, 2),
(5, 12, 64.9, 1, 3),
(6, 12, 39.9, 4, 3),
(7, 1, 54.9, 6, 4),
(8, 2, 32.9, 8, 5),
(9, 1, 69.9, 14, 5),
(10, 20, 59.9, 10, 6),
(11, 15, 29.9, 8, 6);

INSERT INTO `Pagamento`
(`id_pagamento`, `forma_pagamento`, `valor_pagamento`, `status_pagamento`,`data_pagamento`, `codigo_transacao`, `data_confirmacao`, `id_venda`)VALUES
(1, 'Cartão de crédito', 209.8, 'Aprovado', '2026-10-28 10:25:00', 'TXN-ANS-20261028-001', '2026-10-28 10:25:05', 1),
(2, 'Pix', 289.7, 'Aprovado', '2026-10-28 14:43:00', 'PIX-ANS-20261028-002', '2026-10-28 14:43:08', 2),
(3, 'Transferência bancária', 1257.6, 'Aprovado', '2026-10-29 11:20:00', 'TED-ANS-20261029-003', '2026-10-29 11:24:30', 3),
(4, 'Pix', 120.7, 'Pendente', NULL, 'PIX-ANS-20261030-004', NULL, 4),
(5, 'Cartão de débito', 97.8, 'Aprovado', '2026-10-31 09:38:00', 'POS-ANS-20261031-005', '2026-10-31 09:38:03', 5),
(6, 'Boleto bancário', 1643.5, 'Pendente', NULL, 'BOL-ANS-20261101-006', NULL, 6),
(7, 'Pix', 159.90, 'Aprovado', '2026-11-01 15:21:00', 'PIX-ANS-20261101-007', '2026-11-01 15:21:05', 7),
(8, 'Cartão de crédito', 219.90, 'Aprovado', '2026-11-02 10:13:00', 'CC-ANS-20261102-008', '2026-11-02 10:13:08', 8),
(9, 'Pix', 89.90, 'Aprovado', '2026-11-03 09:46:00', 'PIX-ANS-20261103-009', '2026-11-03 09:46:04', 9),
(10, 'Transferência bancária', 1240.00, 'Aprovado', '2026-11-02 14:52:00', 'TED-ANS-20261102-010', '2026-11-02 14:55:00', 10),
(11, 'Cartão de crédito', 189.90, 'Pendente', NULL, 'CC-ANS-20261104-011', NULL, 11);

INSERT INTO `pedido_online` (`id_pedido`, `codigo_rastreamento_pedido`, `data_envio_pedido`, `data_pedido`, `status_pedido`, `status_pagamento_pedido`, `data_entrega_pedido`, `data_confirmacao`, `id_cliente`, `id_venda`) VALUES
(1, 'BR549218736SP', '2026-10-29 09:10:00', '2026-10-28 14:42:00', 'Entregue', 'Aprovado', '2026-10-31 15:32:00', '2026-10-31 16:00:00', 2, 2),
(2, 'BR628173945SP', NULL, '2026-10-30 16:08:00', 'Aguardando pagamento', 'Pendente', NULL, NULL, 3, 4),
(3, 'BR731925846SP', '2026-11-01 10:30:00', '2026-10-30 11:25:00', 'Enviado', 'Aprovado', NULL, NULL, 1, 3),
(4, 'BR846219573SP', NULL, '2026-10-31 15:40:00', 'Em separação', 'Aprovado', NULL, NULL, 4, 5),
(5, 'BR925731684SP', '2026-11-02 08:15:00', '2026-11-01 13:20:00', 'Enviado', 'Aprovado', NULL, NULL, 5, 6),
(6, 'BR193847562SP', '2026-11-02 14:00:00', '2026-11-01 17:35:00', 'Enviado', 'Aprovado', NULL, NULL, 6, 7),
(7, 'BR284619375SP', NULL, '2026-11-02 10:12:00', 'Aguardando pagamento', 'Pendente', NULL, NULL, 7, 8),
(8, 'BR375821946SP', NULL, '2026-11-03 09:45:00', 'Em separação', 'Aprovado', NULL, NULL, 8, 9),
(9, 'BR461928357SP', '2026-11-03 16:20:00', '2026-11-02 14:50:00', 'Enviado', 'Aprovado', NULL, NULL, 9, 10),
(10, 'BR572839164SP', NULL, '2026-11-04 11:30:00', 'Em separação', 'Aprovado', NULL, NULL, 10, 11);

INSERT INTO `troca_devolucao` (`id_ocorrencia`, `tipo_ocorrencia`, `motivo_ocorrencia`, `status_ocorrencia`, `data_solicitacao_ocorrencia`, `valor_estorno_ocorrencia`, `id_pedido`) VALUES
(1, 'Troca', 'Cliente solicitou tamanho maior; peça sem sinais de uso.', 'Em análise', '2026-11-01 10:15:00', 0.0, 1),
(2, 'Devolução', 'Pedido duplicado pelo cliente antes da confirmação do pagamento.', 'Aguardando postagem', '2026-11-01 17:20:00', 54.9, 2),
(3,'Troca','Cliente desistiu da solicitação antes do envio do produto.','Cancelada','2026-11-05 14:30:00', 0.00,1),
(4, 'Troca', 'Cliente solicitou a troca por uma cor diferente.', 'Em análise', '2026-11-02 10:00:00', 0.00, 3),
(5, 'Devolução', 'Produto recebido com embalagem danificada.', 'Aguardando postagem', '2026-11-02 14:30:00', 89.90, 4),
(6, 'Troca', 'Cliente solicitou tamanho menor.', 'Concluída', '2026-11-03 09:00:00', 0.00, 5),
(7, 'Devolução', 'Cliente desistiu da compra dentro do prazo.', 'Em análise', '2026-11-03 11:20:00', 119.90, 6),
(8, 'Troca', 'Peça apresentou divergência de tamanho.', 'Em análise', '2026-11-03 15:40:00', 0.00, 7),
(9, 'Devolução', 'Cliente solicitou devolução por arrependimento.', 'Aguardando postagem', '2026-11-04 10:15:00', 69.90, 8),
(10, 'Troca', 'Cliente deseja substituir o produto por outro modelo.', 'Em análise', '2026-11-04 13:30:00', 0.00, 9);

INSERT INTO `pedido_reposicao` (`id_reposicao`, `data_reposicao`, `data_prevista_entrega`, `data_entrega_real`, `status_reposicao`, `observacao_reposicao`, `valor_total_reposicao`, `id_fornecedor`) VALUES
(1, '2026-10-15', '2026-10-22', '2026-10-22', 'Recebido', 'Reposição de leggings e tops para coleção Performance.', 1860.0, 1),
(2, '2026-10-24', '2026-11-05', NULL, 'Em trânsito', 'Lote de camisetas básicas e blusas caneladas.', 1420.0, 3),
(3, '2026-10-30', '2026-11-08', NULL, 'Aguardando confirmação', 'Reposição de peças íntimas em microfibra e algodão.', 980.0, 2),
(4, '2026-11-01', '2026-11-08', '2026-11-08', 'Recebido', 'Reposição de leggings para o estoque de varejo.', 960.00, 5),
(5, '2026-11-02', '2026-11-09', '2026-11-09', 'Recebido', 'Compra de tops esportivos para a coleção Performance.', 720.00, 6),
(6, '2026-11-03', '2026-11-10', '2026-11-10', 'Recebido', 'Reposição de peças de moda íntima.', 660.00, 7),
(7, '2026-11-04', '2026-11-11', '2026-11-11', 'Recebido', 'Reposição de camisetas básicas.', 840.00, 8),
(8, '2026-11-05', '2026-11-12', NULL, 'Em trânsito', 'Compra de tecidos para novas peças.', 1150.00, 9),
(9, '2026-11-06', '2026-11-13', NULL, 'Aguardando confirmação', 'Reposição de blusas e calças.', 920.00, 10),
(10, '2026-11-07', '2026-11-14', NULL, 'Aguardando confirmação', 'Compra de aviamentos para produção.', 480.00, 4);


INSERT INTO `Item_reposicao` (`id_item_reposicao`, `quantidade_solicitada`, `quantidade_recebida`, `preco_item_reposicao`, `status_item_reposicao`, `id_reposicao`, `id_sku`) VALUES
(1, 20, 20, 48.0, 'Recebido', 1, 1),
(2, 15, 15, 36.0, 'Recebido', 1, 4),
(3, 30, 0, 23.0, 'Em trânsito', 2, 10),
(4, 20, 0, 28.0, 'Em trânsito', 2, 14),
(5, 40, 0, 16.5, 'Aguardando confirmação', 3, 8),
(6, 20, 0, 29.0, 'Aguardando confirmação', 3, 6),
(7, 20, 20, 48.00, 'Recebido', 4, 1),
(8, 15, 15, 36.00, 'Recebido', 5, 4),
(9, 40, 40, 16.50, 'Recebido', 6, 8),
(10, 30, 30, 23.00, 'Recebido', 7, 10);

INSERT INTO `Movimentacao_estoque` (`id_movimentacao`, `tipo_movimentacao`, `quantidade_movimentada`, `data_movimentacao`, `motivo_movimentacao`, `documento_referencia`, `observacao_movimentacao`, `data_atualizacao_estoque`, `id_sku`, `id_item_reposicao`, `id_funcionario`) VALUES
(1, 'Entrada', 20, '2026-10-22 09:15:00', 'Recebimento de reposição do fornecedor', 'NF-HT-2026-1048', 'Conferência concluída sem divergências.', '2026-10-22 09:20:00', 1, 1, 2),
(2, 'Entrada', 15, '2026-10-22 09:30:00', 'Recebimento de reposição do fornecedor', 'NF-HT-2026-1048', 'Lote etiquetado e armazenado.', '2026-10-22 09:35:00', 4, 2, 2),
(3, 'Saída', 1, '2026-10-28 10:24:00', 'Venda realizada no caixa', 'VENDA-0001', 'Separação concluída no atendimento.', '2026-10-28 10:25:00', 2, NULL, 1),
(4, 'Saída', 2, '2026-10-28 14:45:00', 'Venda online faturada', 'PEDIDO-0001', 'Itens embalados para expedição.', '2026-10-28 14:50:00', 10, NULL, 2),
(5, 'Ajuste', -2, '2026-10-30 08:40:00', 'Ajuste após inventário cíclico', 'INV-2026-1030', 'Duas unidades com avaria identificadas.', '2026-10-30 08:45:00', 13, NULL, 2),
(6, 'Saída', 12, '2026-10-29 11:16:00', 'Venda para cliente atacadista', 'VENDA-0003', 'Separação em lote para cliente empresarial.', '2026-10-29 11:25:00', 1, NULL, 2),
(7, 'Entrada', 20, '2026-11-08 09:00:00', 'Recebimento de reposição do fornecedor', 'NF-PR-2026-004', 'Mercadorias conferidas e armazenadas.', '2026-11-08 09:10:00', 1, 7, 2),
(8, 'Entrada', 15, '2026-11-09 09:30:00', 'Recebimento de reposição do fornecedor', 'NF-PR-2026-005', 'Lote recebido sem divergências.', '2026-11-09 09:40:00', 4, 8, 2),
(9, 'Entrada', 40, '2026-11-10 10:00:00', 'Recebimento de reposição do fornecedor', 'NF-PR-2026-006', 'Peças conferidas e encaminhadas ao estoque.', '2026-11-10 10:15:00', 8, 9, 7),
(10, 'Entrada', 30, '2026-11-11 08:45:00', 'Recebimento de reposição do fornecedor', 'NF-PR-2026-007', 'Entrada registrada após conferência.', '2026-11-11 09:00:00', 10, 10, 7);


INSERT INTO `tabela_preco` (`id_tabela_preco`, `nome_tabela_preco`, `tipo_cliente_tabela_preco`, `data_inicio_tabela_preco`, `data_fim_tabela_preco`, `canal_venda_tabela_preco`) VALUES
(1, 'Varejo Loja 2026', 'Pessoa Física', '2026-01-01 00:00:00', NULL, 'Loja física'),
(2, 'E-commerce Primavera 2026', 'Pessoa Física', '2026-09-01 00:00:00', '2026-12-31 23:59:59', 'E-commerce'),
(3, 'Atacado Parceiros 2026', 'Pessoa Jurídica', '2026-01-01 00:00:00', NULL, 'Atacado'),
(4, 'Varejo Verão 2026', 'Pessoa Física', '2026-11-01 00:00:00', '2027-02-28 23:59:59', 'Loja física'),
(5, 'E-commerce Black Friday 2026', 'Pessoa Física', '2026-11-01 00:00:00', '2026-11-30 23:59:59', 'E-commerce'),
(6, 'Atacado Verão 2026', 'Pessoa Jurídica', '2026-11-01 00:00:00', '2027-02-28 23:59:59', 'Atacado'),
(7, 'Varejo Básicos 2027', 'Pessoa Física', '2027-01-01 00:00:00', NULL, 'Loja física'),
(8, 'E-commerce Básicos 2027', 'Pessoa Física', '2027-01-01 00:00:00', NULL, 'E-commerce'),
(9, 'Atacado Parceiros 2027', 'Pessoa Jurídica', '2027-01-01 00:00:00', NULL, 'Atacado'),
(10, 'Promoção Fitness 2026', 'Pessoa Física', '2026-11-05 00:00:00', '2026-12-31 23:59:59', 'E-commerce');

INSERT INTO `Item_tabela_preco` (`id_item_tabela_preco`, `preco_unitario_venda`, `data_inicio_vigencia`, `data_fim_vigencia`, `id_tabela_preco`, `id_sku`) VALUES
(1, 139.9, '2026-01-01', NULL, 1, 1),
(2, 129.9, '2026-01-01', NULL, 1, 2),
(3, 84.9, '2026-01-01', NULL, 1, 4),
(4, 89.9, '2026-09-01', '2026-12-31', 2, 10),
(5, 119.9, '2026-09-01', '2026-12-31', 2, 12),
(6, 64.9, '2026-01-01', NULL, 3, 1),
(7, 39.9, '2026-01-01', NULL, 3, 4),
(8, 27.9, '2026-01-01', NULL, 3, 8),
(9, 59.9, '2026-01-01', NULL, 1, 10),
(10, 69.9, '2026-01-01', NULL, 1, 14);

INSERT INTO `historico_preco` (`id_historico_preco`, `preco_anterior`, `preco_novo`, `preco_compra_reposicao`, `data_inicio_preco`, `data_alteracao_preco`, `data_fim_preco`, `id_sku`, `id_tabela_preco`) VALUES
(1, 119.9, 129.9, 48.0, '2026-01-01', '2026-08-15', '2026-08-14', 2, 1),
(2, 74.9, 84.9, 31.5, '2026-01-01', '2026-09-01', '2026-08-31', 4, 1),
(3, 84.9, 89.9, 36.0, '2026-01-01', '2026-09-01', '2026-08-31', 10, 2),
(4, 109.9, 119.9, 44.0, '2026-01-01', '2026-07-10', '2026-07-09', 12, 1),
(5, 54.9, 59.9, 23.0, '2026-01-01', '2026-06-01', '2026-05-31', 10, 1),
(6, 129.90, 134.90, 48.00, '2026-11-01', '2026-11-05', '2026-10-31', 2, 1),
(7, 84.90, 89.90, 36.00, '2026-11-01', '2026-11-05', '2026-10-31', 4, 1),
(8, 59.90, 64.90, 23.00, '2026-11-01', '2026-11-05', '2026-10-31', 10, 1),
(9, 69.90, 74.90, 28.00, '2026-11-01', '2026-11-05', '2026-10-31', 14, 1),
(10, 32.90, 34.90, 16.50, '2026-11-01', '2026-11-05', '2026-10-31', 8, 3);


INSERT INTO `conta_a_pagar` (`id_conta_pagar`, `numero_documento`, `data_emissao`, `data_vencimento`, `data_pagamento`, `valor_total`, `status_conta`, `data_cadastro`, `id_reposicao`) VALUES
(1, 'NF-HT-2026-1048', '2026-10-15', '2026-10-25', '2026-10-24', 1860.0, 'Paga', '2026-10-15', 1),
(2, 'NF-ES-2026-2281', '2026-10-24', '2026-11-10', NULL, 1420.0, 'Em aberto', '2026-10-24', 2),
(3, 'PED-VS-2026-0917', '2026-10-30', '2026-11-15', NULL, 980.0, 'Em aberto', '2026-10-30', 3),
(4, 'NF-PR-2026-004', '2026-11-01', '2026-11-15', '2026-11-14', 960.00, 'Paga', '2026-11-01', 4),
(5, 'NF-PR-2026-005', '2026-11-02', '2026-11-16', '2026-11-15', 720.00, 'Paga', '2026-11-02', 5),
(6, 'NF-PR-2026-006', '2026-11-03', '2026-11-17', '2026-11-16', 660.00, 'Paga', '2026-11-03', 6),
(7, 'NF-PR-2026-007', '2026-11-04', '2026-11-18', '2026-11-17', 840.00, 'Paga', '2026-11-04', 7),
(8, 'NF-PR-2026-008', '2026-11-05', '2026-11-19', NULL, 1150.00, 'Em aberto', '2026-11-05', 8),
(9, 'NF-PR-2026-009', '2026-11-06', '2026-11-20', NULL, 920.00, 'Em aberto', '2026-11-06', 9),
(10, 'NF-PR-2026-010', '2026-11-07', '2026-11-21', NULL, 480.00, 'Em aberto', '2026-11-07', 10);

INSERT INTO `usuario_sistema` (`id_usuario`, `login_usuario`, `senha_hash`, `perfil_acesso`, `status_usuario`, `data_criacao`, `ultimo_acesso`, `id_funcionario`) VALUES
(1, 'fernanda.carvalho', '$2y$10$hashFicticioApenasParaTeste000000000000000000000', 'Gerente de vendas', 'Ativo', '2025-03-10 09:00:00', '2026-11-02 09:12:00', 1),
(2, 'diego.santos', '$2y$10$hashFicticioApenasParaTeste111111111111111111111', 'Estoque', 'Ativo', '2025-05-18 10:30:00', '2026-11-02 08:45:00', 2),
(3, 'patricia.ribeiro', '$2y$10$hashFicticioApenasParaTeste222222222222222222222', 'Financeiro', 'Ativo', '2025-04-02 08:15:00', '2026-11-01 16:20:00', 3),
(4, 'lucas.mendes', '$2y$10$hashFicticioApenasParaTeste333333333333333333333', 'Administrador de TI', 'Ativo', '2025-02-11 11:00:00', '2026-11-02 10:05:00', 4),
(5, 'renata.martins', '$2y$10$hashFicticioApenasParaTeste444444444444444444444', 'Compras', 'Ativo', '2025-06-25 13:00:00', '2026-10-31 14:30:00', 5),
(6, 'bruno.costa', '$2y$10$hashFicticioTeste555555555555555555555', 'Vendas', 'Ativo', '2025-07-10 09:00:00', '2026-11-04 10:00:00', 6),
(7, 'gabriela.lopes', '$2y$10$hashFicticioTeste666666666666666666666', 'Marketing', 'Ativo', '2025-08-12 09:00:00', '2026-11-04 11:00:00', 7),
(8, 'andre.moreira', '$2y$10$hashFicticioTeste777777777777777777777', 'Recursos Humanos', 'Ativo', '2025-09-15 09:00:00', '2026-11-04 12:00:00', 8),
(9, 'isabela.almeida', '$2y$10$hashFicticioTeste888888888888888888888', 'E-commerce', 'Ativo', '2025-10-20 09:00:00', '2026-11-04 13:00:00', 9),
(10, 'marcelo.santos', '$2y$10$hashFicticioTeste999999999999999999999', 'Qualidade', 'Ativo', '2025-11-25 09:00:00', '2026-11-04 14:00:00', 10);

INSERT INTO `LOG_AUDITORIA`(`id_log`, `data_hora_log`, `tipo_operacao`, `entidade_afetada`,`descricao_operacao`, `justificativa_operacao`, `id_registro_afetado`,`valor_anterior`, `valor_novo`, `id_usuario`) VALUES
(1, '2026-10-28 10:25:10', 'INSERT', 'Venda','Registro de venda concluída no caixa.','Registrar a venda realizada para manter o histórico das operações comerciais.',1, NULL, 'status_venda=Concluída; canal_venda=Loja física', 1),
(2, '2026-10-29 09:20:12', 'UPDATE', 'Produto_SKU','Atualização da quantidade após recebimento de mercadoria.','Atualizar o saldo de estoque após a conferência e o recebimento dos produtos do fornecedor.',1, 'quantidade_estoque=22', 'quantidade_estoque=42', 2),
(3, '2026-10-30 08:45:30', 'UPDATE', 'Produto_SKU','Ajuste de estoque após identificação de peças avariadas.','Corrigir a quantidade disponível após a identificação de peças danificadas durante a conferência do estoque.',13, 'quantidade_estoque=13', 'quantidade_estoque=11', 2),
(4, '2026-11-01 17:22:05', 'INSERT', 'troca_devolucao','Abertura de solicitação de devolução de pedido online.','Registrar a solicitação de devolução realizada pelo cliente para iniciar o processo de análise e atendimento.',2, NULL, 'status_ocorrencia=Aguardando postagem', 1),
(5, '2026-11-02 09:14:40', 'UPDATE', 'tabela_preco','Revisão do preço de venda da legging preta tamanho M.','Atualizar o preço de venda conforme a revisão comercial dos valores praticados pela empresa.',2, 'preco_unitario_venda=119.90', 'preco_unitario_venda=129.90', 4),
(6, '2026-11-03 10:00:00', 'INSERT', 'Cliente', 'Cadastro de novo cliente.', 'Registrar cliente para realizar compras na loja.', 7, NULL, 'nome_completo=Beatriz Almeida Santos', 6),
(7, '2026-11-03 11:00:00', 'UPDATE', 'Produto_SKU', 'Atualização da quantidade em estoque.', 'Registrar movimentação de mercadorias recebidas.', 1, 'quantidade_estoque=22', 'quantidade_estoque=42', 7),
(8, '2026-11-04 09:00:00', 'INSERT', 'pedido_reposicao', 'Cadastro de pedido de reposição.', 'Registrar nova solicitação de mercadorias ao fornecedor.', 8, NULL, 'status_reposicao=Em trânsito', 8),
(9, '2026-11-04 14:00:00', 'UPDATE', 'tabela_preco', 'Alteração de tabela comercial.', 'Atualizar os preços para a campanha promocional.', 5, 'nome_tabela_preco=E-commerce Primavera 2026', 'nome_tabela_preco=E-commerce Black Friday 2026', 9),
(10, '2026-11-05 10:00:00', 'INSERT', 'troca_devolucao', 'Registro de solicitação de troca.', 'Registrar solicitação para análise do setor responsável.', 10, NULL, 'status_ocorrencia=Em análise', 10);


INSERT INTO `BACKUP_SISTEMA` (`tipo_backup`,`data_inicio_backup`,`data_fim_backup`,`local_armazenamento`,`status_backup`,`tamanho_backup_bytes`,`id_usuario`) VALUES
('Completo','2026-11-01 23:00:00','2026-11-01 23:04:00','D:/Backups/Ansarah/backup_2026-11-01.sql','Concluido',52428800,NULL),
('Completo','2026-11-02 23:00:00','2026-11-02 23:03:00','D:/Backups/Ansarah/backup_2026-11-02.sql','Concluido',52971520,1),
('Completo','2026-11-03 23:00:00',NULL,'D:/Backups/Ansarah/backup_2026-11-03.sql','Falhou',NULL,NULL),
('Incremental','2026-11-04 23:00:00','2026-11-04 23:01:30','D:/Backups/Ansarah/backup_2026-11-04_incremental.sql','Concluido',10485760,2),
('Completo','2026-11-05 23:00:00','2026-11-05 23:05:00','D:/Backups/Ansarah/backup_2026-11-05.sql','Concluido',54525952,1),
('Incremental','2026-11-06 23:00:00','2026-11-06 23:02:00','D:/Backups/Ansarah/backup_2026-11-06_incremental.sql','Concluido',12582912,3),
('Completo','2026-11-07 23:00:00',NULL,'D:/Backups/Ansarah/backup_2026-11-07.sql','Falhou',NULL,2),
('Completo','2026-11-08 23:00:00','2026-11-08 23:06:00','D:/Backups/Ansarah/backup_2026-11-08.sql','Concluido',57671680,4),
('Incremental', '2026-11-09 23:00:00', '2026-11-09 23:02:00', 'D:/Backups/Ansarah/backup_2026-11-09_incremental.sql', 'Concluido', 15728640, 6),
('Completo', '2026-11-10 23:00:00', '2026-11-10 23:07:00', 'D:/Backups/Ansarah/backup_2026-11-10.sql', 'Concluido', 62914560, 7);

INSERT INTO `REGISTRO_RESTAURACAO` (`data_inicio_restauracao`,`data_fim_restauracao`,`status_restauracao`,`motivo_restauracao`,`observacao_restauracao`,`id_backup`,`id_usuario`) VALUES 
('2026-11-04 08:00:00','2026-11-04 08:15:00','Concluida','Teste de recuperacao do banco de dados','Restauracao simulada para demonstracao academica.',2,4),
('2026-11-05 09:30:00','2026-11-05 09:45:00','Concluida','Recuperacao de dados de produtos','Recuperacao realizada para verificar a integridade dos registros de produtos.',1,1),
('2026-11-06 14:00:00',NULL,'Falhou','Falha durante a recuperacao do banco','O arquivo de backup apresentou problemas durante a leitura.',3,2),
('2026-11-07 10:00:00','2026-11-07 10:12:00','Concluida','Teste periodico de restauracao','Teste realizado para validar a disponibilidade e integridade do backup.',4,3),
('2026-11-08 16:30:00','2026-11-08 16:50:00','Concluida','Recuperacao apos exclusao acidental','Dados recuperados utilizando uma copia de seguranca anterior.',5,4),
('2026-11-09 08:00:00', '2026-11-09 08:12:00', 'Concluida', 'Teste de recuperação de estoque', 'Restauração simulada para validar os dados de estoque.', 6, 6),
('2026-11-09 14:00:00', '2026-11-09 14:18:00', 'Concluida', 'Recuperação de informações comerciais', 'Dados comerciais recuperados para conferência.', 7, 7),
('2026-11-10 09:00:00', NULL, 'Falhou', 'Falha na leitura do arquivo', 'O processo foi interrompido durante a leitura do backup.', 8, 8),
('2026-11-10 13:00:00', '2026-11-10 13:15:00', 'Concluida', 'Teste de integridade do banco', 'Restauração concluída e dados conferidos.', 9, 9),
('2026-11-10 16:00:00', '2026-11-10 16:20:00', 'Concluida', 'Recuperação de dados de vendas', 'Dados de vendas recuperados com sucesso.', 10, 10);

-- 5. SELECT FROM -
SELECT * FROM Fornecedor;
SELECT * FROM Departamento;
SELECT * FROM Funcionario;
SELECT * FROM Cliente;
SELECT * FROM Marca;
SELECT * FROM cor;
SELECT* FROM Tamanho;
SELECT * FROM Produto;
SELECT * FROM Produto_SKU;
SELECT * FROM Venda;
SELECT * FROM Item_venda;
SELECT * FROM Pagamento;
SELECT * FROM pedido_online;
SELECT * FROM troca_devolucao;
SELECT * FROM pedido_reposicao;
SELECT * FROM Item_reposicao;
SELECT * FROM Movimentacao_estoque;
SELECT * FROM tabela_preco;
SELECT * FROM Item_tabela_preco;
SELECT * FROM historico_preco;
SELECT * FROM conta_a_pagar;
SELECT * FROM usuario_sistema;
SELECT * FROM LOG_AUDITORIA;
SELECT * FROM BACKUP_SISTEMA;
SELECT * FROM REGISTRO_RESTAURACAO;

-- 5. SELECT COM JOIN -
-- J01 — Consultar os produtos vendidos em cada venda
SELECT
    v.id_venda,
    v.data_venda,
    c.nome_completo AS cliente,
    p.nome_produto,
    m.nome_marca,
    sku.codigo_sku,
    cor.nome_cor,
    tam.sigla_tamanho,
    iv.quantidade_item_venda,
    iv.preco_unitario_venda,
    ROUND(
        iv.quantidade_item_venda * iv.preco_unitario_venda,
        2
    ) AS subtotal_item
FROM Venda v
INNER JOIN Cliente c
    ON c.id_cliente = v.id_cliente
INNER JOIN Item_venda iv
    ON iv.id_venda = v.id_venda
INNER JOIN Produto_SKU sku
    ON sku.id_sku = iv.id_sku
INNER JOIN Produto p
    ON p.id_produto = sku.id_produto
INNER JOIN Marca m
    ON m.id_marca = p.id_marca
LEFT JOIN Cor cor
    ON cor.id_cor = sku.id_cor
LEFT JOIN Tamanho tam
    ON tam.id_tamanho = sku.id_tamanho
ORDER BY
    v.data_venda DESC;
    
-- J02 — Consultar o estoque disponível por produto e SKU
    SELECT
    p.nome_produto,
    p.referencia_produto,
    sku.codigo_sku,
    sku.id_cor,
    sku.id_tamanho,
    sku.quantidade_estoque
FROM Produto p
INNER JOIN Produto_SKU sku
    ON sku.id_produto = p.id_produto
ORDER BY p.nome_produto;

-- J03 — Consultar os pedidos de reposição e seus fornecedores
SELECT
    pr.id_reposicao,
    f.nome_fornecedor,
    pr.data_reposicao,
    pr.data_prevista_entrega,
    pr.data_entrega_real,
    pr.status_reposicao,
    pr.valor_total_reposicao
FROM pedido_reposicao pr
INNER JOIN Fornecedor f
    ON f.id_fornecedor = pr.id_fornecedor
ORDER BY pr.data_reposicao DESC;

-- J04 — Consultar os produtos e as quantidades pendentes de recebimento
SELECT
    pr.id_reposicao,
    f.nome_fornecedor,
    p.nome_produto,
    sku.codigo_sku,
    ir.quantidade_solicitada,
    ir.quantidade_recebida,
    (ir.quantidade_solicitada - ir.quantidade_recebida) AS quantidade_pendente,
    ir.status_item_reposicao
FROM Item_reposicao ir
INNER JOIN pedido_reposicao pr
    ON pr.id_reposicao = ir.id_reposicao
INNER JOIN Fornecedor f
    ON f.id_fornecedor = pr.id_fornecedor
INNER JOIN Produto_SKU sku
    ON sku.id_sku = ir.id_sku
INNER JOIN Produto p
    ON p.id_produto = sku.id_produto
WHERE ir.quantidade_solicitada > ir.quantidade_recebida
ORDER BY pr.data_reposicao;

-- J05 — Consultar os registros de auditoria e os usuários responsáveis
SELECT
    l.id_log,
    u.login_usuario,
    l.data_hora_log,
    l.tipo_operacao,
    l.entidade_afetada,
    l.id_registro_afetado,
    l.descricao_operacao,
    l.valor_anterior,
    l.valor_novo
FROM LOG_AUDITORIA l
INNER JOIN usuario_sistema u
    ON u.id_usuario = l.id_usuario
ORDER BY l.data_hora_log DESC;

-- J06 — Consultar histórico de operações por ordem de data
SELECT
    b.id_backup,
    b.tipo_backup,
    b.data_inicio_backup,
    b.status_backup,
    b.tamanho_backup_bytes,
    u.login_usuario
FROM BACKUP_SISTEMA b
LEFT JOIN usuario_sistema u
    ON u.id_usuario = b.id_usuario
ORDER BY b.data_inicio_backup DESC;

-- J07 — Quantidade de backups por status
SELECT
    status_backup,
    COUNT(*) AS quantidade_backups,
    SUM(tamanho_backup_bytes) AS tamanho_total_bytes
FROM BACKUP_SISTEMA
GROUP BY status_backup
ORDER BY quantidade_backups DESC;

-- 6. UPDATE -

-- U01 — Atualizar o status de um pedido online
UPDATE pedido_online
SET status_pedido = 'Enviado',
    data_envio_pedido = CURRENT_TIMESTAMP
WHERE id_pedido = 10;

-- U02 — Atualizar o estoque de um produto para zero
UPDATE Produto_SKU
SET quantidade_estoque = 0
WHERE id_sku = 5;

-- 7. DELETE -

-- D01 — Excluir uma solicitação de troca cancelada
DELETE FROM troca_devolucao
WHERE id_ocorrencia = 3
  AND status_ocorrencia = 'Cancelada';
  
-- D02 — Excluir um lançamento de entrada de estoque feito incorretamente
DELETE FROM Movimentacao_estoque
WHERE id_movimentacao = 7
AND tipo_movimentacao = 'Entrada';

-- 7. Consultas gerenciais 

-- G01 — Qual foi o faturamento líquido por mês e canal de venda?
-- Atende: P2; K02 (faturamento mensal) e K04 (faturamento por canal).

SELECT
    DATE_FORMAT(x.data_venda, '%Y-%m') AS mes,
    x.canal_venda,
    ROUND(SUM(x.faturamento_liquido), 2) AS faturamento_liquido
FROM (
    SELECT
        v.id_venda,
        v.data_venda,
        v.canal_venda,
        ROUND(
            GREATEST(
                SUM(iv.quantidade_item_venda * iv.preco_unitario_venda)
                - v.desconto_venda,
                0
            ), 2
        ) AS faturamento_liquido
    FROM Venda v
    JOIN Item_venda iv
        ON iv.id_venda = v.id_venda
    WHERE v.status_venda = 'Concluida'
    GROUP BY
        v.id_venda,
        v.data_venda,
        v.canal_venda,
        v.desconto_venda
) x
GROUP BY
    DATE_FORMAT(x.data_venda, '%Y-%m'),
    x.canal_venda
ORDER BY
    mes,
    x.canal_venda;
    
-- G02 — Quais produtos e SKUs venderam mais unidades nos últimos três meses?
-- Atende: P2 (análise dos resultados comerciais).

SELECT
    p.codigo_produto,
    p.nome_produto,
    p.descricao_produto,
    s.id_sku,
    SUM(iv.quantidade_item_venda) AS unidades_vendidas
FROM Item_venda iv
JOIN Venda v
    ON v.id_venda = iv.id_venda
JOIN Produto_SKU s
    ON s.id_sku = iv.id_sku
JOIN Produto p
    ON p.id_produto = s.id_produto
WHERE v.status_venda = 'Concluida'
  AND v.data_venda >= DATE_SUB(CURDATE(), INTERVAL 3 MONTH)
GROUP BY
    p.codigo_produto,
    p.nome_produto,
    p.descricao_produto,
    s.id_sku
ORDER BY unidades_vendidas DESC;    


-- G03 — Quais SKUs estão sem saldo disponível em estoque?
-- Atende: P3 (identificação de produtos sem disponibilidade).

SELECT
    p.codigo_produto,
    p.nome_produto,
    s.id_sku,
    s.quantidade_estoque
FROM Produto_SKU s
JOIN Produto p
    ON p.id_produto = s.id_produto
WHERE s.quantidade_estoque = 0
ORDER BY p.codigo_produto, s.id_sku;

-- G04 — Qual é o percentual de vendas canceladas em relação ao total?
-- Atende: P2 (acompanhamento dos resultados comerciais).

SELECT
    COUNT(*) AS total_vendas,
    SUM(
        CASE
            WHEN status_venda = 'Cancelada' THEN 1
            ELSE 0
        END
    ) AS vendas_canceladas,
    ROUND(
        100 * SUM(
            CASE
                WHEN status_venda = 'Cancelada' THEN 1
                ELSE 0
            END
        ) / NULLIF(COUNT(*), 0),
        2
    ) AS percentual_canceladas
FROM Venda;

-- G05 — Qual é o valor das contas a pagar por situação?
-- Atende: P2 (visibilidade gerencial financeira).

SELECT
    status_conta,
    COUNT(*) AS quantidade_contas,
    SUM(valor_total) AS valor_total
FROM conta_a_pagar
GROUP BY status_conta
ORDER BY status_conta;

-- G06 — Qual é o valor recebido por forma de pagamento?
-- Atende: P2 (acompanhamento dos meios de pagamento).

SELECT
    forma_pagamento,
    COUNT(*) AS quantidade_lancamentos,
    ROUND(SUM(valor_pagamento), 2) AS valor_recebido
FROM Pagamento
WHERE status_pagamento = 'Aprovado'
GROUP BY forma_pagamento
ORDER BY valor_recebido DESC;

-- G07 — Quais produtos tiveram alteração de preço e qual foi a variação?
-- Atende: P2 (análise das alterações de preços).

SELECT
    p.codigo_produto,
    p.nome_produto,
    p.descricao_produto,
    s.id_sku,
    hp.preco_anterior,
    hp.preco_novo,
    ROUND(
        (
            (hp.preco_novo - hp.preco_anterior)
            / NULLIF(hp.preco_anterior, 0)
        ) * 100,
        2
    ) AS variacao_percentual,
    hp.data_alteracao_preco
FROM historico_preco hp
JOIN Produto_SKU s
    ON s.id_sku = hp.id_sku
JOIN Produto p
    ON p.id_produto = s.id_produto
ORDER BY hp.data_alteracao_preco DESC;

-- G08 — Qual é a proporção de itens recebidos em cada pedido de reposição?
-- Atende: P3 (acompanhamento de recebimentos e reposições); RN15 e RN16.

SELECT
    pr.id_reposicao,
    f.nome_fornecedor,
    pr.status_reposicao,
    SUM(ir.quantidade_solicitada) AS quantidade_solicitada,
    SUM(ir.quantidade_recebida) AS quantidade_recebida,
    ROUND(
        100 * SUM(ir.quantidade_recebida)
        / NULLIF(SUM(ir.quantidade_solicitada), 0),
        2
    ) AS percentual_recebido
FROM pedido_reposicao pr
JOIN Fornecedor f
    ON f.id_fornecedor = pr.id_fornecedor
JOIN Item_reposicao ir
    ON ir.id_reposicao = pr.id_reposicao
GROUP BY
    pr.id_reposicao,
    f.nome_fornecedor,
    pr.status_reposicao
ORDER BY pr.id_reposicao;

-- G09 — Quantos produtos estão cadastrados por marca e categoria?
-- Atende: P2 (relatórios por classificação de produtos).

SELECT
    m.nome_marca,
    p.categoria_produto,
    COUNT(*) AS quantidade_produtos
FROM Produto p
JOIN Marca m
    ON m.id_marca = p.id_marca
GROUP BY
    m.nome_marca,
    p.categoria_produto
ORDER BY m.nome_marca, p.categoria_produto;

-- G10 — Quantas operações foram registradas por usuário e tipo?
-- Atende: rastreabilidade das operações e acompanhamento gerencial da auditoria.

SELECT
    u.login_usuario,
    l.tipo_operacao,
    COUNT(*) AS quantidade_operacoes
FROM LOG_AUDITORIA l
JOIN usuario_sistema u
    ON u.id_usuario = l.id_usuario
GROUP BY
    u.login_usuario,
    l.tipo_operacao
ORDER BY u.login_usuario, l.tipo_operacao;

-- G11 — Quais backups foram realizados e quais apresentaram falhas?
-- Atende: P1 (acompanhamento da execução e situação das cópias de segurança).

SELECT
    b.id_backup,
    b.tipo_backup,
    b.data_inicio_backup,
    b.data_fim_backup,
    b.status_backup,
    b.local_armazenamento,
    COALESCE(u.login_usuario, 'Backup automatico') AS responsavel
FROM BACKUP_SISTEMA b
LEFT JOIN usuario_sistema u
    ON u.id_usuario = b.id_usuario
ORDER BY b.data_inicio_backup DESC;

-- G12 — Quais restaurações foram realizadas e qual backup foi utilizado?
-- Atende: P1 (acompanhamento das recuperações e identificação do responsável).

SELECT
    r.id_restauracao,
    b.id_backup,
    b.tipo_backup,
    r.data_inicio_restauracao,
    r.data_fim_restauracao,
    r.status_restauracao,
    r.motivo_restauracao,
    u.login_usuario AS responsavel
FROM REGISTRO_RESTAURACAO r
JOIN BACKUP_SISTEMA b
    ON b.id_backup = r.id_backup
JOIN usuario_sistema u
    ON u.id_usuario = r.id_usuario
ORDER BY r.data_inicio_restauracao DESC;


-- G13 — Qual é o percentual de produtos com cadastros incompletos?
-- Atende: K01 (percentual de cadastros incompletos).

SELECT
    COUNT(*) AS total_produtos,
    SUM(
        CASE
            WHEN p.nome_produto IS NULL OR TRIM(p.nome_produto) = ''
              OR p.codigo_produto IS NULL OR TRIM(p.codigo_produto) = ''
              OR p.descricao_produto IS NULL OR TRIM(p.descricao_produto) = ''
              OR p.grupo_produto IS NULL OR TRIM(p.grupo_produto) = ''
              OR p.categoria_produto IS NULL OR TRIM(p.categoria_produto) = ''
              OR p.tipo_produto IS NULL OR TRIM(p.tipo_produto) = ''
              OR p.unidade_tributacao_produto IS NULL
              OR TRIM(p.unidade_tributacao_produto) = ''
              OR p.id_marca IS NULL
            THEN 1
            ELSE 0
        END
    ) AS produtos_incompletos,
    ROUND(
        100 * SUM(
            CASE
                WHEN p.nome_produto IS NULL OR TRIM(p.nome_produto) = ''
                  OR p.codigo_produto IS NULL OR TRIM(p.codigo_produto) = ''
                  OR p.descricao_produto IS NULL OR TRIM(p.descricao_produto) = ''
                  OR p.grupo_produto IS NULL OR TRIM(p.grupo_produto) = ''
                  OR p.categoria_produto IS NULL OR TRIM(p.categoria_produto) = ''
                  OR p.tipo_produto IS NULL OR TRIM(p.tipo_produto) = ''
                  OR p.unidade_tributacao_produto IS NULL
                  OR TRIM(p.unidade_tributacao_produto) = ''
                  OR p.id_marca IS NULL
                THEN 1
                ELSE 0
            END
        ) / NULLIF(COUNT(*), 0),
        2
    ) AS percentual_incompleto
FROM Produto p;


-- G14 — Qual é o ticket médio das vendas concluídas?
-- Atende: P2 e K03 (ticket médio).

SELECT
    COUNT(*) AS quantidade_vendas_concluidas,
    ROUND(AVG(x.valor_liquido), 2) AS ticket_medio
FROM (
    SELECT
        v.id_venda,
        GREATEST(
            SUM(iv.quantidade_item_venda * iv.preco_unitario_venda)
            - v.desconto_venda,
            0
        ) AS valor_liquido
    FROM Venda v
    JOIN Item_venda iv
        ON iv.id_venda = v.id_venda
    WHERE v.status_venda = 'Concluida'
    GROUP BY v.id_venda, v.desconto_venda
) x;


-- G15 — Quais SKUs estão com estoque baixo (até 15 unidades)?
-- Atende: P3 e K05 (percentual de SKUs com estoque baixo).

SELECT
    p.codigo_produto,
    p.nome_produto,
    s.id_sku,
    s.quantidade_estoque
FROM Produto_SKU s
JOIN Produto p
    ON p.id_produto = s.id_produto
WHERE s.quantidade_estoque <= 15
ORDER BY s.quantidade_estoque, p.codigo_produto;

-- G16 — Quais são as quantidades pendentes nos pedidos de reposição?
-- Atende: P3 e K06 (quantidade pendente de reposição).

SELECT
    pr.id_reposicao,
    f.nome_fornecedor,
    p.codigo_produto,
    p.nome_produto,
    s.id_sku,
    ir.quantidade_solicitada,
    ir.quantidade_recebida,
    (ir.quantidade_solicitada - ir.quantidade_recebida)
        AS quantidade_pendente
FROM pedido_reposicao pr
JOIN Fornecedor f
    ON f.id_fornecedor = pr.id_fornecedor
JOIN Item_reposicao ir
    ON ir.id_reposicao = pr.id_reposicao
JOIN Produto_SKU s
    ON s.id_sku = ir.id_sku
JOIN Produto p
    ON p.id_produto = s.id_produto
WHERE ir.quantidade_recebida < ir.quantidade_solicitada
ORDER BY pr.id_reposicao, p.codigo_produto, s.id_sku;

-- 8. Consultas de auditoria

-- A01 — Existem SKUs com quantidade de estoque negativa?
-- Verifica: RN03 e RN12 (controle de estoque e disponibilidade).

SELECT
    id_sku,
    quantidade_estoque
FROM Produto_SKU
WHERE quantidade_estoque < 0;

-- A02 — Existem SKUs sem produto, cor ou tamanho correspondente?
-- Verifica: RN02 e RN03 (cadastro e identificação das variações).

SELECT
    s.id_sku,
    s.id_produto,
    s.id_cor,
    s.id_tamanho
FROM Produto_SKU s
LEFT JOIN Produto p
    ON p.id_produto = s.id_produto
LEFT JOIN Cor c
    ON c.id_cor = s.id_cor
LEFT JOIN Tamanho t
    ON t.id_tamanho = s.id_tamanho
WHERE
    p.id_produto IS NULL
    OR (s.id_cor IS NOT NULL AND c.id_cor IS NULL)
    OR (s.id_tamanho IS NOT NULL AND t.id_tamanho IS NULL);
    
-- A03 — Existem vendas sem itens registrados?
-- Verifica: RN04 e RN05 (registro das vendas e respectivos itens).

SELECT
    v.id_venda,
    v.data_venda,
    v.status_venda
FROM Venda v
LEFT JOIN Item_venda iv
    ON iv.id_venda = v.id_venda
WHERE iv.id_item_venda IS NULL;

-- A04 — Existem itens de venda com quantidade ou preço inválidos?
-- Verifica: RN05 (quantidade e preço unitário dos itens).

SELECT
    id_item_venda,
    quantidade_item_venda,
    preco_unitario_venda
FROM Item_venda
WHERE
    quantidade_item_venda <= 0
    OR preco_unitario_venda < 0;
    
-- A05 — Existem pedidos online sem venda ou cliente correspondente?
-- Verifica: RN06 (vínculo do pedido online com venda e cliente).

SELECT
    po.id_pedido,
    po.id_venda,
    po.id_cliente
FROM pedido_online po
LEFT JOIN Venda v
    ON v.id_venda = po.id_venda
LEFT JOIN Cliente c
    ON c.id_cliente = po.id_cliente
WHERE
    v.id_venda IS NULL
    OR c.id_cliente IS NULL;
    
-- A06 — Pedidos enviados ou entregues estão sem informações de despacho?
-- Verifica: RN06 (etapas de envio, rastreamento e entrega).

SELECT
    id_pedido,
    status_pedido,
    data_envio_pedido,
    codigo_rastreamento_pedido,
    data_entrega_pedido
FROM pedido_online
WHERE
    (
        status_pedido IN ('Enviado', 'Entregue')
        AND (
            data_envio_pedido IS NULL
            OR codigo_rastreamento_pedido IS NULL
        )
    )
    OR (
        status_pedido = 'Entregue'
        AND data_entrega_pedido IS NULL
    );

-- A07 — Existem ocorrências de troca ou devolução sem pedido online correspondente?
-- Verifica: RN07, RN08 e RN33 (controle de trocas, devoluções e cancelamentos).

SELECT
    td.id_ocorrencia,
    td.id_pedido
FROM troca_devolucao td
LEFT JOIN pedido_online po
    ON po.id_pedido = td.id_pedido
WHERE po.id_pedido IS NULL;


-- A08 — Existem pagamentos com valores inválidos ou venda inexistente?
-- Verifica: RN04 e RN25 (pagamentos associados às vendas e formas de pagamento).

SELECT
    pg.id_pagamento,
    pg.id_venda,
    pg.valor_pagamento
FROM Pagamento pg
LEFT JOIN Venda v
    ON v.id_venda = pg.id_venda
WHERE
    v.id_venda IS NULL
    OR pg.valor_pagamento <= 0;


-- A09 — Existem pedidos de reposição sem fornecedor ou sem itens?
-- Verifica: RN15 (associação do pedido ao fornecedor e aos itens recebidos).

SELECT
    pr.id_reposicao,
    pr.id_fornecedor
FROM pedido_reposicao pr
WHERE
    NOT EXISTS (
        SELECT 1
        FROM Fornecedor f
        WHERE f.id_fornecedor = pr.id_fornecedor
    )
    OR NOT EXISTS (
        SELECT 1
        FROM Item_reposicao ir
        WHERE ir.id_reposicao = pr.id_reposicao
    );


-- A10 — Existem itens recebidos em quantidade maior que a solicitada?
-- Verifica: RN15 e RN16 (conferência e controle de entregas parciais).

SELECT
    id_item_reposicao,
    quantidade_solicitada,
    quantidade_recebida
FROM Item_reposicao
WHERE
    quantidade_recebida > quantidade_solicitada
    OR quantidade_recebida < 0;


-- A11 — Existem contas a pagar com vencimento anterior à emissão ou valor inválido?
-- Verifica: RN19 (registro e acompanhamento das obrigações financeiras).

SELECT
    id_conta_pagar,
    numero_documento,
    data_emissao,
    data_vencimento,
    valor_total
FROM conta_a_pagar
WHERE
    data_vencimento < data_emissao
    OR valor_total <= 0;


-- A12 — Existem movimentações sem funcionário responsável ou com quantidade inválida?
-- Verifica: RN26 (registro das movimentações de estoque).

SELECT
    me.id_movimentacao,
    me.quantidade_movimentada,
    me.data_movimentacao,
    me.id_funcionario
FROM Movimentacao_estoque me
LEFT JOIN Funcionario f
    ON f.id_funcionario = me.id_funcionario
WHERE
    f.id_funcionario IS NULL
    OR me.quantidade_movimentada <= 0;


-- A13 — Existem usuários sem funcionário correspondente?
-- Verifica: RN27 e RN28 (identificação individual e permissões de acesso).

SELECT
    u.id_usuario,
    u.login_usuario,
    u.id_funcionario
FROM usuario_sistema u
LEFT JOIN Funcionario f
    ON f.id_funcionario = u.id_funcionario
WHERE f.id_funcionario IS NULL;


-- A14 — Existem registros de auditoria sem usuário correspondente?
-- Verifica: RN29 (identificação do usuário e rastreabilidade das operações).

SELECT
    l.id_log,
    l.data_hora_log,
    l.tipo_operacao,
    l.id_usuario
FROM LOG_AUDITORIA l
LEFT JOIN usuario_sistema u
    ON u.id_usuario = l.id_usuario
WHERE u.id_usuario IS NULL;


-- A15 — Existem históricos de preço com valores ou períodos inconsistentes?
-- Verifica: RN31 (preservação do histórico de preços e das datas de vigência).

SELECT
    hp.id_historico_preco,
    hp.id_sku,
    hp.id_tabela_preco,
    hp.preco_anterior,
    hp.preco_novo,
    hp.preco_compra_reposicao,
    hp.data_inicio_preco,
    hp.data_alteracao_preco,
    hp.data_fim_preco
FROM historico_preco hp
LEFT JOIN Produto_SKU s
    ON s.id_sku = hp.id_sku
LEFT JOIN tabela_preco tp
    ON tp.id_tabela_preco = hp.id_tabela_preco
WHERE
    s.id_sku IS NULL
    OR tp.id_tabela_preco IS NULL
    OR hp.preco_anterior < 0
    OR hp.preco_novo < 0
    OR hp.preco_compra_reposicao < 0
    OR (
        hp.data_fim_preco IS NOT NULL
        AND hp.data_fim_preco < hp.data_inicio_preco
    );


-- A16 — Existem clientes sem documento de identificação conforme o tipo?
-- Verifica: RN14 (diferenciação de clientes B2C e B2B).

SELECT
    id_cliente,
    nome_completo,
    tipo_cliente,
    cpf_cliente,
    cnpj_cliente
FROM Cliente
WHERE
    (tipo_cliente = 'B2C'
     AND (cpf_cliente IS NULL OR TRIM(cpf_cliente) = ''))
    OR
    (tipo_cliente = 'B2B'
     AND (cnpj_cliente IS NULL OR TRIM(cnpj_cliente) = ''));


-- A17 — Existem registros de backup com datas ou status inconsistentes?
-- Verifica: RN34 (registro e acompanhamento das operações de backup).

SELECT
    id_backup,
    tipo_backup,
    data_inicio_backup,
    data_fim_backup,
    status_backup
FROM BACKUP_SISTEMA
WHERE
    (data_fim_backup IS NOT NULL
     AND data_fim_backup < data_inicio_backup)
    OR
    (status_backup = 'Concluido'
     AND data_fim_backup IS NULL)
    OR
    (status_backup = 'Em andamento'
     AND data_fim_backup IS NOT NULL)
    OR
    status_backup NOT IN ('Concluido', 'Em andamento', 'Falhou');


-- A18 — Existem restaurações inconsistentes ou vinculadas a backups que falharam?
-- Verifica: RN34 (controle das operações de restauração).

SELECT
    r.id_restauracao,
    r.id_backup,
    r.status_restauracao,
    r.data_inicio_restauracao,
    r.data_fim_restauracao,
    b.status_backup
FROM REGISTRO_RESTAURACAO r
JOIN BACKUP_SISTEMA b
    ON b.id_backup = r.id_backup
WHERE
    (r.data_fim_restauracao IS NOT NULL
     AND r.data_fim_restauracao < r.data_inicio_restauracao)
    OR
    (r.status_restauracao = 'Concluida'
     AND r.data_fim_restauracao IS NULL)
    OR
    b.status_backup <> 'Concluido';


-- A19 — Existem restaurações realizadas por usuários sem perfil autorizado?
-- Verifica: RN28 e RN34 (controle de permissões para restaurar o banco).

SELECT
    r.id_restauracao,
    u.login_usuario,
    u.perfil_acesso
FROM REGISTRO_RESTAURACAO r
JOIN usuario_sistema u
    ON u.id_usuario = r.id_usuario
WHERE u.perfil_acesso <> 'Administrador';


-- A20 — Existe backup completo concluído há mais de 24 horas?
-- Verifica: RN34 (execução periódica das cópias de segurança).

SELECT
    MAX(data_fim_backup) AS ultimo_backup_completo,
    CASE
        WHEN MAX(data_fim_backup) IS NULL
            THEN 'Nenhum backup completo registrado'
        WHEN MAX(data_fim_backup) < NOW() - INTERVAL 24 HOUR
            THEN 'Atencao: ultimo backup completo ha mais de 24 horas'
        ELSE 'Backup completo dentro do periodo esperado'
    END AS situacao_backup
FROM BACKUP_SISTEMA
WHERE tipo_backup = 'Completo'
  AND status_backup = 'Concluido';
