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
### Problemas e necessidades identificadas
<BR><BR>
**P1 — Perda de informações e retrabalho após a restauração de backups:** Durante o levantamento, foi identificada uma dificuldade relacionada à recuperação de informações armazenadas no ERP. Em situações em que é necessário restaurar um backup anterior, dados registrados após a data da cópia de segurança podem não estar presentes na versão recuperada. Com isso, informações mais recentes precisam ser inseridas novamente de forma manual, ocasionando retrabalho, perda de tempo e risco de inconsistências nos registros da empresa.

**P2 — Dificuldade na geração de relatórios personalizados:** Foi identificada uma limitação na elaboração de relatórios no ERP Millennium, principalmente quando a empresa necessita consultar informações específicas que não estão disponíveis nos relatórios padrão do sistema. Essa dificuldade pode tornar a análise dos dados mais demorada, dificultando o acompanhamento de indicadores relacionados às vendas, aos produtos, ao estoque e às demais atividades da organização.

**P3 — Falhas no controle de disponibilidade de produtos no site:** Foi identificada uma situação em que a loja virtual permite que o cliente realize compras de produtos mesmo quando não há quantidade suficiente disponível em estoque. Isso pode resultar na realização de pedidos sem disponibilidade real para atendimento, gerando dificuldades no processamento das vendas, na separação das mercadorias e no cumprimento dos pedidos. Além disso, a empresa trabalha com diferentes variações de produtos, como cores e tamanhos, o que exige um controle preciso das quantidades disponíveis de cada SKU para evitar divergências entre o estoque registrado e os produtos oferecidos no site.

Diante desses problemas, o projeto busca estruturar os dados da organização para melhorar o gerenciamento das informações, facilitar consultas gerenciais, apoiar o acompanhamento do estoque e contribuir para a integridade e a rastreabilidade dos registros.
</br></br>
**Escopo do sistema:** O banco de dados proposto contempla os principais processos de negócio da organização, incluindo cadastro de clientes, funcionários, usuários e produtos; gerenciamento de vendas e pedidos on-line; pagamentos; controle de preços; estoque e movimentações; fornecedores; reposição e recebimento de mercadorias; contas a pagar; trocas e devoluções; registros de auditoria; além do controle das operações de backup e restauração. Dessa forma, o modelo não se limita a um único setor, mas busca integrar informações relacionadas à operação comercial, administrativa, financeira e logística da Ansarah.
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

Como melhoria proposta, o sistema de vendas poderá consultar a quantidade disponível de cada SKU durante a finalização da compra. Caso a quantidade solicitada seja superior ao estoque disponível, será apresentado um alerta ao cliente, solicitando a redução da quantidade ou a escolha de outra variação do produto, impedindo a conclusão da compra enquanto não houver disponibilidade suficiente.

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

### 4.2.10. Identificação da Necessidade e Pedido de Reposição de Mercadorias

A necessidade de reposição é identificada a partir das informações de estoque, da demanda e dos níveis mínimos definidos pela empresa. As consultas e os relatórios do ERP auxiliam nesse acompanhamento, enquanto a análise das informações contribui para a decisão de compra. Como melhoria proposta, indicadores de estoque baixo poderão facilitar a identificação de produtos que necessitam de reposição. Após a identificação da necessidade, é elaborado o pedido de reposição ao fornecedor, considerando os produtos, as quantidades e as condições comerciais estabelecidas.

#### 4.2.11. Recebimento e Conferência de Mercadorias

No recebimento, as mercadorias são conferidas com base no pedido de compra, utilizando a leitura dos códigos de barras para verificar os itens e as quantidades entregues. Caso existam divergências, avarias ou entregas parciais, a situação é registrada e comunicada ao fornecedor. Dependendo do caso, podem ocorrer entregas complementares, devoluções acompanhadas de nota fiscal ou abatimentos em cobranças futuras. Os registros de estoque são atualizados conforme o resultado da conferência.

#### 4.2.12. Controle de Contas a Pagar

O controle de contas a pagar reúne informações das notas fiscais, dos boletos, das duplicatas, das parcelas e dos vencimentos relacionados às compras. O ERP Millennium permite consultar compromissos pagos, pendentes ou vencidos. Antes do pagamento, eventuais divergências entre os valores da nota fiscal e do pedido de compra podem ser verificadas com o fornecedor. Após a confirmação do pagamento, é realizada a baixa correspondente, registrando informações como data, valor e usuário responsável.

#### 4.2.13. Logística e Centro de Distribuição

A logística envolve a organização e a movimentação das mercadorias entre o recebimento, o armazenamento, a separação e a expedição dos pedidos. No atendimento on-line, os produtos são separados e conferidos antes do faturamento e do envio. As informações de expedição e rastreamento auxiliam no acompanhamento dos pedidos até a entrega ao cliente. Essas atividades dependem dos registros de estoque e das informações dos pedidos para apoiar a organização das operações.

#### 4.2.14. Controle de Usuários, Permissões e Registros de Operações

O acesso ao ERP é realizado por usuários individuais, com permissões definidas conforme a função e as responsabilidades de cada funcionário. O sistema mantém registros de operações que permitem identificar o usuário responsável e informações como data e horário. Algumas ações, como cancelamentos, podem exigir justificativa, enquanto alterações de preços e descontos podem depender de autorização da diretoria. Esses controles contribuem para a segurança, a rastreabilidade e a integridade das informações.

### 4.2.15. Controle de Backup e Restauração

O processo de backup e restauração tem como objetivo contribuir para a segurança e a recuperação das informações armazenadas no banco de dados. Como proposta, os backups poderão ser executados automaticamente em períodos programados, mantendo registros sobre o tipo de cópia realizada, as datas de execução, o local de armazenamento e a situação da operação.

Quando ocorrer uma falha ou perda de informações, um usuário com perfil autorizado poderá realizar a restauração utilizando uma cópia de segurança adequada. A operação deverá ser registrada, identificando o backup utilizado, o responsável, as datas e o resultado da recuperação.

No modelo de dados, a entidade BACKUP_SISTEMA registra as execuções das cópias de segurança, enquanto REGISTRO_RESTAURACAO armazena o histórico das operações de recuperação. Esses registros permitem acompanhar as operações e identificar possíveis falhas, contribuindo para a rastreabilidade e a organização das informações.

### 4.3. Processo Complementar — Geração de Relatórios

A geração de relatórios permite consultar informações sobre produtos, estoque, vendas, marcas, pagamentos e períodos. Esses dados auxiliam no acompanhamento das operações e apoiam decisões relacionadas à reposição de mercadorias, ao desempenho comercial e à gestão da empresa.

Como proposta de melhoria, as informações estruturadas no banco de dados poderão ser utilizadas em dashboards de Business Intelligence (BI), facilitando a visualização de indicadores e resultados. Recursos de Inteligência Artificial (IA) também poderão auxiliar na análise dos dados e na geração automatizada de relatórios, identificando tendências e apresentando informações relevantes para apoiar a tomada de decisões. Essas funcionalidades dependerão da integração com ferramentas analíticas e de IA.

### 4.4. Integração entre os Processos de Negócio

Os processos de negócio estão relacionados e compartilham informações utilizadas em diferentes etapas da operação. O cadastro de produtos e suas variações fornece os dados necessários para as vendas e o controle de estoque. As vendas realizadas no PDV e no site estão relacionadas à disponibilidade dos produtos, enquanto os pedidos on-line dependem das atividades de separação, conferência, faturamento e expedição.

O processo de reposição também está relacionado ao estoque, pois a necessidade de compra pode ser identificada a partir das informações de disponibilidade e demanda. Após o recebimento e a conferência das mercadorias, os registros de estoque são atualizados conforme o resultado da operação. As compras, por sua vez, geram compromissos financeiros acompanhados pelo processo de contas a pagar.

As informações registradas no ERP alimentam relatórios que apoiam o acompanhamento das atividades e a tomada de decisões. O controle de usuários e permissões atua de forma transversal, restringindo o acesso às funcionalidades conforme as responsabilidades de cada funcionário.

O acompanhamento do estoque também está relacionado ao processo de vendas, pois a disponibilidade dos produtos deve ser verificada durante a finalização das compras. Como melhoria proposta, o sistema poderá validar a quantidade solicitada de cada SKU e apresentar alertas quando não houver estoque suficiente, evitando a conclusão de vendas sem disponibilidade.

A segurança das informações também está relacionada aos demais processos, por meio do controle de usuários, registros de auditoria, backups e restaurações. As operações de backup e recuperação poderão ser acompanhadas por registros específicos, permitindo consultar as cópias realizadas, identificar falhas e verificar as restaurações executadas.



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
| RF09 | O sistema deve permitir registrar, para cada item de venda, a quantidade, o preço unitário e a variação do produto comercializada. |
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
| RF20 | O sistema deve permitir registrar as execuções de backups, armazenando informações como tipo, data de início, data de término, local de armazenamento, tamanho e situação da operação. |
| RF21 | O sistema deve permitir registrar as operações de restauração, identificando o backup utilizado, o usuário responsável quando aplicável, as datas, o motivo e o resultado da operação. |
| RF22 | O sistema deve permitir consultar o histórico de backups e restaurações, possibilitando identificar operações concluídas, falhas e cópias utilizadas em recuperações. |
| RF23 | O sistema deve verificar a disponibilidade de estoque do SKU solicitado durante a compra realizada pelo site. Caso a quantidade solicitada seja superior à disponível, deve apresentar um aviso e impedir a conclusão da compra. |
| RF24 | O sistema deve registrar as operações relevantes realizadas pelos usuários, permitindo consultar alterações e ações relacionadas aos dados armazenados. |
| RF25 | O sistema deve permitir registrar as movimentações de estoque, identificando o SKU, o tipo de movimentação, a quantidade, a data, o motivo e o funcionário responsável, quando aplicável. |
 <br>

 
