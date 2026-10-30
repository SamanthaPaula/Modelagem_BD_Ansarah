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

## 3. Evidências da Pesquisa
<br>
Para comprovar a existência da organização e o acesso do grupo para a realização da pesquisa de campo, foram reunidas informações e registros relacionados à Ansarah.

### 3.1 Fotos das lojas

- **Loja da 25 de Março:** foto anexada no repositório.
- **Loja do Brás:** foto anexada no repositório.

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
**Cargo/Função:** Proprietária e responsável pela área administrativa/financeira
**Telefone para contato:** 

> **A fotografia referente ao atendimento realizado pela responsável da organização está disponível no repositório, na pasta `PROVASDAEMPRESA`, junto aos demais registros e documentos utilizados como evidências.**

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

---

## 9. Dicionário de Dados

O **Dicionário de Dados** está **anexado no repositório**.

Ele apresenta as entidades, atributos, chaves primárias (PK), chaves estrangeiras (FK) e demais informações definidas para o modelo.

> **Arquivo do Dicionário de Dados: anexado no repositório.**

---

## 10. Justificativa Técnica do Modelo
<br>

<br><br>


---

## 11. Uso de Inteligência Artificial


<br><br>
---

## 12. Conclusão

<br><br>



---

## 13. Referências

- **ANSARAH.** Informações institucionais e comerciais.  
  https://www.ansarah.com.br/

- **ANSARAH.** Entrevista e questionário com representante da organização. 2026.

- **Google Maps.** Localização das lojas da Ansarah.  
  25 de Março: https://maps.app.goo.gl/ja89dX2NqaD3WHnK6  
  Brás: https://maps.app.goo.gl/SKGrzBL6uDV7w4WL8

- **CNPJ.BIZ.** Consulta de registro da organização.  
  > **(https://cnpj.biz/61419610000119)**

---

