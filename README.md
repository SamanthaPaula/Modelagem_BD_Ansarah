# Modelagem de Banco de Dados para Gestão de Informações da Ansarah
Projeto acadêmico de modelagem de Banco de Dados da empresa ANSARAH - UNICID

## Integrantes do Grupo

| Nome completo | RGM | Usuário do GitHub |
|---|---|---|
| Ana Beatriz Mendes Gonçalves | 47559691 | @anamendesss - [https://github.com/anamendesss] |
| Luiz Gustavo Santos de Oliveira | 47658185 | @DevLuizOliveira - [https://github.com/DevLuizOliveira]   |
| Samantha Paula dos Santos Silva | 47561157 | @SamanthaPaula [https://github.com/SamanthaPaula] |

---

## 1. Introdução

Este trabalho apresenta a modelagem conceitual de um sistema de gestão de informações para a Ansarah, organização que atua no comércio de roupas de academia, roupas íntimas e produtos relacionados ao segmento de moda.
</br></br>
O trabalho tem como objetivo desenvolver um modelo conceitual de dados que represente as principais informações e processos da organização, contribuindo para uma melhor organização e gerenciamento dos dados utilizados em suas atividades. O levantamento de requisitos foi realizado por meio de pesquisa de campo, utilizando um questionário com perguntas direcionadas à organização. As informações foram obtidas por meio de entrevista com Alessandra, uma das proprietárias da Ansarah e responsável pela administração do setor financeiro, sendo utilizadas como base para a compreensão dos processos, informações, dificuldades e regras de funcionamento da organização.
</br></br>
O projeto tem como delimitação a modelagem conceitual das informações e dos processos levantados junto à organização, não abrangendo, nesta etapa, a implementação do banco de dados ou o desenvolvimento do sistema. O modelo será construído com base nos processos e nas necessidades identificadas durante o levantamento de requisitos.


---

## 2. Caracterização da Organização

**Nome e natureza da organização:** A Ansarah é uma empresa comercial com fins lucrativos, pertencente ao segmento de moda e vestuário. Sua história começou em 1932, na Rua 25 de Março, em São Paulo, inicialmente com a comercialização de meias. Ao longo dos anos, a empresa expandiu sua atuação para moda íntima, lingerie e outros tipos de vestuário, comercializando atualmente diversos produtos por meio de lojas físicas e loja virtual.
</br></br>
**Contexto e porte:** A Ansarah atua no segmento de moda e vestuário, com vendas no varejo e no atacado para todo o Brasil. Sua operação conta com lojas físicas, loja virtual e centro de logística, além de aproximadamente 9 a 60 funcionários, conforme as informações levantadas pelo grupo. A organização trabalha com diferentes produtos, cores, tamanhos e grades, exigindo o gerenciamento de cadastros, preços, vendas, estoque, fornecedores, pedidos e movimentações financeiras.
</br></br>
**Problemas e necessidades identificadas:** 
- **P1 — Inserção manual de informações:** o cadastro de produtos exige o preenchimento manual de informações no sistema, tornando necessário aprimorar a organização e a atualização dos dados dos produtos.
- **P2 — Dificuldade na geração de relatórios:** existe dificuldade para elaborar relatórios personalizados, o que evidencia a necessidade de facilitar a consulta e a análise das informações para apoiar a tomada de decisões.
- **P3 — Recuperação e atualização dos dados após restauração de backup:** quando é necessário recuperar uma versão anterior dos dados, informações registradas posteriormente podem precisar ser inseridas novamente de forma manual, gerando retrabalho e risco de desatualização.
- **P4 — Controle da disponibilidade de produtos:** foi identificada a necessidade de aprimorar o acompanhamento das quantidades em estoque e da disponibilidade dos produtos para comercialização, visando reduzir a ocorrência de vendas sem estoque disponível.
  Diante desses problemas, o projeto busca estruturar os dados da organização para melhorar o gerenciamento das informações, facilitar consultas gerenciais, apoiar o acompanhamento do estoque e contribuir para a integridade e a rastreabilidade dos registros.
</br></br>
**Escopo do sistema:** O banco de dados proposto contempla os principais processos de negócio da organização, incluindo cadastro de clientes, funcionários, usuários e produtos; gerenciamento de vendas e pedidos on-line; pagamentos; controle de preços; estoque e movimentações; fornecedores; reposição e recebimento de mercadorias; contas a pagar; trocas, devoluções e registros de auditoria. Dessa forma, o modelo não se limita a um único setor, mas busca integrar informações relacionadas à operação comercial e administrativa da Ansarah.
</br></br>
**Justificativa da escolha:** A Ansarah foi escolhida porque o grupo possui acesso à organização por meio de contato com uma de suas responsáveis. Uma das integrantes possui vínculo familiar com uma funcionária da empresa, o que facilitou o contato e a realização do levantamento de informações. Além disso, a organização apresenta diferentes processos comerciais, administrativos, financeiros e logísticos que permitem aplicar os conceitos de modelagem de banco de dados em um cenário real.
</br></br>

---

## 3. Evidências da Organização
<br>
Para comprovar a existência da organização e o acesso do grupo para a realização da pesquisa de campo, foram reunidas informações e registros relacionados à Ansarah.

### 3.1 Fotos das lojas

- **Loja da 25 de Março:** [Foto da loja na 25 de Março](./PROVASDAEMPRESA/LOJA25DEMARCO.jpeg)
- **Loja do Brás:** [Foto da loja do Brás](./PROVASDAEMPRESA/LOJABRÁS.jpeg)

### 3.2 Localização das lojas

**Loja da 25 de Março:**  
https://maps.app.goo.gl/ja89dX2NqaD3WHnK6

**Loja do Brás:**  
https://maps.app.goo.gl/SKGrzBL6uDV7w4WL8

### 3.3 Site oficial

https://www.ansarah.com.br/

### 3.4 Consulta de CNPJ

**https://cnpj.biz/61419610000119**

### 3.5 Responsável pela organização

**Nome:** Alessandra Ansarah
<br>
**Cargo/Função:** Proprietária e responsável pela área administrativa/financeira
<br>
**Telefone para contato:** 

>**A fotografia referente ao contato realizado pela responsável da organização está disponível na pasta [PROVASDAEMPRESA](./PROVASDAEMPRESA/), junto aos demais registros e documentos utilizados como evidências.**

### 3.6 Levantamento e Relato da Entrevista

O levantamento de requisitos da organização Ansarah foi realizado por meio de um questionário encaminhado à responsável pela empresa, seguido de uma entrevista pelo Google Meet e de contatos posteriores para esclarecimento e complementação das informações.

Durante o levantamento, foram abordados os processos de cadastro de produtos e clientes, controle de estoque, vendas, fornecedores, formação de preços, pedidos on-line, trocas e devoluções, relatórios gerenciais e segurança das informações.

>**O relato detalhado do levantamento, incluindo as etapas realizadas e as principais informações obtidas, está disponível na pasta `levantamento`.**

---

## 4. Principais Processos de Negócio
Os principais processos de negócio da empresa foram organizados em três grupos: *Vendas, Compras e Apoio*. Esses processos envolvem o cadastro e a comercialização de produtos, o controle de estoque, o relacionamento com fornecedores, o processamento de pedidos e o gerenciamento das informações utilizadas nas operações da empresa.
<br> <br>
### 4.1. Lista dos Principais Processos

*Vendas*
- Cadastro e gerenciamento de clientes;
- Registro de vendas no Ponto de Venda (PDV) e no site;
- Processamento de pedidos on-line;
- Controle de preços, tabelas de preços e promoções;
- Trocas, devoluções, cancelamentos e reembolsos;
- Venda no atacado (condições B2B).
<br> <br>

*Compras*
- Cadastro e relacionamento com fornecedores e marcas;
- Identificação da necessidade e pedido de reposição de mercadorias;
- Recebimento e conferência de mercadorias;
- Controle de contas a pagar.
<br> <br>

*Apoio*
- Cadastro e atualização de produtos e suas variações;
- Controle de estoque e inventário;
- Logística e centro de distribuição;
- Controle de usuários, permissões e registros de operações.

A geração de relatórios também é utilizada como atividade complementar para consultar informações e apoiar a tomada de decisões.


### 4.2. Descrição dos Processos de Negócio

#### 4.2.1. Cadastro e Atualização de Produtos

O cadastro de produtos é realizado no ERP Millennium com base nas informações fornecidas pela fábrica. São registrados dados como nome, código, marca, coleção, subcoleção, grupo, NCM e preços. Os produtos podem possuir variações de cor e tamanho, organizadas conforme as grades utilizadas pela empresa. Quando necessário, as informações cadastrais são atualizadas para manter os dados dos produtos consistentes com as características e condições comerciais vigentes.

#### 4.2.2. Controle de Estoque e Inventário

O controle de estoque permite acompanhar a quantidade de produtos disponíveis na loja física, no site e nas operações relacionadas ao centro de distribuição. As movimentações são registradas no ERP Millennium, e o inventário é utilizado para conferir as quantidades físicas com os dados do sistema. A empresa também utiliza informações de disponibilidade, demanda e estoque mínimo para identificar a necessidade de reposição de mercadorias.

#### 4.2.3. Cadastro e Gerenciamento de Clientes

O cadastro de clientes reúne informações necessárias para identificar e atender consumidores e empresas. Os clientes podem ser classificados conforme o perfil de compra, como B2C, para consumidores finais, e B2B, para empresas e compradores do atacado. Os dados registrados auxiliam na identificação do cliente, no histórico de compras e na aplicação das condições comerciais correspondentes a cada perfil.
#### 4.2.4. Registro de Vendas na Loja Física e Virtual

As vendas realizadas na loja física são registradas no Ponto de Venda (PDV), enquanto as compras on-line são registradas por meio do site. Os registros reúnem informações dos produtos, quantidades, preços e formas de pagamento. Quando uma venda utiliza mais de uma forma de pagamento, cada modalidade é registrada separadamente. As informações das vendas também auxiliam no acompanhamento do estoque e dos resultados comerciais.

#### 4.2.5. Processamento de Pedidos da Loja Virtual

O processamento de pedidos on-line envolve as etapas de confirmação do pagamento, separação dos produtos, conferência dos itens por código de barras, faturamento e expedição. Após o envio, as informações de rastreamento permitem acompanhar a entrega ao cliente. Quando o pedido é cancelado antes do envio, o cancelamento e o eventual reembolso são relacionados ao pedido original, de acordo com a situação da compra.

#### 4.2.6. Controle de Preços, Tabelas de Preços e Promoções

A empresa administra os preços de venda conforme os produtos, as tabelas comerciais e as condições aplicáveis a cada modalidade de venda. Alterações de preços e concessões de descontos podem depender da aprovação da diretoria. O histórico de preços permite acompanhar os valores praticados em diferentes períodos, incluindo informações sobre preços de compra e de venda, conforme os registros mantidos pela empresa.

#### 4.2.7. Trocas, Devoluções, Cancelamentos e Reembolsos

As solicitações de troca, devolução e cancelamento são avaliadas conforme o tipo de compra e a situação do pedido. Nos casos de devolução, o produto pode passar por uma conferência para verificar suas condições. Quando aplicável, são registrados o motivo da operação e sua relação com a venda original. Os reembolsos são realizados conforme as condições da compra e os procedimentos aplicáveis, observando os direitos do consumidor.

#### 4.2.8. Venda no Atacado — B2B

As vendas no atacado atendem clientes empresariais e seguem condições comerciais específicas. A empresa considera o perfil do comprador, a finalidade da aquisição e as condições de negociação para definir o atendimento. O pedido mínimo costuma ser de seis peças, mas pode variar conforme o perfil do cliente e as condições autorizadas. Situações excepcionais podem ser encaminhadas à diretoria para avaliação.

#### 4.2.9. Cadastro e Relacionamento com Fornecedores e Marcas

O cadastro de fornecedores e marcas reúne informações utilizadas na identificação dos parceiros comerciais e no acompanhamento das compras. Esses registros auxiliam na organização dos pedidos, na conferência das mercadorias recebidas e na comunicação sobre divergências, avarias ou entregas pendentes. Quando necessário, a empresa mantém contato com os fornecedores para tratar de ajustes relacionados às mercadorias e às condições comerciais.

#### 4.2.10. Identificação da Necessidade e Pedido de Reposição de Mercadorias

A necessidade de reposição é identificada a partir das informações de estoque, da demanda e dos níveis mínimos definidos pela empresa. O ERP pode auxiliar nesse acompanhamento por meio de alertas e consultas, enquanto a análise dos relatórios contribui para a decisão de compra. Após a identificação da necessidade, é elaborado o pedido de reposição ao fornecedor, considerando os produtos, as quantidades e as condições comerciais estabelecidas.











<br>

---

## 5. Requisitos do Sistema
Os requisitos do sistema foram organizados em *Requisitos Funcionais (RF)* e *Requisitos Não Funcionais (RNF)* . Os Requisitos Funcionais representam as funcionalidades e operações que o sistema deve realizar, enquanto os Requisitos Não Funcionais representam características, restrições e condições relacionadas ao funcionamento do sistema, como segurança, desempenho, disponibilidade e recuperação dos dados.<br>


<h4>Requisitos Funcionais</h4>

| Código | Requisito |
|---|---|
| RF01 | O sistema deve permitir cadastrar produtos informando código, descrição, referência, coleção, subcoleção, grupo, categoria, tipo e demais informações de cadastro utilizadas pela organização. |
| RF02 | O sistema deve permitir atualizar os dados cadastrais dos produtos, incluindo descrição, referência, coleção, subcoleção, grupo, categoria, tipo e informações fiscais. |
| RF03 | O sistema deve permitir cadastrar marcas e associá-las aos respectivos produtos. |
| RF04 | O sistema deve permitir cadastrar fornecedores, armazenando CNPJ, razão social e nome do fornecedor. |
| RF05 | O sistema deve permitir registrar pedidos de reposição vinculados a fornecedores e contendo os produtos/variações, quantidades e preços solicitados. |
| RF06 | O sistema deve permitir cadastrar clientes com seus dados de identificação e contato. |
| RF07 | O sistema deve permitir consultar o histórico de compras de um cliente a partir das vendas registradas. |
| RF08 | O sistema deve permitir registrar vendas contendo data, canal de venda, forma de pagamento, desconto, funcionário responsável e itens comercializados. |
| RF09 | O sistema deve permitir registrar, para cada item de venda, a quantidade, o preço unitário, o desconto e a variação do produto comercializada. |
| RF10 | O sistema deve permitir cadastrar e relacionar as variações dos produtos às respectivas cores e tamanhos. |
| RF11 | O sistema deve permitir controlar as quantidades disponíveis dos produtos/variações comercializados pela organização. |
| RF12 | O sistema deve permitir cadastrar tabelas de preços conforme o canal de venda e o tipo de cliente. |
| RF13 | O sistema deve permitir registrar o histórico dos preços aplicados às variações dos produtos, incluindo o preço e o período de vigência. |
| RF14 | O sistema deve permitir registrar pedidos realizados pelo site, incluindo data, status do pedido, status do pagamento, rastreamento, envio e entrega. |
| RF15 |O sistema deve permitir relacionar o pedido online à venda correspondente. |
| RF16 | O sistema deve permitir acompanhar as etapas do pedido online, incluindo pagamento, separação, conferência, faturamento, envio, rastreamento e entrega. |
| RF17 | O sistema deve permitir registrar ocorrências de troca, devolução e cancelamento relacionadas aos pedidos online, incluindo motivo, data, status e valor de estorno quando aplicável. |
| RF18 | O sistema deve permitir gerar relatórios de faturamento, estoque, produtos, marcas, clientes, categorias e comparativos de vendas. |
| RF19 | O sistema deve permitir controlar usuários e suas permissões de acesso de acordo com o departamento e a função exercida. |
| RF20 | O sistema deve permitir realizar backups das informações armazenadas e recuperar os dados a partir de uma cópia de segurança quando necessário. |
 <br>
 
<h4>Requisitos Não Funcionais</h4>

| Requisito | Descrição |
|---|---|
| RNF01 — Segurança | O sistema deve proteger os dados armazenados contra acessos não autorizados. |
| RNF02 — Privacidade | Os dados pessoais dos clientes devem ser tratados de acordo com a LGPD. (Lei Geral de Proteção de Dados Pessoais) |
| RNF03 — Controle de acesso | O sistema deve permitir restringir o acesso às informações conforme o departamento e as permissões atribuídas a cada funcionário. |
| RNF04 — Backup | O sistema deve realizar cópias de segurança periódicas dos dados armazenados. |
| RNF05 — Recuperação de dados | O sistema deve permitir recuperar informações a partir de backups em caso de perda ou inconsistência dos dados. |
| RNF06 — Integridade dos dados | O sistema deve utilizar mecanismos que reduzam a ocorrência de registros duplicados, inconsistentes ou desatualizados. |
| RNF07 — Usabilidade | O sistema deve facilitar o preenchimento, consulta e atualização das informações, principalmente durante o cadastro manual de produtos. |
| RNF08 — Compatibilidade | O sistema deve ser acessível por computadores e notebooks, dispositivos utilizados atualmente pela organização. |
| RNF09 — Desempenho | O sistema deve apresentar tempo de resposta adequado para consultas, registros e geração dos relatórios utilizados na rotina da organização. |


---

## 6. Regras de Negócio
<br>
As regras de negócio foram definidas a partir do levantamento dos processos operacionais, comerciais, financeiros e de segurança da ANSARAH. Elas descrevem os procedimentos identificados durante a coleta de informações e os requisitos considerados para a modelagem do banco de dados. As regras que representam propostas para o modelo acadêmico estão identificadas como tal, diferenciando as práticas relatadas pela empresa das melhorias sugeridas para o sistema.

### 6.1 Regras operacionais

| Código | Regra de negócio |
|---|---|
| **RN01 — Cadastro de produtos** | O cadastro de produtos no ERP Millennium deve ser realizado pelo setor responsável, com base nas informações disponibilizadas pelas fábricas, garantindo a identificação e a padronização dos produtos cadastrados. |
| **RN02 — Informações do cadastro** | O cadastro do produto deve contemplar, conforme sua aplicabilidade, código, descrição, referência, coleção, subcoleção, grupo, categoria, tipo, departamento, marca, grades de cores e tamanhos, peso, NCM, classificação fiscal, país de origem, dimensões e informações de preço. |
| **RN03 — Variações por SKU** | Cada variação comercializável de um produto, correspondente à combinação de características como cor e tamanho, deve possuir identificação própria por SKU, permitindo seu controle individual no sistema. |
| **RN04 — Registro de vendas** | Todas as vendas realizadas nos pontos de venda físicos (PDV) ou no site devem ser registradas no sistema, contendo as informações gerais da operação e os respectivos itens comercializados. |
| **RN05 — Identificação do item vendido** | Cada item registrado em uma venda deve identificar o produto ou SKU comercializado, a quantidade vendida e o preço unitário praticado, permitindo o detalhamento dos produtos que compõem a operação. |
| **RN06 — Etapas do pedido online** | Os pedidos realizados pelo site devem passar pelas etapas aplicáveis de análise e aprovação do pagamento, separação dos produtos, conferência por bipagem, faturamento, despacho, rastreamento e entrega, mantendo o registro de suas respectivas situações. |
| **RN07 — Conferência de devoluções** | Os produtos devolvidos pelos clientes devem ser recebidos e conferidos pelo setor responsável antes da conclusão da ocorrência de troca ou devolução, verificando as condições da mercadoria. |
| **RN08 — Cancelamentos e reembolsos** | Os cancelamentos e reembolsos devem permanecer vinculados à venda ou ao pedido original, permitindo identificar a operação de origem, o motivo, a situação e os registros financeiros correspondentes. |
| **RN09 — Justificativa de operações** | Quando exigida pelo procedimento ou pelo sistema, a justificativa deve ser informada antes da confirmação da operação, como nos casos de cancelamentos sujeitos a essa exigência. |
| **RN10 — Estoque mínimo** | A grade padrão dos produtos deve ser considerada como referência para o planejamento das quantidades mínimas de estoque, respeitando as características de cada produto e suas respectivas variações. |
| **RN11 — Reposição de estoque** | A necessidade de reposição de produtos pode ser identificada por meio de alertas do sistema, relatórios de estoque, análise da demanda e verificação das quantidades disponíveis. |
| **RN12 — Disponibilidade de estoque (proposta para o modelo acadêmico)** | A quantidade disponível para comercialização deve considerar o saldo registrado para cada SKU, descontando as saídas e considerando as entradas de mercadorias. O controle deve permitir identificar divergências entre o estoque registrado e o disponível fisicamente, reduzindo o risco de comercialização de produtos indisponíveis. |
| **RN13 — Quantidade mínima para atacado** | A quantidade mínima usual informada para pedidos de atacado é de seis peças. Entretanto, o atendimento a essa quantidade, isoladamente, não garante o enquadramento da compra nas condições comerciais de atacado. |
| **RN14 — Condições comerciais B2B e B2C** | As condições comerciais devem considerar o perfil do cliente e a finalidade da compra, diferenciando as operações de varejo (B2C) e atacado (B2B). Situações excepcionais devem ser encaminhadas à diretoria para avaliação. |
| **RN15 — Conferência de mercadorias** | Os produtos recebidos dos fornecedores devem ser conferidos por meio de bipagem e comparados com as quantidades e os itens registrados no pedido de reposição, permitindo verificar a correspondência entre o pedido e a entrega. |
| **RN16 — Entregas parciais** | Quando o fornecedor realizar a entrega de apenas parte dos produtos solicitados, as quantidades recebidas e as quantidades ainda pendentes devem ser registradas separadamente, permitindo acompanhar o saldo restante do pedido. |
| **RN17 — Divergências no recebimento** | As divergências identificadas durante o recebimento, como diferenças de quantidade, produtos incorretos ou problemas nas condições das mercadorias, devem ser registradas e encaminhadas ao setor responsável para tratativa com o fornecedor. |
| **RN18 — Devolução ao fornecedor** | As devoluções de mercadorias aos fornecedores devem ser registradas no sistema, identificando os produtos e as respectivas quantidades devolvidas, com emissão de nota fiscal de devolução quando aplicável. |
| **RN19 — Registro de contas a pagar** | As notas fiscais e as duplicatas ou os boletos recebidos dos fornecedores devem ser registrados no ERP Millennium, permitindo acompanhar os valores e as obrigações financeiras correspondentes. |
| **RN20 — Parcelas e vencimentos** | As obrigações financeiras parceladas devem possuir registros individuais para cada parcela, contendo valor, data de vencimento e situação do pagamento, permitindo acompanhar os compromissos financeiros. |
| **RN21 — Baixa financeira** | Após a realização do pagamento, o responsável deve registrar a baixa da obrigação no sistema, informando a data, o valor pago e a identificação do usuário responsável pelo registro. |
| **RN22 — Relatórios financeiros** | O controle financeiro deve permitir consultar as contas a pagar de acordo com sua situação, possibilitando identificar obrigações pagas, pendentes e vencidas. |
| **RN23 — Divergências financeiras** | Diferenças identificadas entre o valor da nota fiscal e o pedido de compra devem ser tratadas entre os setores financeiros da ANSARAH e do fornecedor antes da realização do pagamento. A solução pode envolver abatimento em duplicata posterior ou em pedido futuro, conforme o acordo estabelecido. |
| **RN24 — Categorização de despesas** | As despesas registradas no sistema devem ser classificadas de acordo com sua natureza, permitindo distinguir obrigações relacionadas a fornecedores de outras despesas operacionais e facilitando o controle financeiro. |
| **RN25 — Múltiplas formas de pagamento** | Quando uma venda utilizar mais de uma forma de pagamento, cada modalidade utilizada e seu respectivo valor devem ser registrados separadamente, mantendo a composição financeira da operação. |
| **RN26 — Movimentações de estoque** | As entradas, saídas e transferências de estoque devem possuir registros que permitam identificar o SKU movimentado, a quantidade, a data, o tipo de movimentação e o funcionário responsável pela operação. |
<br><br>
### 6.2 Regras organizacionais, comerciais e de segurança
<Br><br>
| Código | Regra de negócio |
|---|---|
| **RN27 — Login individual (proposta para o modelo acadêmico)** | Cada funcionário deve utilizar uma conta de acesso individual ao sistema, permitindo identificar o responsável pelas operações realizadas e evitando o compartilhamento de credenciais. |
| **RN28 — Permissões por função** | O acesso às funcionalidades e às informações do sistema deve respeitar as permissões associadas ao departamento e à função desempenhada pelo funcionário, limitando o acesso conforme suas responsabilidades. |
| **RN29 — Auditoria de operações (proposta para o modelo acadêmico)** | O sistema deve manter registros das operações relevantes realizadas pelos usuários, contendo a identificação do responsável, a data e a hora, o tipo de operação e o registro afetado. Entre as operações que podem ser auditadas estão alterações cadastrais, mudanças de preços, vendas, cancelamentos e movimentações de estoque. |
| **RN30 — Aprovação de preços e descontos** | Alterações nos preços dos produtos e concessões de descontos devem depender de autorização da diretoria, conforme as condições comerciais e os procedimentos estabelecidos pela empresa. |
| **RN31 — Histórico de preços (proposta para o modelo acadêmico)** | O modelo de dados deve preservar o histórico dos preços praticados, registrando os valores anteriores e atuais, as respectivas datas de vigência e a tabela de preços relacionada, quando aplicável. |
| **RN32 — Proteção de dados pessoais** | Os dados pessoais dos clientes devem ser acessados e utilizados de acordo com as permissões dos usuários, a finalidade do tratamento e a legislação aplicável, incluindo os princípios e as disposições da Lei Geral de Proteção de Dados Pessoais (LGPD). |
| **RN33 — Trocas e devoluções** | As operações de troca e devolução devem observar a legislação aplicável, incluindo o Código de Defesa do Consumidor, e os procedimentos comerciais válidos da empresa, mantendo os registros necessários para o acompanhamento de cada ocorrência. |

---

## 7. Modelo Conceitual (Entidade-Relacionamento-Atributos)



---

### 8. DER Diagrama Entidade-Relacionamento 

O **Diagrama Entidade-Relacionamento (DER)** está **anexado no repositório**.

> **Imagem do DER: anexada no repositório.**

### 8.1 Apontamento da correção
<BR><BR>
| **Apontamento da correção da E1** | **O que mudou no trabalho** | **Por quê** |
|---|---|---|
| Relacionamento entre VENDA e PRODUTO sem detalhamento dos itens vendidos. | Foi incluída a entidade associativa ITEM_VENDA, com atributos para identificar cada item, a quantidade vendida e o preço unitário praticado. | Permite registrar individualmente os produtos de cada venda, incluindo suas quantidades e os preços aplicados a cada item. |
| Relacionamento entre pedido de reposição e produto sem detalhamento dos itens solicitados. | Foi incluída a entidade associativa ITEM_REPOSICAO, com atributos para identificar o item, a quantidade solicitada, a quantidade recebida e o status do recebimento. | Permite detalhar os produtos de cada pedido de reposição e acompanhar os recebimentos, inclusive quando ocorrem entregas parciais. |
| Ausência de detalhamento dos preços aplicados aos produtos nas tabelas de preços. | Foi incluída a entidade associativa ITEM_TABELA_PRECO, responsável por relacionar as tabelas de preços aos produtos e registrar o preço e o período de vigência aplicáveis. | Permite associar cada produto à tabela de preços correspondente, registrando os valores e os períodos em que são válidos. |
| Necessidade de registrar as alterações dos preços dos produtos. | A entidade HISTORICO_PRECO foi mantida e considerada no detalhamento do histórico de preços, incluindo informações sobre os valores anteriores e novos e as datas relacionadas às alterações, conforme os atributos definidos no modelo. | Permite acompanhar as alterações de preços ao longo do tempo e consultar os valores registrados anteriormente. |
| Necessidade de detalhar as movimentações de estoque. | Foi incluída a entidade MOVIMENTACAO_ESTOQUE, com atributos relacionados à data, ao tipo, à quantidade, ao motivo e ao documento de referência da movimentação. | Permite registrar as movimentações de estoque, identificar suas características e manter informações para consulta e acompanhamento. |
| Necessidade de registrar operações realizadas no sistema e manter informações de auditoria. | Foram incluídas as entidades USUARIO_SISTEMA e LOG_AUDITORIA no modelo proposto, contemplando informações sobre os usuários e as operações registradas. | Permite estruturar o registro das operações e associá-las aos usuários responsáveis, contribuindo para a rastreabilidade e a auditoria das informações. |
| Necessidade de representar os pagamentos separadamente das vendas. | A entidade PAGAMENTO foi considerada separadamente de VENDA, contemplando informações como valor, forma de pagamento, data, status e dados de confirmação da transação. | Permite registrar os pagamentos individualmente e representar situações em que uma venda utiliza mais de uma forma de pagamento. |
| Necessidade de controlar as contas a pagar. | Foi incluída a entidade CONTA_A_PAGAR, com atributos para identificar o documento, os valores, as datas de emissão, vencimento e pagamento e o status da obrigação financeira. | Permite organizar as obrigações financeiras e acompanhar seus vencimentos e pagamentos. |
| Redundância da descrição do produto em `ITEM_VENDA`. | Remoção do atributo `nome_item_venda` da tabela `ITEM_VENDA`. | A descrição já está armazenada na tabela `PRODUTO` e pode ser recuperada por meio do relacionamento com `PRODUTO_SKU`, evitando a duplicação de informações. |
| Redundância da descrição do produto em `ITEM_REPOSICAO`. | Remoção do atributo `nome_item_reposicao` da tabela `ITEM_REPOSICAO`. | A descrição do produto pode ser obtida por meio do SKU relacionado, mantendo as informações centralizadas na tabela `PRODUTO`. |


---

## 9. Dicionário de Dados

O **Dicionário de Dados** está **anexado no repositório**.

Ele apresenta as entidades, atributos, chaves primárias (PK), chaves estrangeiras (FK) e demais informações definidas para o modelo.

> **Arquivo do Dicionário de Dados: anexado no repositório.**

---

## 10. Justificativa Técnica do Modelo

A modelagem conceitual foi desenvolvida com o objetivo de representar os principais processos identificados no levantamento de informações da Ansarah, contemplando cadastro de produtos, vendas, estoque, preços, pedidos on-line, reposição de mercadorias, pagamentos, controle financeiro e acesso ao sistema.

A entidade **PRODUTO** concentra as informações gerais dos produtos comercializados, enquanto **PRODUTO_SKU** representa suas variações comercializáveis. As entidades **COR** e **TAMANHO** foram separadas para permitir o reaproveitamento dessas informações em diferentes produtos. Essa organização possibilita identificar individualmente as combinações de produto, cor e tamanho, conforme a necessidade de controle das variações e de suas respectivas quantidades em estoque.

As entidades **VENDA** e **ITEM_VENDA** foram separadas para distinguir as informações gerais da operação comercial dos produtos que a compõem. Essa estrutura permite registrar vários itens em uma mesma venda, com suas respectivas quantidades e preços unitários. A entidade **PAGAMENTO** complementa esse processo ao armazenar as informações dos pagamentos associados às vendas, permitindo representar operações realizadas por diferentes formas de pagamento.

A entidade **PEDIDO_ONLINE** representa as informações específicas das compras realizadas pelo site, incluindo status, rastreamento, envio e entrega. Seu relacionamento com **VENDA** permite associar o pedido à operação comercial correspondente. Já **TROCA_DEVOLUCAO** registra as ocorrências relacionadas aos pedidos on-line, incluindo motivo, situação, data e eventual valor de estorno, quando aplicável.

Para representar o controle de estoque, foi incluída a entidade **MOVIMENTACAO_ESTOQUE**, responsável por registrar as alterações nas quantidades dos produtos, incluindo tipo, quantidade, data e informações sobre o responsável pela operação. Essa estrutura permite consultar o histórico de movimentações e apoiar a análise das entradas, saídas e possíveis divergências de estoque.

O controle comercial de preços foi representado pelas entidades **TABELA_PRECO**, **ITEM_TABELA_PRECO** e **HISTORICO_PRECO**. Essa divisão permite organizar as tabelas comerciais, associar preços aos produtos ou às suas variações e preservar os registros das alterações realizadas ao longo do tempo.

As entidades **FORNECEDOR**, **PEDIDO_REPOSICAO** e **ITEM_REPOSICAO** representam o processo de reposição de mercadorias. O pedido identifica a solicitação realizada ao fornecedor, enquanto seus itens detalham os produtos solicitados, as quantidades, os valores e as informações de recebimento. Essa estrutura permite representar pedidos com vários produtos e acompanhar entregas parciais.

A entidade **CONTA_A_PAGAR** representa os compromissos financeiros relacionados às operações de compra, incluindo documentos, valores, vencimentos, situação e informações de pagamento. Sua relação com **PEDIDO_REPOSICAO** permite associar as obrigações financeiras aos pedidos correspondentes, conforme os relacionamentos definidos no modelo.

Para representar a organização interna, a entidade **FUNCIONARIO** foi relacionada à entidade **DEPARTAMENTO**, permitindo identificar o setor ao qual cada funcionário está associado. As entidades **USUARIO_SISTEMA** e **LOG_AUDITORIA** foram propostas para representar o controle de acesso e a rastreabilidade das operações realizadas no sistema, contribuindo para a identificação dos usuários e o registro das ações relevantes.

De modo geral, a estrutura proposta busca organizar as informações de acordo com os processos identificados, reduzir a duplicidade de dados e estabelecer uma base consistente para consultas e análises gerenciais. As entidades e os relacionamentos representam uma proposta acadêmica de modelagem, sujeita à validação e aos ajustes necessários conforme as regras de negócio e os requisitos identificados durante o levantamento.

---

## 11. Justificativa das Decisões de Modelagem e das Restrições de Integridade

As decisões técnicas do modelo foram definidas para garantir a identificação dos registros, estabelecer os relacionamentos entre as entidades e reduzir inconsistências no armazenamento das informações.

### 11.1 Chaves primárias

As chaves primárias (PK) foram definidas para identificar exclusivamente os registros de cada tabela. Foram utilizados identificadores próprios, como `id_produto`, `id_cliente`, `id_venda`, `id_sku` e `id_fornecedor`, evitando a dependência de atributos descritivos, como nomes, para identificar os registros.

Nas tabelas que representam itens de processos, como `ITEM_VENDA`, `ITEM_REPOSICAO` e `ITEM_TABELA_PRECO`, os identificadores próprios permitem distinguir cada item individualmente, mesmo quando vários itens pertencem à mesma venda, pedido de reposição ou tabela de preços.

### 11.2 Chaves estrangeiras e relacionamentos

As chaves estrangeiras (FK) estabelecem referências entre as tabelas e permitem associar os registros correspondentes aos processos representados no modelo.

**Cadastro de produtos:** `PRODUTO` relaciona-se com `MARCA`, enquanto `PRODUTO_SKU` relaciona-se com `PRODUTO`, `COR` e `TAMANHO`. Essa estrutura permite associar cada variação ao produto correspondente e às suas características comerciais.

**Vendas e pagamentos:** `VENDA` relaciona-se com `CLIENTE` e `FUNCIONARIO`, quando essas associações forem aplicáveis. `ITEM_VENDA` relaciona-se com `VENDA` e `PRODUTO_SKU`, permitindo identificar os produtos comercializados, suas quantidades e seus preços unitários. `PAGAMENTO` relaciona-se com `VENDA`, possibilitando registrar separadamente os pagamentos associados a uma mesma operação.

**Pedidos on-line e ocorrências:** `PEDIDO_ONLINE` relaciona-se com `CLIENTE` e `VENDA`. `TROCA_DEVOLUCAO` relaciona-se com `PEDIDO_ONLINE`, permitindo associar cada ocorrência ao pedido correspondente.

**Reposição de mercadorias:** `PEDIDO_REPOSICAO` relaciona-se com `FORNECEDOR`. `ITEM_REPOSICAO` relaciona-se com `PEDIDO_REPOSICAO` e `PRODUTO_SKU`, permitindo detalhar os produtos solicitados e as quantidades recebidas.

**Movimentação de estoque:** `MOVIMENTACAO_ESTOQUE` relaciona-se com `PRODUTO_SKU` e `FUNCIONARIO`. Também pode relacionar-se com `ITEM_REPOSICAO`, quando a movimentação estiver associada ao recebimento de um item de reposição.

**Controle de preços:** `ITEM_TABELA_PRECO` relaciona-se com `TABELA_PRECO` e `PRODUTO_SKU`. `HISTORICO_PRECO` relaciona-se com `PRODUTO_SKU` e `TABELA_PRECO`, permitindo registrar as alterações dos preços associados aos produtos e às respectivas tabelas comerciais.

**Controle financeiro:** `CONTA_A_PAGAR` relaciona-se com `PEDIDO_REPOSICAO` por meio de `id_reposicao`. Dessa forma, as informações do fornecedor podem ser consultadas pelo relacionamento entre `PEDIDO_REPOSICAO` e `FORNECEDOR`, sem a necessidade de duplicar sua identificação em `CONTA_A_PAGAR`.

**Funcionários e auditoria:** `FUNCIONARIO` relaciona-se com `DEPARTAMENTO`; `USUARIO_SISTEMA` relaciona-se com `FUNCIONARIO`; e `LOG_AUDITORIA` relaciona-se com `USUARIO_SISTEMA`. Esses relacionamentos permitem representar a associação entre funcionários, contas de acesso e registros de auditoria.

### 11.3 Restrições de integridade

As restrições de integridade foram consideradas para controlar os valores armazenados e evitar inconsistências nos registros.

- **PRIMARY KEY (PK):** identifica exclusivamente cada registro de uma tabela.
- **FOREIGN KEY (FK):** estabelece referências entre tabelas e impede que sejam inseridos valores que não correspondam a registros existentes na tabela referenciada, conforme as regras de integridade aplicáveis.
- **NOT NULL (NN):** impede que atributos definidos como obrigatórios sejam armazenados sem valor.
- **UNIQUE (UQ):** impede a duplicidade dos valores abrangidos pela restrição, conforme sua definição no banco de dados.
- **CHECK:** limita os valores permitidos em determinados atributos, como quantidades não negativas, valores financeiros não negativos e classificações restritas a opções previamente definidas.
- **IDENTITY / AUTO_INCREMENT:** permite gerar identificadores automaticamente nas tabelas em que esse mecanismo foi definido.

A aplicação dessas restrições deve corresponder às definições presentes no script SQL e no Dicionário de Dados, garantindo consistência entre a documentação e a implementação relacional.

### 11.4 Relação com as regras de negócio

As decisões de modelagem foram relacionadas às regras de negócio levantadas durante o estudo da organização.

No cadastro de produtos, a separação entre `PRODUTO` e `PRODUTO_SKU` está relacionada às RN01, RN02 e RN03, que tratam do cadastro e da identificação das variações comercializáveis.

Nos processos de venda e pagamento, a estrutura de `VENDA`, `ITEM_VENDA` e `PAGAMENTO` apoia a representação das operações comerciais e das diferentes formas de pagamento, conforme as RN04, RN05 e RN25.

O controle de pedidos on-line, trocas e devoluções está relacionado às RN06, RN07, RN08 e RN33. Já o controle de estoque e reposição está associado às RN10, RN11, RN12, RN15, RN16, RN17 e RN26, que tratam da disponibilidade dos produtos, das necessidades de reposição, das conferências de recebimento e do registro das movimentações.

A estrutura de contas a pagar está relacionada às RN19, RN21 e RN22, que abordam o registro das obrigações financeiras, a confirmação dos pagamentos e a consulta das contas por situação. As entidades de acesso e auditoria, por sua vez, foram propostas para apoiar as RN27, RN28, RN29 e RN32, relacionadas à individualização dos acessos, às permissões, ao rastreamento das operações e à proteção dos dados.

A relação entre as entidades e as regras de negócio deve ser interpretada conforme o que está efetivamente representado no DER, no Dicionário de Dados e no script SQL. A existência de uma regra de negócio no levantamento não significa, por si só, que todos os mecanismos necessários para atendê-la já estejam implementados.

### 11.5 Decisões para evitar redundância

A separação entre `PRODUTO` e `PRODUTO_SKU` evita misturar as informações gerais dos produtos com os dados específicos de suas variações. Assim, o nome e a descrição do produto podem ser consultados por meio do relacionamento com o SKU, sem a necessidade de repetir essas informações em cada variação.

Pelo mesmo motivo, os atributos `nome_item_venda` e `nome_item_reposicao` não foram mantidos em `ITEM_VENDA` e `ITEM_REPOSICAO`, pois o nome do produto pode ser obtido pelo relacionamento entre essas tabelas, `PRODUTO_SKU` e `PRODUTO`.

O atributo `preco_unitario_venda` foi mantido em `ITEM_VENDA` porque representa o preço efetivamente praticado na operação comercial. Esse valor pode ser diferente do preço atualmente cadastrado e, portanto, precisa ser preservado para manter o histórico financeiro da venda.

A separação entre `VENDA` e `PAGAMENTO` permite representar pagamentos associados a uma mesma venda sem limitar a operação a uma única forma de pagamento. Da mesma maneira, a separação entre `PEDIDO_REPOSICAO` e `ITEM_REPOSICAO` permite registrar individualmente os produtos solicitados e recebidos, incluindo situações de entrega parcial.

Por fim, `USUARIO_SISTEMA` e `LOG_AUDITORIA` foram propostas como entidades para representar o controle de acesso e a rastreabilidade das operações no modelo acadêmico. Sua inclusão não significa que essas entidades correspondam à estrutura interna do ERP utilizado pela Ansarah, mas que representam uma proposta de organização dessas informações no banco de dados desenvolvido para o projeto.


---

## 12. Uso de Inteligência Artificial


<br><br>
---

## 13. Conclusão

<br><br>



---

## 14. Referências

- **ANSARAH.** Informações institucionais e comerciais.  
  https://www.ansarah.com.br/

- **ANSARAH.** Entrevista e questionário com representante da organização. 2026.

- **Google Maps.** Localização das lojas da Ansarah.  
  25 de Março: https://maps.app.goo.gl/ja89dX2NqaD3WHnK6  
  Brás: https://maps.app.goo.gl/SKGrzBL6uDV7w4WL8

- **CNPJ.BIZ.** Consulta de registro da organização.  
  > **(https://cnpj.biz/61419610000119)**

---