<h4>Requisitos Não Funcionais</h4>

| Requisito | Descrição |
|---|---|
| RNF01 — Segurança | O sistema deve proteger os dados armazenados contra acessos não autorizados. |
| RNF02 — Privacidade | Os dados pessoais dos clientes devem ser tratados de acordo com a LGPD. (Lei Geral de Proteção de Dados Pessoais) |
| RNF03 — Controle de acesso | O sistema deve permitir restringir o acesso às informações conforme o departamento e as permissões atribuídas a cada funcionário. |
| RNF04 — Backup | O processo de backup deve permitir a execução periódica de cópias de segurança, conforme uma programação previamente definida, garantindo a existência de cópias armazenadas em local adequado. |
| RNF05 — Recuperação de dados | O processo de recuperação deve permitir a restauração das informações a partir de backups válidos, preservando a integridade dos dados recuperados e registrando o resultado da operação. |
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
| **RN11 — Identificação da necessidade de reposição** | A necessidade de reposição de produtos deve ser identificada por meio da análise dos relatórios de estoque, da demanda e das quantidades disponíveis. A utilização de alertas automáticos de estoque baixo poderá ser adotada como melhoria proposta para facilitar esse acompanhamento. |
| **RN12 — Disponibilidade e validação de estoque (proposta para o modelo acadêmico)** | A disponibilidade para comercialização deve ser controlada individualmente por SKU, considerando as entradas, saídas e demais movimentações de estoque registradas. Durante a realização de compras pelo site, o sistema deverá verificar se a quantidade solicitada está disponível. Caso a quantidade desejada seja superior ao saldo disponível, deverá apresentar um aviso ao cliente e impedir a conclusão da compra até que a quantidade seja ajustada. |
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
| **RN26 — Movimentações de estoque** | As entradas e saídas de estoque devem possuir registros que permitam identificar o SKU movimentado, a quantidade, a data, o tipo e o motivo da movimentação, além do funcionário responsável pela operação, quando aplicável. |
<br><br>
### 6.2 Regras organizacionais, comerciais e de segurança
<Br><br>
| Código | Regra de negócio |
|---|---|
| **RN27 — Login individual (proposta para o modelo acadêmico)** | Cada funcionário deve utilizar uma conta de acesso individual ao sistema, permitindo identificar o responsável pelas operações realizadas e evitando o compartilhamento de credenciais. |
| **RN28 — Permissões por função** | O acesso às funcionalidades e às informações do sistema deve respeitar as permissões associadas ao departamento e à função desempenhada pelo funcionário, limitando o acesso conforme suas responsabilidades. |
| **RN29 — Auditoria de operações (proposta para o modelo acadêmico)** | O sistema deve manter registros das operações relevantes realizadas pelos usuários, contendo a identificação do responsável, a data e a hora, o tipo de operação, a entidade afetada, o registro modificado e, quando aplicável, os valores anteriores e posteriores à alteração. Entre as operações que podem ser auditadas estão alterações cadastrais, mudanças de preços, vendas, cancelamentos e movimentações de estoque. |
| **RN30 — Aprovação de preços e descontos** | Alterações nos preços dos produtos e concessões de descontos devem depender de autorização da diretoria, conforme as condições comerciais e os procedimentos estabelecidos pela empresa. |
| **RN31 — Histórico de preços (proposta para o modelo acadêmico)** | O modelo de dados deve preservar o histórico dos preços praticados, registrando os valores anteriores e atuais, as respectivas datas de vigência e a tabela de preços relacionada, quando aplicável. |
| **RN32 — Proteção de dados pessoais** | Os dados pessoais dos clientes devem ser acessados e utilizados de acordo com as permissões dos usuários, a finalidade do tratamento e a legislação aplicável, incluindo os princípios e as disposições da Lei Geral de Proteção de Dados Pessoais (LGPD). |
| **RN33 — Trocas e devoluções** | As operações de troca e devolução devem observar a legislação aplicável, incluindo o Código de Defesa do Consumidor, e os procedimentos comerciais válidos da empresa, mantendo os registros necessários para o acompanhamento de cada ocorrência. |
| **RN34 — Execução e registro de backups (proposta para o modelo acadêmico)** | As cópias de segurança devem ser executadas conforme uma programação definida, e cada execução deve possuir um registro contendo o tipo de backup, as datas de início e término, o local de armazenamento, o tamanho do arquivo e a situação da operação. Quando o backup for executado automaticamente, o registro poderá não possuir um usuário responsável associado. |
| **RN35 — Registro de restaurações (proposta para o modelo acadêmico)** | Toda operação de restauração deve ser registrada, identificando o backup utilizado, a data de início e término, o motivo da recuperação, o resultado da operação e o usuário responsável, quando aplicável. |
| **RN36 — Vínculo entre backup e restauração (proposta para o modelo acadêmico)** | Cada registro de restauração deve estar associado a um único backup utilizado na recuperação. Um mesmo backup poderá ser utilizado em diferentes operações de restauração, permitindo manter o histórico de suas utilizações. |

---

## 7. Modelo Conceitual (Entidade-Relacionamento-Atributos)
A partir do levantamento realizado com a organização, foram identificadas entidades para representar os principais dados envolvidos nos processos de cadastro, vendas, controle de estoque, compras, preços, pagamentos, pedidos on-line e controle de acesso. O modelo conceitual foi estruturado para organizar essas informações e representar os relacionamentos entre elas.

### Entidades identificadas

- **Cliente:** representa os clientes cadastrados pela organização, incluindo consumidores finais e clientes empresariais.
- **Funcionário:** representa os funcionários envolvidos nas atividades da empresa.
- **Departamento:** representa os setores responsáveis pelas atividades da organização.
- **Usuário_Sistema:** representa os usuários que acessam o sistema, com informações de login, senha armazenada em formato de hash, perfil e status de acesso.
- **Log_Auditoria:** registra operações realizadas no sistema, incluindo o tipo de operação, a entidade afetada, o usuário responsável, a data e o horário, além de informações sobre alterações e justificativas.
- **Produto:** reúne as informações gerais dos produtos comercializados, como código, descrição, referência, coleção, subcoleção, grupo, categoria, tipo e informações fiscais.
- **Produto_SKU:** representa as variações específicas dos produtos, relacionando características como cor e tamanho e informações de estoque e dimensões.
- **Marca:** representa as marcas comercializadas pela organização.
- **Cor:** representa as cores utilizadas na identificação das variações dos produtos.
- **Tamanho:** representa os tamanhos utilizados nas variações dos produtos.
- **Venda:** representa as vendas realizadas pela organização.
- **Item_Venda:** registra os itens que compõem cada venda, incluindo a identificação do item, a quantidade e o preço unitário de venda.
- **Pagamento:** representa os pagamentos relacionados às vendas, permitindo registrar a forma de pagamento, o valor, o status e as informações da transação.
- **Pedido_Online:** representa os pedidos realizados pelo site, incluindo informações de status, pagamento, rastreamento, envio e entrega.
- **Troca_Devolucao:** registra ocorrências de troca, devolução e cancelamento relacionadas aos pedidos on-line.
- **Movimentacao_Estoque:** registra movimentações de estoque, incluindo tipo, quantidade, data, motivo e documento de referência.
- **Tabela_Preco:** representa as tabelas de preços utilizadas pela organização, considerando características como canal de venda e tipo de cliente.
- **Item_Tabela_Preco:** relaciona os produtos ou suas variações às tabelas de preços, registrando o preço unitário de venda e o período de vigência.
- **Historico_Preco:** registra alterações de preços ao longo do tempo, incluindo preço anterior, preço novo, preço de compra relacionado à reposição e datas de vigência.
- **Fornecedor:** representa os fornecedores cadastrados no sistema.
- **Pedido_Reposicao:** representa os pedidos realizados aos fornecedores para reposição de mercadorias.
- **Item_Reposicao:** registra os produtos ou variações solicitados em cada pedido de reposição, incluindo quantidades solicitadas e recebidas, preço e status do item.
- **Conta_a_Pagar:** representa os compromissos financeiros relacionados às compras, incluindo documento, valor, vencimento, pagamento e status da conta.
- **Backup_Sistema:** registra as execuções das cópias de segurança do banco de dados, incluindo o tipo de backup, as datas de início e término, o local de armazenamento, o tamanho do arquivo e a situação da operação. Quando aplicável, permite identificar o usuário responsável pela execução.
- **Registro_Restauracao:** registra as operações de restauração realizadas a partir de cópias de segurança, armazenando informações como as datas de início e término, o status, o motivo da recuperação, observações, o backup utilizado e o usuário responsável, quando aplicável.

### Atributos e classificações

Os atributos foram definidos para caracterizar as entidades e permitir o registro das informações necessárias aos processos representados no modelo.

A entidade **Produto** concentra os dados gerais de identificação e classificação dos produtos. A entidade **Produto_SKU** representa suas variações específicas, associando características como cor e tamanho. Essa separação evita a repetição das informações gerais do produto para cada variação.

A entidade **Venda** registra as informações gerais de cada venda, enquanto **Item_Venda** identifica os itens comercializados, suas quantidades e seus preços unitários. A entidade **Pagamento** permite registrar os pagamentos associados às vendas, incluindo situações em que são utilizadas diferentes formas de pagamento.

A entidade **Pedido_Online** concentra informações específicas dos pedidos realizados pelo site, como status, confirmação, rastreamento, envio e entrega. O pedido é relacionado à venda correspondente, permitindo associar os dados de atendimento on-line aos registros comerciais.

Para representar o controle de estoque, a entidade **Movimentacao_Estoque** registra as alterações nas quantidades dos produtos, incluindo o tipo de movimentação, a quantidade movimentada, a data, o motivo e o documento de referência.

O controle de preços é representado pelas entidades **Tabela_Preco**, **Item_Tabela_Preco** e **Historico_Preco**. A tabela identifica as condições comerciais, seus itens relacionam os preços aos produtos ou às variações, e o histórico permite acompanhar as alterações de valores ao longo do tempo.

No processo de reposição, a entidade **Pedido_Reposicao** representa a solicitação feita ao fornecedor, enquanto **Item_Reposicao** detalha os produtos solicitados e as respectivas quantidades. A entidade **Conta_a_Pagar** representa os compromissos financeiros relacionados às compras, permitindo acompanhar valores, vencimentos e pagamentos.

**Usuario_Sistema** e **Log_Auditoria** representam os controles de acesso e o registro das operações realizadas no sistema. Essas entidades permitem estruturar informações relacionadas à identificação dos usuários e à rastreabilidade das ações registradas.

As operações de segurança e recuperação das informações são representadas pelas entidades **Backup_Sistema** e **Registro_Restauracao**. A primeira registra as execuções das cópias de segurança, incluindo informações sobre o tipo, o período de execução, o local de armazenamento e o resultado. A segunda registra as operações de restauração, identificando o backup utilizado, o motivo da recuperação, o período da operação e seu resultado. Essa separação permite acompanhar tanto a realização das cópias de segurança quanto as recuperações efetuadas a partir delas.

### Relacionamentos relevantes

Os principais relacionamentos representados no modelo são:

- Departamento possui funcionários.
- Funcionário pode estar associado a um usuário do sistema.
- Usuário_Sistema gera registros em Log_Auditoria.
- Marca possui produtos.
- Produto possui variações em Produto_SKU.
- Cor e Tamanho são associados às variações de Produto_SKU.
- Cliente está associado às vendas.
- Funcionário registra vendas.
- Venda possui itens em Item_Venda.
- Item_Venda está associado a um Produto_SKU, identificando a variação comercializada em cada item da venda.
- Venda possui registros de Pagamento.
- Cliente realiza pedidos on-line.
- Pedido_Online gera ou está associado à venda correspondente.
- Pedido_Online possui ocorrências registradas em Troca_Devolucao.
- Produto_SKU está relacionado às movimentações registradas em Movimentacao_Estoque.
- Tabela_Preco possui itens em Item_Tabela_Preco.
-Item_Tabela_Preco está associado a um Produto_SKU, relacionando cada variação à tabela de preços correspondente.
- Produto_SKU possui registros em Historico_Preco.
- Tabela_Preco pode estar relacionada aos registros de Historico_Preco.
- Fornecedor recebe pedidos de reposição.
- Pedido_Reposicao possui itens em Item_Reposicao.
- Item_Reposicao identifica os produtos ou as variações solicitadas para reposição.
- Pedido_Reposicao está relacionado aos compromissos financeiros registrados em Conta_a_Pagar, conforme a operação representada no modelo.
- Usuário_Sistema pode estar associado à execução de Backup_Sistema, quando houver um usuário responsável.
- Backup_Sistema pode ser utilizado em diferentes registros de Registro_Restauracao.
- Registro_Restauracao está associado a um único Backup_Sistema.
- Usuário_Sistema pode estar associado à realização de Registro_Restauracao, quando houver um usuário responsável.

As cardinalidades são representadas no Diagrama Entidade-Relacionamento (DER), de acordo com as relações definidas entre as entidades.

<br><br>
---

### 8. DER Diagrama Entidade-Relacionamento 

O **Diagrama Entidade-Relacionamento (DER)** foi elaborado utilizando a ferramenta **brModelo**, com base nas entidades, nos atributos e nos relacionamentos identificados durante o levantamento de requisitos da organização. O diagrama representa graficamente a estrutura conceitual do banco de dados proposto para a ANSARAH.


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

### 9. Conversão do Modelo Conceitual para o Modelo Lógico

A conversão do Modelo Entidade-Relacionamento (MER) conceitual da Ansarah para o modelo lógico relacional foi realizada considerando as entidades, os atributos, os relacionamentos e as cardinalidades definidos no DER revisado. O objetivo foi organizar as informações em tabelas relacionadas entre si, estabelecendo identificadores e campos destinados a representar as referências entre as entidades, preparando a estrutura para a implementação no MySQL.

#### 9.1 Entidades convertidas em tabelas

Cada entidade identificada no modelo conceitual foi representada por uma tabela no modelo lógico. Ao todo, foram definidas 25 tabelas, organizadas conforme os principais processos da organização:

- **FORNECEDOR:** armazena os dados cadastrais dos fornecedores.
- **DEPARTAMENTO e FUNCIONARIO:** representam os departamentos e os funcionários associados a eles.
- **CLIENTE:** armazena os dados cadastrais dos clientes, incluindo a classificação entre B2C e B2B.
- **MARCA, COR e TAMANHO:** armazenam informações utilizadas na identificação e caracterização dos produtos.
- **PRODUTO e PRODUTO_SKU:** organizam os dados gerais dos produtos e suas variações, considerando características como cor e tamanho, além do código SKU e da quantidade em estoque.
- **VENDA e ITEM_VENDA:** registram as vendas realizadas e detalham os SKUs comercializados, suas quantidades e preços unitários.
- **PAGAMENTO:** armazena os dados dos pagamentos relacionados às vendas.
- **PEDIDO_ONLINE e TROCA_DEVOLUCAO:** representam os pedidos realizados pelo canal on-line e as ocorrências de troca e devolução associadas a eles.
- **PEDIDO_REPOSICAO e ITEM_REPOSICAO:** registram os pedidos realizados aos fornecedores e detalham os SKUs, as quantidades solicitadas e recebidas, os preços e os descontos dos itens.
- **MOVIMENTACAO_ESTOQUE:** registra as entradas e saídas de estoque, identificando o SKU, a quantidade movimentada, o motivo e o funcionário responsável.
- **TABELA_PRECO e ITEM_TABELA_PRECO:** representam as tabelas comerciais e os preços associados aos SKUs, considerando seus períodos de vigência.
- **HISTORICO_PRECO:** registra as alterações de preços, incluindo valores anteriores, novos valores e preço de compra relacionado à reposição.
- **CONTA_A_PAGAR:** armazena as obrigações financeiras relacionadas aos pedidos de reposição.
- **USUARIO_SISTEMA e LOG_AUDITORIA:** representam os usuários do sistema e os registros das operações realizadas, permitindo o acompanhamento e a rastreabilidade das ações.
- **BACKUP_SISTEMA e REGISTRO_RESTAURACAO:** registram as execuções de backup e as operações de restauração, incluindo informações sobre datas, status, responsáveis e cópias utilizadas.

As tabelas relacionadas ao controle de usuários, auditoria, backup e restauração representam estruturas propostas para o modelo acadêmico, destinadas a atender aos requisitos identificados no levantamento.

#### 9.2 Conversão de atributos em colunas

Os atributos definidos para cada entidade foram convertidos em colunas das respectivas tabelas. Para cada coluna, foram definidos tipos de dados compatíveis com a informação armazenada, considerando as necessidades do sistema e as restrições de integridade.

Os identificadores das entidades foram representados por chaves primárias (PK), geralmente utilizando campos numéricos inteiros com incremento automático. Os demais atributos foram definidos conforme sua finalidade, utilizando tipos adequados para textos, datas, valores monetários, quantidades e indicadores de situação.

Por exemplo, a tabela `CLIENTE` contém atributos para identificação e cadastro, além do campo `tipo_cliente`, que permite diferenciar clientes B2C e B2B. Já a tabela `ITEM_VENDA` armazena a quantidade comercializada, o preço unitário e as referências à venda e ao SKU correspondente.

A tabela `PRODUTO` concentra as informações gerais do produto, enquanto `PRODUTO_SKU` representa suas variações comercializáveis, permitindo controlar características específicas e a quantidade disponível em estoque.

A definição dos tipos de dados e das restrições específicas de cada coluna está detalhada no modelo lógico e no dicionário de dados.

#### 9.3 Conversão dos relacionamentos em chaves estrangeiras

Os relacionamentos do modelo conceitual foram representados no modelo lógico por meio de campos destinados a funcionar como chaves estrangeiras (FK), respeitando a estrutura das entidades relacionadas.

Nos relacionamentos em que uma entidade se associa a várias ocorrências de outra entidade, a referência à chave primária da entidade principal é armazenada na tabela correspondente ao lado N.

Alguns exemplos dessa estrutura são:

- `FUNCIONARIO` possui o campo `id_departamento`, que referencia `DEPARTAMENTO`.
- `PRODUTO` possui o campo `id_marca`, que referencia `MARCA`.
- `PRODUTO_SKU` possui os campos `id_produto`, `id_cor` e `id_tamanho`, permitindo identificar o produto e suas características.
- `ITEM_VENDA` possui os campos `id_venda` e `id_sku`, relacionando cada item à venda e à variação comercializada.
- `PAGAMENTO` possui o campo `id_venda`, relacionando os pagamentos às vendas correspondentes.
- `PEDIDO_ONLINE` possui os campos `id_cliente` e `id_venda`, relacionando o pedido ao cliente e à venda correspondente.
- `TROCA_DEVOLUCAO` possui o campo `id_pedido`, relacionando cada ocorrência ao pedido on-line.
- `ITEM_REPOSICAO` possui os campos `id_reposicao` e `id_sku`, identificando o pedido e o produto solicitado.
- `MOVIMENTACAO_ESTOQUE` possui os campos `id_sku`, `id_item_reposicao` e `id_funcionario`, permitindo relacionar a movimentação ao SKU, ao item de reposição, quando aplicável, e ao funcionário responsável.
- `ITEM_TABELA_PRECO` possui os campos `id_tabela_preco` e `id_sku`, relacionando os preços às tabelas comerciais e às variações dos produtos.
- `HISTORICO_PRECO` possui os campos `id_sku` e `id_tabela_preco`, permitindo identificar a variação e a tabela de preços relacionadas às alterações registradas.
- `CONTA_A_PAGAR` possui o campo `id_reposicao`, relacionando a obrigação financeira ao pedido de reposição.
- `USUARIO_SISTEMA` possui o campo `id_funcionario`, associando o usuário ao funcionário correspondente.
- `LOG_AUDITORIA` possui o campo `id_usuario`, identificando o usuário responsável pela operação registrada.
- `BACKUP_SISTEMA` possui o campo `id_usuario`, permitindo identificar o usuário responsável pelo backup, quando aplicável.
- `REGISTRO_RESTAURACAO` possui os campos `id_backup` e `id_usuario`, identificando a cópia utilizada e o usuário responsável pela restauração.

Esses campos permitem representar os relacionamentos entre as tabelas e estabelecer a integridade referencial por meio das restrições de chaves estrangeiras.

#### 9.4 Tratamento das cardinalidades

As cardinalidades representadas no DER foram consideradas na organização do modelo lógico, utilizando referências entre tabelas e tabelas associativas para representar os relacionamentos entre as entidades.

**Relacionamentos 1:N — um para muitos**

Nos relacionamentos 1:N, a referência à chave primária da entidade do lado 1 é armazenada como chave estrangeira na tabela do lado N.

Como exemplo, um departamento pode possuir vários funcionários, enquanto cada funcionário está associado a um departamento. Por isso, a tabela `FUNCIONARIO` contém o campo `id_departamento`.

Outro exemplo é o relacionamento entre `VENDA` e `ITEM_VENDA`: uma venda pode possuir vários itens, enquanto cada item pertence a uma venda. Essa associação é representada pelo campo `id_venda` em `ITEM_VENDA`.

Também se aplica ao relacionamento entre `BACKUP_SISTEMA` e `REGISTRO_RESTAURACAO`: um backup pode ser utilizado em diferentes operações de restauração, enquanto cada registro de restauração referencia um backup.

**Relacionamentos N:N — muitos para muitos**

Nos relacionamentos N:N, foi utilizada uma tabela associativa para representar a relação entre as entidades. Essa estrutura permite que cada registro de uma entidade esteja relacionado a vários registros da outra, armazenando também informações específicas do relacionamento.

No modelo da Ansarah, destacam-se:

- **VENDA e PRODUTO_SKU:** relacionados por meio de `ITEM_VENDA`, que armazena a quantidade e o preço unitário de cada SKU comercializado.
- **PEDIDO_REPOSICAO e PRODUTO_SKU:** relacionados por meio de `ITEM_REPOSICAO`, que registra as quantidades solicitadas e recebidas, os preços e os descontos dos itens.
- **TABELA_PRECO e PRODUTO_SKU:** relacionados por meio de `ITEM_TABELA_PRECO`, que registra o preço unitário e o período de vigência de cada SKU na tabela correspondente.

O uso dessas tabelas associativas permite detalhar os dados próprios de cada relacionamento e evita a necessidade de armazenar múltiplos valores em uma única coluna.

#### 9.5 Generalização e especialização

O atributo `tipo_cliente` foi utilizado para diferenciar os clientes B2C e B2B. Essa classificação foi representada diretamente na tabela `CLIENTE`, sem a criação de tabelas especializadas separadas.

Essa escolha permite manter os dados cadastrais comuns em uma única tabela e identificar o tipo de relacionamento comercial por meio do atributo correspondente.

Não foi adotada uma estrutura de generalização ou especialização com entidades e tabelas próprias para cada subtipo, pois o modelo proposto não exige, neste momento, atributos exclusivos suficientes para justificar essa separação.

#### Considerações finais

A conversão do modelo conceitual para o modelo lógico permitiu organizar os dados da Ansarah em 25 tabelas, com identificadores e campos de relacionamento destinados a representar as associações entre as entidades.

A estrutura resultante prepara o banco de dados para a implementação no MySQL, a inserção de dados, a execução de consultas e a elaboração de relatórios gerenciais relacionados aos processos de vendas, estoque, preços, reposição, controle de acesso e segurança das informações.

As restrições de integridade referencial, incluindo as chaves estrangeiras, devem ser definidas na implementação SQL para garantir que os relacionamentos sejam efetivamente validados pelo banco de dados.


> **O modelo lógico desenvolvido a partir do modelo conceitual está disponível no repositório do GitHub, junto aos demais arquivos do projeto.**

<BR><BR>
---

## 10. Dicionário de Dados

O **Dicionário de Dados** foi elaborado para documentar a estrutura do banco de dados da Ansarah, apresentando as tabelas, seus atributos, tipos de dados, chaves primárias (PK), campos de relacionamento (FK), restrições e descrições de cada informação armazenada.

O arquivo do Dicionário de Dados está disponível no repositório do projeto, junto aos demais documentos.

> **Arquivo do Dicionário de Dados: `dicionario.html`.**

---

## 11. Definição de Chaves Primárias e Estrangeiras

As chaves primárias (PK) identificam exclusivamente cada registro das tabelas. Os campos indicados como chaves estrangeiras (FK) representam as referências entre as tabelas, permitindo estabelecer os relacionamentos definidos no modelo lógico.

| Entidade | Chave Primária (PK) | Campos de relacionamento (FK) |
|---|---|---|
| Fornecedor | id_fornecedor | — |
| Departamento | id_departamento | — |
| Funcionario | id_funcionario | id_departamento → Departamento |
| Cliente | id_cliente | — |
| Marca | id_marca | — |
| Cor | id_cor | — |
| Tamanho | id_tamanho | — |
| Produto | id_produto | id_marca → Marca |
| Produto_SKU | id_sku | id_cor → Cor; id_tamanho → Tamanho; id_produto → Produto |
| Venda | id_venda | id_cliente → Cliente; id_funcionario → Funcionario |
| Item_venda | id_item_venda | id_sku → Produto_SKU; id_venda → Venda |
| Pagamento | id_pagamento | id_venda → Venda |
| Pedido_online | id_pedido | id_cliente → Cliente; id_venda → Venda |
| Troca_devolucao | id_ocorrencia | id_pedido → Pedido_online |
| Pedido_reposicao | id_reposicao | id_fornecedor → Fornecedor |
| Item_reposicao | id_item_reposicao | id_reposicao → Pedido_reposicao; id_sku → Produto_SKU |
| Movimentacao_estoque | id_movimentacao | id_sku → Produto_SKU; id_item_reposicao → Item_reposicao; id_funcionario → Funcionario |
| Tabela_preco | id_tabela_preco | — |
| Item_tabela_preco | id_item_tabela_preco | id_tabela_preco → Tabela_preco; id_sku → Produto_SKU |
| Historico_preco | id_historico_preco | id_sku → Produto_SKU; id_tabela_preco → Tabela_preco |
| Conta_a_pagar | id_conta_pagar | id_reposicao → Pedido_reposicao |
| Usuario_sistema | id_usuario | id_funcionario → Funcionario |
| LOG_AUDITORIA | id_log | id_usuario → Usuario_sistema |
| BACKUP_SISTEMA | id_backup | id_usuario → Usuario_sistema |
| REGISTRO_RESTAURACAO | id_restauracao | id_backup → BACKUP_SISTEMA; id_usuario → Usuario_sistema |

**Observação:** Os campos apresentados como FK representam as referências definidas na estrutura lógica do banco. Para que sejam efetivamente aplicados como restrições de integridade referencial no MySQL, devem ser declarados por meio de `FOREIGN KEY` no script SQL. O campo `id_usuario` de `BACKUP_SISTEMA` permite valor nulo, pois a execução de backups pode ocorrer automaticamente, sem a atuação direta de um usuário.
<BR><BR>
---
### 12. Processo de Normalização

O processo de normalização foi realizado com o objetivo de organizar as tabelas do banco de dados, reduzir a redundância de informações e evitar inconsistências durante as operações de cadastro, venda, reposição e controle de estoque.

**Primeira Forma Normal (1FN)**

Foi verificado se os atributos das tabelas armazenavam valores atômicos, ou seja, se cada campo representava uma única informação, sem listas ou conjuntos de valores em uma mesma coluna.

Também foi analisada a organização dos produtos e suas variações. A tabela `PRODUTO` armazena as informações gerais dos produtos, enquanto `PRODUTO_SKU` identifica cada variação individualmente, relacionando o produto às características de cor e tamanho. Cada variação possui um identificador próprio e um código SKU único.

**Segunda Forma Normal (2FN)**

Foi verificada a existência de dependências parciais, nas quais um atributo não chave depende apenas de parte de uma chave primária composta.

Como as tabelas do modelo utilizam chaves primárias simples, formadas por apenas um atributo, não foram identificadas dependências parciais em relação às chaves primárias utilizadas. Dessa forma, considerando o atendimento à Primeira Forma Normal, as tabelas atendem ao critério de ausência de dependências parciais da Segunda Forma Normal.

**Terceira Forma Normal (3FN)**

Foi analisada a existência de dependências transitivas e informações redundantes que poderiam ser obtidas por meio dos relacionamentos entre as tabelas.

Durante essa análise, foram realizadas as seguintes alterações:

- Remoção do atributo `nome_item_venda` da tabela `ITEM_VENDA`, pois a descrição do produto pode ser obtida por meio do relacionamento com `PRODUTO_SKU` e, posteriormente, com `PRODUTO`.
- Remoção do atributo `nome_item_reposicao` da tabela `ITEM_REPOSICAO`, pelo mesmo motivo: a descrição do produto pode ser consultada por meio do SKU relacionado.

Com essas alterações, as informações gerais dos produtos permanecem centralizadas na tabela `PRODUTO`, evitando a repetição de descrições nas tabelas de venda e reposição.

Também foi considerada a necessidade de manter a consistência entre informações relacionadas, como o status de pagamento dos pedidos on-line e os registros da tabela `PAGAMENTO`, além do saldo de estoque e suas respectivas movimentações.

Dessa forma, o processo de normalização contribui para a integridade dos dados, facilita a manutenção das informações e reduz a possibilidade de inconsistências no banco de dados.

### Justificativa do processo de normalização

A normalização foi necessária para organizar as informações do banco de dados, evitar a duplicidade de registros e garantir maior consistência durante as operações da empresa.

- **Primeira Forma Normal (1FN):** garante que cada campo armazene uma única informação, facilitando o cadastro, a consulta e a atualização dos dados. No projeto, também contribuiu para organizar os produtos e suas variações de cor e tamanho por meio da tabela `PRODUTO_SKU`.

- **Segunda Forma Normal (2FN):** verifica se os atributos dependem integralmente de suas respectivas chaves primárias, evitando informações associadas apenas a parte de uma chave composta. No modelo, não foram identificadas dependências parciais em relação às chaves primárias simples utilizadas.

- **Terceira Forma Normal (3FN):** contribui para reduzir a repetição de informações e evitar dependências desnecessárias entre atributos. No projeto, isso foi aplicado à remoção dos atributos `nome_item_venda` e `nome_item_reposicao`, pois as descrições dos produtos já estão armazenadas na tabela `PRODUTO` e podem ser consultadas por meio dos relacionamentos com `PRODUTO_SKU`.

Assim, a normalização permite manter as informações mais organizadas, facilita sua manutenção e reduz possíveis inconsistências nos registros do banco de dados.
<br> <br>
--


## 13. Justificativa Técnica do Modelo

A modelagem conceitual foi desenvolvida com o objetivo de representar os principais processos identificados no levantamento de informações da Ansarah, contemplando cadastro de produtos, vendas, estoque, preços, pedidos on-line, reposição de mercadorias, pagamentos, controle financeiro, acesso ao sistema e segurança das informações.

A entidade **PRODUTO** concentra as informações gerais dos produtos comercializados, enquanto **PRODUTO_SKU** representa suas variações comercializáveis. As entidades **COR** e **TAMANHO** foram separadas para permitir o reaproveitamento dessas informações em diferentes produtos. Essa organização possibilita identificar individualmente as variações por SKU e controlar suas respectivas quantidades em estoque.

As entidades **VENDA** e **ITEM_VENDA** foram separadas para distinguir as informações gerais da operação comercial dos produtos que a compõem. Essa estrutura permite registrar vários itens em uma mesma venda, com suas respectivas quantidades e preços unitários. A entidade **PAGAMENTO** complementa esse processo ao armazenar os pagamentos associados às vendas, permitindo representar operações com diferentes formas de pagamento e registros de pagamento vinculados a uma mesma venda.

A entidade **PEDIDO_ONLINE** representa as informações específicas das compras realizadas pelo site, incluindo status, rastreamento, envio e entrega. Seu relacionamento com **VENDA** permite associar o pedido à operação comercial correspondente. Já **TROCA_DEVOLUCAO** registra as ocorrências relacionadas aos pedidos on-line, incluindo motivo, situação, data e eventual valor de estorno, quando aplicável.

Para representar o controle de estoque, foi incluída a entidade **MOVIMENTACAO_ESTOQUE**, responsável por registrar as alterações nas quantidades dos produtos, incluindo tipo, quantidade, data, motivo e funcionário responsável pela operação. Essa estrutura permite consultar o histórico de movimentações e apoiar a análise das entradas, saídas e possíveis divergências de estoque. A quantidade disponível também é armazenada em **PRODUTO_SKU**, permitindo relacionar o saldo atual às variações específicas dos produtos.

O controle comercial de preços foi representado pelas entidades **TABELA_PRECO**, **ITEM_TABELA_PRECO** e **HISTORICO_PRECO**. Essa divisão permite organizar as tabelas comerciais, associar preços aos SKUs e preservar os registros das alterações realizadas ao longo do tempo. O histórico contempla informações como preço anterior, preço novo e preço de compra relacionado à reposição, permitindo acompanhar as alterações comerciais.

As entidades **FORNECEDOR**, **PEDIDO_REPOSICAO** e **ITEM_REPOSICAO** representam o processo de reposição de mercadorias. O pedido identifica a solicitação realizada ao fornecedor, enquanto seus itens detalham os SKUs solicitados, as quantidades, os valores e as informações de recebimento. Essa estrutura permite representar pedidos com vários produtos e acompanhar entregas parciais.

A entidade **CONTA_A_PAGAR** representa os compromissos financeiros relacionados às operações de compra, incluindo documentos, valores, vencimentos, situação e informações de pagamento. Sua relação com **PEDIDO_REPOSICAO** permite associar as obrigações financeiras aos pedidos correspondentes.

Para representar a organização interna, a entidade **FUNCIONARIO** foi relacionada à entidade **DEPARTAMENTO**, permitindo identificar o setor ao qual cada funcionário está associado. As entidades **USUARIO_SISTEMA** e **LOG_AUDITORIA** foram propostas para representar o controle de acesso e a rastreabilidade das operações realizadas no sistema, contribuindo para a identificação dos usuários e o registro das ações relevantes.

Também foram incluídas as entidades **BACKUP_SISTEMA** e **REGISTRO_RESTAURACAO**, como propostas para o modelo acadêmico, com o objetivo de representar o controle das execuções de backup e das operações de restauração. A primeira permite registrar informações sobre as cópias de segurança realizadas, enquanto a segunda mantém o histórico das restaurações, identificando a cópia utilizada, o responsável e o resultado da operação. Essa estrutura busca contribuir para a organização do processo de recuperação das informações e para a rastreabilidade das operações.

De modo geral, a estrutura proposta busca organizar as informações de acordo com os processos identificados, reduzir a duplicidade de dados e estabelecer uma base consistente para consultas e análises gerenciais. As entidades e os relacionamentos representam uma proposta acadêmica de modelagem, sujeita à validação e aos ajustes necessários conforme as regras de negócio e os requisitos identificados durante o levantamento.

---
## 14. Justificativa das Decisões de Modelagem e das Restrições de Integridade

As decisões técnicas do modelo foram definidas para garantir a identificação dos registros, estabelecer os relacionamentos entre as entidades e reduzir inconsistências no armazenamento das informações.

### 14.1 Chaves primárias

As chaves primárias (PK) foram definidas para identificar exclusivamente os registros de cada tabela. Foram utilizados identificadores próprios, como `id_produto`, `id_cliente`, `id_venda`, `id_sku` e `id_fornecedor`, evitando a dependência de atributos descritivos, como nomes, para identificar os registros.

Nas tabelas que representam itens de processos, como `ITEM_VENDA`, `ITEM_REPOSICAO` e `ITEM_TABELA_PRECO`, os identificadores próprios permitem distinguir cada item individualmente, mesmo quando vários itens pertencem à mesma venda, pedido de reposição ou tabela de preços.

### 14.2 Chaves estrangeiras e relacionamentos

Os campos destinados a funcionar como chaves estrangeiras (FK) estabelecem referências entre as tabelas e permitem associar os registros correspondentes aos processos representados no modelo.

**Cadastro de produtos:** `PRODUTO` relaciona-se com `MARCA`, enquanto `PRODUTO_SKU` relaciona-se com `PRODUTO`, `COR` e `TAMANHO`. Essa estrutura permite associar cada variação ao produto correspondente e às suas características comerciais.

**Vendas e pagamentos:** `VENDA` relaciona-se com `CLIENTE` e `FUNCIONARIO`, quando essas associações forem aplicáveis. `ITEM_VENDA` relaciona-se com `VENDA` e `PRODUTO_SKU`, permitindo identificar os produtos comercializados, suas quantidades e seus preços unitários. `PAGAMENTO` relaciona-se com `VENDA`, possibilitando registrar separadamente os pagamentos associados a uma mesma operação.

**Pedidos on-line e ocorrências:** `PEDIDO_ONLINE` relaciona-se com `CLIENTE` e `VENDA`. `TROCA_DEVOLUCAO` relaciona-se com `PEDIDO_ONLINE`, permitindo associar cada ocorrência ao pedido correspondente.

**Reposição de mercadorias:** `PEDIDO_REPOSICAO` relaciona-se com `FORNECEDOR`. `ITEM_REPOSICAO` relaciona-se com `PEDIDO_REPOSICAO` e `PRODUTO_SKU`, permitindo detalhar os produtos solicitados e as quantidades recebidas.

**Movimentação de estoque:** `MOVIMENTACAO_ESTOQUE` relaciona-se com `PRODUTO_SKU` e `FUNCIONARIO`. Também pode relacionar-se com `ITEM_REPOSICAO`, quando a movimentação estiver associada ao recebimento de um item de reposição.

**Controle de preços:** `ITEM_TABELA_PRECO` relaciona-se com `TABELA_PRECO` e `PRODUTO_SKU`. `HISTORICO_PRECO` relaciona-se com `PRODUTO_SKU` e `TABELA_PRECO`, permitindo registrar as alterações dos preços associados aos produtos e às respectivas tabelas comerciais.

**Controle financeiro:** `CONTA_A_PAGAR` relaciona-se com `PEDIDO_REPOSICAO` por meio de `id_reposicao`. Dessa forma, as informações do fornecedor podem ser consultadas pelo relacionamento entre `PEDIDO_REPOSICAO` e `FORNECEDOR`, sem a necessidade de duplicar sua identificação em `CONTA_A_PAGAR`.

**Funcionários e auditoria:** `FUNCIONARIO` relaciona-se com `DEPARTAMENTO`; `USUARIO_SISTEMA` relaciona-se com `FUNCIONARIO`; e `LOG_AUDITORIA` relaciona-se com `USUARIO_SISTEMA`. Esses relacionamentos permitem representar a associação entre funcionários, contas de acesso e registros de auditoria.

**Backup e restauração:** `BACKUP_SISTEMA` relaciona-se com `USUARIO_SISTEMA`, permitindo identificar o usuário responsável pela execução do backup, quando aplicável. `REGISTRO_RESTAURACAO` relaciona-se com `BACKUP_SISTEMA` e `USUARIO_SISTEMA`, identificando a cópia utilizada e o responsável pela operação de restauração.

### 14.3 Restrições de integridade

As restrições de integridade foram consideradas para controlar os valores armazenados e evitar inconsistências nos registros.

- **PRIMARY KEY (PK):** identifica exclusivamente cada registro de uma tabela.
- **FOREIGN KEY (FK):** estabelece referências entre tabelas e impede que sejam inseridos valores que não correspondam a registros existentes na tabela referenciada, quando a restrição está implementada no banco.
- **NOT NULL (NN):** impede que atributos definidos como obrigatórios sejam armazenados sem valor.
- **UNIQUE (UQ):** impede a duplicidade dos valores abrangidos pela restrição, conforme sua definição no banco de dados. No projeto, essa restrição foi aplicada ao atributo `codigo_sku` da tabela `PRODUTO_SKU`.
- **CHECK:** limita os valores permitidos em determinados atributos. No projeto, foi utilizado na tabela `CLIENTE` para restringir o atributo `tipo_cliente` às classificações `B2C` e `B2B`.
- **AUTO_INCREMENT:** permite gerar identificadores automaticamente nas tabelas em que esse mecanismo foi definido.

A aplicação dessas restrições deve corresponder às definições presentes no script SQL e no Dicionário de Dados, garantindo consistência entre a documentação e a implementação relacional.

### 14.4 Relação com as regras de negócio

As decisões de modelagem foram relacionadas às regras de negócio levantadas durante o estudo da organização.

No cadastro de produtos, a separação entre `PRODUTO` e `PRODUTO_SKU` está relacionada às RN01, RN02 e RN03, que tratam do cadastro e da identificação das variações comercializáveis.

Nos processos de venda e pagamento, a estrutura de `VENDA`, `ITEM_VENDA` e `PAGAMENTO` apoia a representação das operações comerciais e das diferentes formas de pagamento, conforme as RN04, RN05 e RN25.

O controle de pedidos on-line, trocas e devoluções está relacionado às RN06, RN07, RN08 e RN33. Já o controle de estoque e reposição está associado às RN10, RN11, RN12, RN15, RN16, RN17 e RN26, que tratam da disponibilidade dos produtos, das necessidades de reposição, das conferências de recebimento e do registro das movimentações.

A estrutura de contas a pagar está relacionada às RN19, RN21 e RN22, que abordam o registro das obrigações financeiras, a confirmação dos pagamentos e a consulta das contas por situação.

As entidades de acesso e auditoria foram propostas para apoiar as RN27, RN28, RN29 e RN32, relacionadas à individualização dos acessos, às permissões, ao rastreamento das operações e à proteção dos dados.

Por fim, as entidades `BACKUP_SISTEMA` e `REGISTRO_RESTAURACAO` foram incluídas para representar as propostas relacionadas às RN34, RN35 e RN36, que tratam da execução e do registro dos backups, do histórico das restaurações e do vínculo entre as cópias de segurança e as operações de recuperação.

A relação entre as entidades e as regras de negócio deve ser interpretada conforme o que está efetivamente representado no DER, no Dicionário de Dados e no script SQL. A existência de uma regra de negócio no levantamento não significa, por si só, que todos os mecanismos necessários para atendê-la já estejam implementados.

### 14.5 Decisões para evitar redundância

A separação entre `PRODUTO` e `PRODUTO_SKU` evita misturar as informações gerais dos produtos com os dados específicos de suas variações. Assim, o nome e a descrição do produto podem ser consultados por meio do relacionamento com o SKU, sem a necessidade de repetir essas informações em cada variação.

Pelo mesmo motivo, os atributos `nome_item_venda` e `nome_item_reposicao` não foram mantidos em `ITEM_VENDA` e `ITEM_REPOSICAO`, pois o nome do produto pode ser obtido pelo relacionamento entre essas tabelas, `PRODUTO_SKU` e `PRODUTO`.

O atributo `preco_unitario_venda` foi mantido em `ITEM_VENDA` porque representa o preço efetivamente praticado na operação comercial. Esse valor pode ser diferente do preço atualmente cadastrado e, portanto, precisa ser preservado para manter o histórico financeiro da venda.

A separação entre `VENDA` e `PAGAMENTO` permite representar diferentes registros de pagamento associados a uma mesma venda. Da mesma maneira, a separação entre `PEDIDO_REPOSICAO` e `ITEM_REPOSICAO` permite registrar individualmente os produtos solicitados e recebidos, incluindo situações de entrega parcial.

Por fim, `USUARIO_SISTEMA`, `LOG_AUDITORIA`, `BACKUP_SISTEMA` e `REGISTRO_RESTAURACAO` foram propostas como entidades para representar o controle de acesso, a rastreabilidade das operações e o gerenciamento de cópias de segurança e restaurações no modelo acadêmico. Sua inclusão não significa que essas entidades correspondam à estrutura interna do ERP utilizado pela Ansarah, mas que representam uma proposta de organização dessas informações no banco de dados desenvolvido para o projeto.

---
# 15. Proposta de Arquitetura Analítica para BI e IA — ANSARAH

## 15.1 Informações estratégicas para a gestão

A estrutura do banco de dados da ANSARAH foi desenvolvida para organizar e relacionar informações de produtos, vendas, clientes, estoque, fornecedores e pedidos de reposição.

A partir dessas informações, é possível utilizar ferramentas de Business Intelligence (BI) para transformar os registros operacionais em relatórios e indicadores que auxiliem a tomada de decisões.

As principais informações estratégicas que podem ser obtidas são:

- **Gestão de produtos:** identificação de cadastros incompletos, quantidade de variações por produto e organização dos SKUs.
- **Desempenho comercial:** acompanhamento do faturamento mensal, ticket médio, produtos mais vendidos e resultados por canal de venda.
- **Controle de estoque:** identificação de produtos com baixa disponibilidade, acompanhamento das movimentações e necessidades de reposição.
- **Gestão de fornecedores:** acompanhamento de pedidos de reposição, quantidades solicitadas, recebidas e pendentes.
- **Gestão financeira:** acompanhamento de contas a pagar, valores recebidos por forma de pagamento e situações das obrigações financeiras.
- **Auditoria e segurança:** acompanhamento das alterações registradas no sistema por meio da auditoria e consulta ao histórico das operações de backup e restauração, utilizando as entidades específicas propostas para essa finalidade.

Essas informações podem apoiar decisões sobre compras, vendas, organização dos cadastros, disponibilidade de mercadorias, planejamento financeiro e segurança dos dados.

## 15.2 Indicadores e métricas gerenciais (KPIs)

Os KPIs propostos foram selecionados considerando os dados disponíveis no modelo relacional da ANSARAH e as necessidades identificadas durante o levantamento da organização.

| KPI | Fórmula de cálculo | Período | Objetivo |
|---|---|---|---|
| K01 — Percentual de cadastros incompletos | (Produtos que não atendem aos critérios definidos de preenchimento ÷ total de produtos) × 100 | Mensal, sobre a base atual | Monitorar a qualidade dos cadastros |
| K02 — Faturamento mensal | Soma dos valores dos itens das vendas concluídas, descontando os descontos aplicáveis | Mensal | Acompanhar o desempenho financeiro das vendas |
| K03 — Ticket médio | Faturamento das vendas concluídas ÷ quantidade de vendas concluídas | Mensal | Identificar o valor médio por venda |
| K04 — Faturamento por canal | Soma do faturamento das vendas concluídas, agrupada pelo canal de venda | Mensal | Comparar os resultados dos canais de venda |
| K05 — Percentual de SKUs com estoque baixo | (SKUs com estoque de até 15 unidades ÷ total de SKUs) × 100 | Diário | Identificar riscos de indisponibilidade |
| K06 — Quantidade pendente de reposição | Soma das quantidades solicitadas ainda não recebidas nos itens de reposição pendentes | Semanal | Acompanhar as necessidades de abastecimento |

O limite de 15 unidades utilizado no indicador K05 é um parâmetro demonstrativo, pois o banco ainda não possui um campo específico para definir o estoque mínimo de cada SKU.

No indicador K01, os critérios de preenchimento consideram os campos definidos como necessários para o cadastro dos produtos, como nome, código, descrição, grupo, categoria, tipo, unidade de tributação e marca. Esses critérios poderão ser ampliados caso a análise também contemple os registros das variações dos produtos.

Para o cálculo do faturamento, serão considerados os registros de vendas concluídas e seus respectivos itens, utilizando os valores unitários e as quantidades comercializadas, além dos descontos aplicáveis registrados na venda. O ticket médio será calculado com base na quantidade de vendas concluídas, e não na quantidade de itens comercializados.

Os indicadores poderão ser calculados por meio de consultas SQL específicas, utilizando os dados armazenados nas tabelas relacionadas. As metas gerenciais deverão ser definidas com base nas necessidades da ANSARAH e em seu histórico de desempenho.

## 15.3 Transformação dos problemas em soluções analíticas

### P1 — Perda de informações e retrabalho após a restauração de backup

**Problema identificado:**

A restauração de uma versão anterior do banco de dados pode ocasionar a perda de informações registradas posteriormente ao backup utilizado. Como consequência, funcionários podem precisar inserir novamente dados que já haviam sido cadastrados, como informações de produtos, gerando retrabalho, aumentando o tempo de recuperação das informações e podendo ocasionar erros ou inconsistências nos registros.

**Solução proposta:**

Adotar uma estratégia de segurança e recuperação de dados, contemplando:

- **Backups automáticos e periódicos:** realização de cópias de segurança em intervalos programados, reduzindo o risco de perda de informações.
- **Armazenamento adicional:** manutenção de cópias em locais separados do servidor principal, reduzindo o risco de perda simultânea.
- **Registro das operações:** utilização das entidades `BACKUP_SISTEMA` e `REGISTRO_RESTAURACAO` para armazenar informações sobre as execuções de backup e as operações de restauração.
- **Recuperação em um ponto específico do tempo:** utilização de backups completos em conjunto com os logs binários do MySQL, quando habilitados e configurados adequadamente, para recuperar alterações realizadas após a última cópia completa.
- **Testes de restauração:** verificação periódica de que os arquivos de backup podem ser utilizados para recuperar o banco de dados.

A entidade `BACKUP_SISTEMA` permitirá registrar informações como o tipo de backup realizado, as datas de início e término, o local de armazenamento, o tamanho do arquivo e a situação da execução. Quando o backup for iniciado manualmente, também poderá ser identificado o usuário responsável. Nos casos de execução automatizada, esse vínculo poderá permanecer sem preenchimento.

A entidade `REGISTRO_RESTAURACAO` permitirá registrar as operações de recuperação, identificando o backup utilizado, as datas da operação, seu resultado, o motivo da restauração e o usuário responsável.

A tabela `LOG_AUDITORIA` existente poderá auxiliar na investigação das alterações realizadas no sistema, mas não substitui os registros técnicos de backup e restauração, pois possui a finalidade de registrar operações realizadas sobre os dados.

Embora seja possível executar backups e restaurações sem criar essas entidades, sua inclusão no modelo permite manter um histórico estruturado dessas operações dentro do banco de dados. Sem elas, seria necessário consultar registros externos para identificar quando os backups foram realizados, se ocorreram falhas e qual cópia foi utilizada em uma restauração.

É importante destacar que essas entidades não armazenam o conteúdo dos arquivos de backup nem executam os procedimentos de cópia e recuperação. Elas armazenam os registros e metadados das operações. A execução dos backups e das restaurações depende de ferramentas e rotinas configuradas no ambiente do sistema.

O BI poderá apresentar relatórios sobre a frequência dos backups, suas situações de execução e o histórico das restaurações, utilizando as informações registradas nas novas entidades. As consultas gerenciais G11 e G12 permitem acompanhar, respectivamente, as execuções de backup e as operações de restauração. As consultas de auditoria A17 a A20 complementam esse acompanhamento, verificando inconsistências, permissões e o período desde o último backup completo.

Como aplicação futura, a Inteligência Artificial poderá auxiliar na identificação de padrões de falhas e anomalias nas operações de backup, desde que exista histórico suficiente para análise.

A implementação das cópias automáticas dependerá de configurações adicionais na infraestrutura ou nas ferramentas de administração do banco de dados. A inclusão das entidades no modelo permite registrar e acompanhar essas operações, mas não executa os backups automaticamente.

### P2 — Dificuldade na geração de relatórios

**Problema identificado:**

A elaboração de relatórios personalizados apresenta dificuldades para a visualização consolidada dos resultados comerciais, dificultando o acompanhamento das informações necessárias à gestão.

**Solução proposta:**

Utilizar consultas SQL para relacionar as tabelas de vendas e itens vendidos, calculando o faturamento mensal, o ticket médio, os resultados por canal de venda e outras informações relevantes para a gestão.

Para esses cálculos, serão considerados os registros de vendas concluídas e seus respectivos itens, utilizando os valores unitários e as quantidades comercializadas, além dos descontos aplicáveis registrados na venda.

Esses dados poderão alimentar dashboards desenvolvidos no Power BI, apresentando o desempenho da loja por período e apoiando decisões comerciais. Os painéis poderão ser configurados para atualizar suas informações periodicamente, conforme a atualização da fonte de dados.

Além disso, a Inteligência Artificial poderá ser utilizada para gerar relatórios textuais a partir dos dados disponíveis, destacando variações nos resultados, tendências de vendas e pontos que mereçam atenção. Dessa forma, a gestão poderá receber não apenas gráficos e indicadores, mas também explicações sobre os resultados apresentados.

Futuramente, técnicas de IA poderão analisar o histórico de vendas para identificar tendências e estimar a demanda por determinados produtos. A geração automática desses relatórios dependerá da integração dos dados com uma ferramenta ou solução de IA e da configuração das análises que deverão ser realizadas.

### P3 — Controle da disponibilidade de produtos

**Problema identificado:**

A falta de acompanhamento adequado das quantidades disponíveis pode dificultar a reposição e comprometer o atendimento dos pedidos realizados pelos clientes. Quando a quantidade solicitada é superior ao estoque disponível, a finalização da venda pode ocasionar dificuldades para atender ao pedido dentro do prazo esperado.

**Solução proposta:**

Utilizar os dados de estoque por SKU, movimentações e pedidos de reposição para identificar produtos com baixa disponibilidade e quantidades pendentes de recebimento.

Além do acompanhamento do estoque, propõe-se implementar uma regra de validação no processo de finalização das vendas, contemplando as seguintes etapas:

1. O cliente seleciona o produto e informa a quantidade desejada.
2. O sistema consulta a quantidade disponível em estoque para aquele SKU.
3. Caso a quantidade solicitada seja superior à disponível, o sistema apresenta um alerta informando a indisponibilidade e orientando o cliente a reduzir a quantidade.
4. Caso a quantidade solicitada esteja disponível, o cliente poderá prosseguir com a finalização da compra.

Por exemplo, se existem três unidades de determinado SKU em estoque e o cliente tenta comprar cinco, o sistema deverá apresentar uma mensagem informando que há somente três unidades disponíveis. O cliente poderá reduzir a quantidade para três ou menos para continuar a compra. A venda não deverá ser finalizada enquanto a quantidade solicitada for superior à disponível.

A validação também deverá ser realizada no momento da confirmação da compra, considerando operações simultâneas para evitar que diferentes clientes comercializem uma quantidade superior ao estoque disponível. Para isso, será necessário implementar mecanismos de controle das transações e atualização do estoque, evitando que duas compras utilizem simultaneamente o mesmo saldo disponível.

Além dessa validação, consultas SQL poderão acompanhar os dados de estoque, movimentações e pedidos de reposição, identificando produtos com baixa disponibilidade e quantidades pendentes de recebimento. Dessa forma, a empresa poderá antecipar necessidades de abastecimento e solicitar novas mercadorias aos fornecedores.

O BI poderá apresentar relatórios de produtos com estoque baixo ou zerado, movimentações de estoque e pedidos de reposição em aberto. As consultas G03, G08, G15 e G16 já permitem acompanhar diferentes aspectos dessas informações, enquanto as consultas de auditoria A01, A02, A10 e A12 auxiliam na identificação de inconsistências relacionadas ao estoque e às movimentações.

Como aplicação futura de IA, modelos preditivos poderão utilizar o histórico de vendas para estimar a procura por produtos e sugerir quantidades de reposição, considerando o estoque disponível e os pedidos pendentes.

A implementação do alerta e do bloqueio de vendas dependerá de alterações nas regras de negócio e no processo de finalização das compras do sistema de vendas, não sendo realizada apenas por consultas SQL.

## 15.4 Potencial do banco de dados para Business Intelligence

A estrutura relacional da ANSARAH permite relacionar informações de diferentes áreas da organização por meio de chaves primárias e campos destinados aos relacionamentos entre as tabelas. A implementação das restrições de chave estrangeira no banco de dados permitirá reforçar a integridade referencial dessas relações.

As consultas SQL poderão ser utilizadas como fonte de dados para dashboards desenvolvidos em ferramentas como Power BI.

O painel gerencial poderá apresentar:

- Evolução mensal do faturamento.
- Ticket médio das vendas concluídas.
- Comparação do faturamento por canal de venda.
- Produtos mais vendidos por quantidade.
- Percentual de vendas canceladas.
- Valores recebidos por forma de pagamento.
- Valores de contas a pagar por situação.
- Alterações de preços dos produtos.
- Quantidade e percentual de SKUs com estoque baixo.
- Produtos sem disponibilidade em estoque.
- Pedidos de reposição e quantidades pendentes.
- Qualidade dos cadastros de produtos.
- Histórico de operações de backup e restauração.

Os dados poderão ser extraídos do MySQL, tratados e organizados para apresentação em gráficos, tabelas e indicadores visuais. As consultas gerenciais G01 a G16 fornecem diferentes visões sobre o desempenho comercial, financeiro, cadastral, de estoque e de reposição. As consultas G11 e G12 também permitem acompanhar as operações de backup e restauração.

Dessa forma, a gestão poderá acompanhar os resultados da organização de maneira centralizada, reduzindo a dependência de relatórios elaborados manualmente e facilitando a identificação de situações que exigem atenção.

## 15.5 Aplicações analíticas e de Inteligência Artificial

A utilização de Inteligência Artificial representa uma possibilidade de evolução da arquitetura analítica da ANSARAH.

As principais aplicações propostas são:

**Previsão de demanda:** analisar o histórico de vendas por SKU para estimar a quantidade de produtos que poderá ser comercializada em períodos futuros.

**Recomendação de reposição:** utilizar previsões de demanda, quantidades disponíveis e pedidos em aberto para sugerir compras e auxiliar no planejamento do estoque.

**Automação de cadastros:** extrair informações de planilhas e documentos de fornecedores, reduzindo a necessidade de digitação manual. Os dados extraídos deverão ser conferidos antes de serem registrados no sistema.

**Análise de tendências comerciais:** identificar padrões de vendas por produto, categoria e canal, apoiando decisões de estoque e estratégias comerciais.

**Identificação de anomalias:** analisar registros de movimentação de estoque, auditoria e operações de backup para sinalizar situações que mereçam verificação.

Essas aplicações são propostas futuras. Sua implementação dependerá da disponibilidade de dados históricos, ferramentas específicas, integração com o banco de dados e validação dos resultados.

## 15.6 Rastreabilidade entre problemas, indicadores e consultas SQL

A rastreabilidade relaciona os problemas identificados durante o levantamento da organização às tabelas do banco de dados, aos indicadores gerenciais e às consultas SQL que poderão apoiar seu acompanhamento.

### Relação entre problemas e consultas SQL

| Problema | Consultas gerenciais | Consultas de auditoria | Finalidade |
|---|---|---|---|
| P1 — Perda de informações e retrabalho após a restauração de backup | G11 e G12 | A17, A18, A19 e A20 | Consultar o histórico de backups e restaurações, verificar inconsistências, permissões e o período desde o último backup completo. |
| P2 — Dificuldade na geração de relatórios | G01, G02, G04, G05, G06, G07, G09 e G14 | — | Analisar faturamento, produtos vendidos, cancelamentos, contas a pagar, pagamentos, alterações de preços, classificação de produtos e ticket médio. |
| P3 — Controle da disponibilidade de produtos | G03, G08, G15 e G16 | A01, A02, A10 e A12 | Acompanhar o estoque disponível, produtos com baixa disponibilidade, recebimentos, quantidades pendentes e inconsistências nas movimentações. |

A consulta G10 complementa o acompanhamento gerencial da auditoria, permitindo identificar a quantidade de operações registradas por usuário e tipo de operação.

### Relação entre KPIs, tabelas e consultas SQL

| KPI | Tabelas envolvidas | Consulta correspondente |
|---|---|---|
| K01 — Percentual de cadastros incompletos | `Produto` | G13 |
| K02 — Faturamento mensal | `Venda`, `Item_venda` | G01 |
| K03 — Ticket médio | `Venda`, `Item_venda` | G14 |
| K04 — Faturamento por canal | `Venda`, `Item_venda` | G01 |
| K05 — Percentual de SKUs com estoque baixo | `Produto_SKU` | G15, com consulta complementar para o cálculo percentual |
| K06 — Quantidade pendente de reposição | `pedido_reposicao`, `Item_reposicao` | G16, com consulta complementar para o total consolidado |

As consultas G01, G13 e G14 permitem calcular diretamente os indicadores K02, K04, K01 e K03, respectivamente. A consulta G15 identifica os SKUs com estoque de até 15 unidades, mas não calcula diretamente o percentual em relação ao total de SKUs. Da mesma forma, a G16 apresenta as quantidades pendentes por item de reposição, mas não calcula diretamente o total consolidado do indicador K06. Para obter esses dois resultados em formato de KPI, poderão ser utilizadas consultas agregadas complementares.

Para o P1, as consultas G11 e G12 permitem acompanhar as execuções de backup e as operações de recuperação. As consultas de auditoria A17 a A20 complementam esse acompanhamento, pois verificam situações específicas relacionadas à consistência dos registros, às permissões e à periodicidade dos backups.

Dessa forma, a rastreabilidade permite relacionar as necessidades identificadas na organização às estruturas de dados, aos indicadores e às consultas desenvolvidas, demonstrando como o banco de dados poderá apoiar o acompanhamento gerencial e a tomada de decisões.
---

## 16. Uso de Inteligência Artificial


<br><br>
---

## 17. Conclusão

O desenvolvimento deste projeto permitiu aplicar os conhecimentos adquiridos na disciplina de Modelagem de Banco de Dados, desde o levantamento de requisitos até a construção da estrutura lógica e a elaboração dos comandos SQL. A partir das informações obtidas junto à ANSARAH, foi possível compreender parte dos processos envolvidos na gestão de produtos, vendas, clientes, fornecedores, estoque, pagamentos e reposições.

A modelagem proposta buscou organizar essas informações de maneira estruturada, estabelecendo entidades, atributos e relacionamentos que representam os principais processos da organização. A elaboração do dicionário de dados, a identificação das chaves primárias e dos campos destinados aos relacionamentos e a análise da normalização contribuíram para melhorar a organização e a consistência da estrutura.

Além da modelagem, foram desenvolvidas consultas SQL gerenciais e de auditoria para demonstrar como os dados podem ser utilizados na geração de relatórios, indicadores e verificações. Essas consultas permitem explorar informações relacionadas ao faturamento, desempenho de produtos, movimentações de estoque, pagamentos, reposições, histórico de preços, backups e restaurações.

O projeto também abordou os problemas identificados durante o levantamento, apresentando propostas para aprimorar o controle de estoque, a recuperação de informações por meio de backups e a geração de relatórios gerenciais. A utilização de ferramentas de Business Intelligence e as possíveis aplicações de Inteligência Artificial foram consideradas oportunidades para ampliar a análise dos dados e apoiar futuras decisões da organização.

Por fim, conclui-se que o projeto proporcionou uma experiência prática de análise e modelagem de dados, demonstrando a importância de uma estrutura de banco de dados bem organizada para o funcionamento e a gestão de uma empresa. Embora a solução desenvolvida tenha caráter acadêmico e não represente uma implantação no ambiente real da ANSARAH, ela apresenta uma proposta estruturada que pode servir como base para futuras melhorias nos processos de armazenamento, consulta, controle e análise de informações.
<br><br>



---

## 18. Referências

- **ANSARAH.** Informações institucionais e comerciais.  
  https://www.ansarah.com.br/

- **ANSARAH.** Entrevista e questionário com representante da organização. 2026.

- **Google Maps.** Localização das lojas da Ansarah.  
  25 de Março: https://maps.app.goo.gl/ja89dX2NqaD3WHnK6  
  Brás: https://maps.app.goo.gl/SKGrzBL6uDV7w4WL8

- **CNPJ.BIZ.** Consulta de registro da organização.  
  > **(https://cnpj.biz/61419610000119)**

---

