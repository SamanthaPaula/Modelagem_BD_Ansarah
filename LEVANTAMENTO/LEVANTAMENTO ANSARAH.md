**# Relato da Entrevista e do Levantamento de Requisitos — ANSARAH**



**## 1. Identificação dos participantes**



**Organização:** ANSARAH  

**Entrevistada:** Alessandra Ansarah, uma das proprietárias da organização e responsável pelo setor financeiro.



**Participantes do grupo:**



\- Ana Beatriz Mendes Gonçalves

\- Luiz Gustavo Santos de Oliveira

\- Samantha Paula dos Santos Silva



**## 2. Primeiro contato — questionário**



Inicialmente, o grupo entrou em contato com Alessandra por meio do WhatsApp e encaminhou um questionário com 20 perguntas sobre os processos de negócio e o gerenciamento das informações da ANSARAH.



O objetivo dessa primeira etapa foi obter informações preliminares sobre o funcionamento da organização e identificar os principais processos que deveriam ser considerados na modelagem do banco de dados.



As perguntas abordaram o cadastro de produtos e clientes, controle de estoque, vendas, fornecedores, preços, pedidos on-line, trocas e devoluções, relatórios gerenciais, responsabilidades dos funcionários, permissões de acesso, segurança das informações e dificuldades enfrentadas pela empresa.



As respostas permitiram compreender inicialmente como a organização utiliza seu sistema ERP e quais informações são registradas em suas atividades diárias.



**## 3. Entrevista pelo Google Meet**



Após o primeiro contato, o grupo agendou uma entrevista com Alessandra, realizada em 30 de setembro de 2026, por meio da plataforma Google Meet.



A conversa teve como objetivo aprofundar as informações obtidas no questionário, esclarecer dúvidas sobre os processos da organização e investigar aspectos que poderiam influenciar a definição das entidades, dos atributos, dos relacionamentos e das regras de negócio do banco de dados.



Durante a entrevista, foram abordadas questões sobre a quantidade de funcionários, a identificação dos responsáveis pelas operações, a organização dos estoques, as movimentações de produtos, os pedidos de reposição, as autorizações de descontos, os procedimentos de troca e devolução, a recuperação de backups, os campos obrigatórios dos cadastros, as formas de pagamento, a classificação dos clientes, a inativação de produtos e a preservação do histórico de vendas.



Também foram discutidas as necessidades de relatórios que permitissem cruzar informações comerciais e operacionais.



**Estrutura organizacional:** a empresa informou possuir aproximadamente 58 funcionários, distribuídos entre duas unidades: 49 na unidade da Rua 25 de Março e 9 na unidade do Brás. Entre os principais setores mencionados estão compras, e-commerce, financeiro, logística, caixas e vendas.



**Organização dos estoques:** a organização possui estoques nas duas unidades. O estoque central está localizado na unidade da 25 de Março e também abastece a unidade do Brás. O centro de distribuição do e-commerce funciona no mesmo prédio do estoque central.



**Movimentações de estoque:** as movimentações são registradas no sistema, incluindo entradas, saídas e transferências entre filiais. Os registros possuem informações sobre quantidade, motivo, data e responsável pela operação.



**Pedidos de reposição e prazos:** a empresa acompanha os prazos de entrega informados pelos fornecedores. O planejamento das compras considera a demanda dos produtos e os prazos praticados pelos fabricantes.



**Relatórios gerenciais:** a entrevistada explicou que a empresa utiliza relatórios personalizados para analisar períodos sazonais, quantidade de peças vendidas por fabricante, ranking de vendas e desempenho de produtos. Essas informações também são separadas por canais, como loja física, e-commerce e marketplace.



**Autorização de descontos:** existem níveis hierárquicos de acesso ao sistema. Quando um desconto ultrapassa as condições permitidas ao funcionário, a gerente pode solicitar autorização à diretoria. A liberação depende de um usuário com nível de permissão superior.



**Cadastro de produtos:** a entrevistada informou que diversos campos são obrigatórios, principalmente os fiscais, além de informações como nome, referência, composição, peso e medidas. Os cadastros seguem um padrão de nomenclatura e preenchimento, especialmente para permitir a integração correta dos produtos com o e-commerce.



**Produtos fora de linha:** os produtos não são excluídos do sistema quando deixam de ser comercializados. Eles recebem uma identificação de produto fora de linha, permitindo que o setor de compras acompanhe esses itens e evite novas reposições. Em alguns casos, os produtos recebem promoções para facilitar a saída do estoque.



**Histórico de informações:** a empresa utiliza o ERP Millennium desde 1999 e mantém um histórico extenso de produtos e vendas. A entrevistada destacou a importância de preservar essas informações, inclusive para consultar produtos que já saíram de linha e posteriormente voltaram a ser comercializados. Também informou que a organização trabalha com aproximadamente 70 mil SKUs ou mais.



**Backups e recuperação:** a entrevistada relatou um episódio de corrupção da base de dados que afetou as quantidades de estoque. Na ocasião, a empresa utilizou um backup anterior de inventário, realizou uma nova contagem física dos produtos e registrou novamente as quantidades no sistema. Segundo a entrevistada, os backups das vendas costumam ser realizados diariamente, embora essa informação tenha sido apresentada de maneira aproximada durante a conversa.



**## 4. Entrevista complementar e esclarecimentos pelo WhatsApp**



Em 9 de outubro de 2026, o grupo realizou novos questionamentos por meio do WhatsApp, buscando aprofundar pontos que ainda precisavam de esclarecimento para a modelagem do banco de dados.



As perguntas complementares foram organizadas em quatro áreas: vendas e estoque, recebimento de mercadorias, contas a pagar e auditoria, movimentações e pagamentos.



Alessandra respondeu às perguntas por mensagens e áudios, explicando como esses processos funcionam na prática.



Entre os esclarecimentos obtidos, destacam-se:



\- **Vendas e estoque:** a empresa trabalha com uma quantidade mínima de produtos, definida por meio de uma grade padrão, e utiliza alertas do sistema, relatórios e análise da demanda para identificar necessidades de reposição. A entrevistada explicou que o sistema pode permitir a venda mesmo quando o estoque registrado está zerado, devido à possibilidade de divergência entre a quantidade cadastrada e a quantidade física. O cenário ideal seria impedir a venda, mas essa situação é tratada de maneira mais flexível na operação real.

\- **Atacado:** geralmente existe uma quantidade mínima de seis peças por pedido. Entretanto, a condição de atacado não depende apenas da quantidade comprada, mas também da finalidade da compra, como revenda ou comercialização em marketplaces. Situações específicas podem ser encaminhadas à diretoria para autorização.

\- **Recebimento de mercadorias:** o setor de logística é responsável por receber, conferir e bipar os produtos. A conferência é realizada com base no pedido previamente lançado no sistema. Como os fornecedores podem realizar entregas parciais, as quantidades recebidas são registradas gradualmente, permitindo acompanhar o saldo que ainda falta entregar.

\- **Divergências no recebimento:** quando a quantidade recebida é diferente da solicitada, o saldo permanece acompanhado no pedido e a empresa pode entrar em contato com o fornecedor para verificar o envio posterior. Quando há produtos danificados ou divergências que exigem devolução, o setor de compras é acionado e pode ser emitida uma nota fiscal de devolução.

\- **Contas a pagar:** as notas fiscais e duplicatas dos fornecedores são registradas no ERP Millennium. O sistema permite acompanhar parcelas, valores e vencimentos, além de consultar relatórios de contas pagas, pendentes e vencidas. A confirmação dos pagamentos é realizada pelo responsável do setor financeiro, ficando registrados a data, o valor e o usuário responsável.

\- **Despesas da organização:** além dos pagamentos a fornecedores, a empresa também controla despesas de consumo, serviços e despesas relacionadas aos funcionários. Essas categorias são identificadas separadamente no sistema.

\- Pagamentos e cancelamentos: uma venda pode utilizar mais de uma forma de pagamento, com os respectivos valores registrados separadamente para possibilitar a conciliação financeira. Cancelamentos e reembolsos permanecem vinculados à venda e ao pedido original, com o registro do motivo da ocorrência.



Esses esclarecimentos complementaram as informações do questionário e permitiram detalhar melhor os processos de estoque, compras, recebimento, financeiro e controle das operações.





**## 5. Principais informações levantadas**



Com base nas respostas do questionário, na entrevista e nos contatos posteriores, foram identificadas as seguintes características dos processos da ANSARAH:



**Cadastro de produtos:** realizado manualmente no ERP Millennium, utilizando informações fornecidas pelas fábricas. O cadastro contempla código, descrição, referência, coleção, subcoleção, grupo, categoria, tipo, departamento, marca, grades de cores e tamanhos, peso, NCM, classificação do produto, país de origem, código fiscal, dimensões, preço e unidade de tributação. A empresa também utiliza padrões de nomenclatura e campos obrigatórios para garantir a integração com o e-commerce.



**Variações dos produtos:** organizadas por meio de grades cadastradas com base nas disponibilizadas pelos fabricantes. Cada combinação de produto, cor e tamanho pode ser identificada por um SKU.



**Controle de estoque:** realizado pelo ERP por meio de inventários e registros de movimentação. A organização possui estoques nas unidades da 25 de Março e do Brás, sendo a primeira responsável pelo estoque central que também abastece a segunda. O centro de distribuição do e-commerce funciona junto ao estoque central. A empresa utiliza relatórios, alertas do sistema e conferências físicas para acompanhar a disponibilidade dos produtos.



**Vendas e PDV:** todas as vendas são registradas no ERP. São armazenadas informações sobre produtos, preços, quantidades, descontos, formas de pagamento, datas e vendedores. Nas vendas realizadas pelo site, também são utilizadas informações cadastrais dos clientes, respeitando os cuidados relacionados à proteção de dados pessoais.



**Cadastro e histórico de clientes:** realizado manualmente no ERP, contendo informações como nome completo, RG, CPF, endereço completo, telefone e e-mail. A empresa informou que consegue consultar o histórico de compras dos clientes.



**Fornecedores e marcas:** os fornecedores são cadastrados no ERP com informações como CNPJ, razão social, nome fantasia e demais dados cadastrais. A empresa mantém o relacionamento entre fornecedores e marcas e controla pedidos de compra, preços, prazos de entrega e notas fiscais.



**Preços, descontos e promoções:** existem variações de preços para loja física, site e revendedores. Os descontos e as promoções são controlados por meio de tabelas de preços organizadas por marca. Alterações de preços e descontos dependem de autorização da diretoria, respeitando os níveis hierárquicos de acesso ao sistema.



**Pedidos on-line:** o acompanhamento envolve aprovação do pagamento, emissão do pedido para separação, separação dos produtos, bipagem, faturamento, envio, rastreamento, entrega, cancelamento e estorno.



**Trocas, devoluções e cancelamentos:** as solicitações são tratadas pelo SAC. Nos pedidos de troca, o produto retorna por logística reversa, passa por conferência e pode ser substituído. Nos casos de devolução, após a conferência, é encaminhada ao setor financeiro a solicitação de estorno e realizada a emissão da nota fiscal de devolução. Os cancelamentos e reembolsos permanecem vinculados à venda e ao pedido original, com registro dos motivos. Os produtos devolvidos podem retornar ao estoque após a verificação.



**Recebimento de mercadorias:** realizado pelo setor de logística, que confere e registra os produtos recebidos por meio da bipagem no sistema. Como as entregas podem ocorrer parcialmente, o ERP permite acompanhar as quantidades recebidas e o saldo restante de cada pedido de reposição.



**Contas a pagar:** controladas diretamente no ERP Millennium. As notas fiscais, duplicatas, parcelas, valores e vencimentos são registrados no sistema. A empresa consegue consultar relatórios de contas pagas, pendentes e vencidas, além de identificar o usuário responsável pela baixa dos pagamentos.



**Funcionários e responsabilidades:** as atividades são distribuídas entre os setores de compras, e-commerce, financeiro, logística, caixas e vendas. Cada funcionário possui um login individual e permissões de acesso conforme sua função e nível hierárquico.



**Auditoria e segurança:** as operações realizadas pelos funcionários são registradas por meio de logs associados aos usuários. A empresa informou que alterações cadastrais, mudanças de preços, vendas, cancelamentos e movimentações são identificados no sistema. Em determinadas operações, como cancelamentos, é obrigatório informar o motivo. Também foram mencionados os protocolos relacionados à LGPD e o uso de antivírus nas máquinas.



**Produtos fora de linha:** permanecem cadastrados no sistema e recebem uma identificação específica para evitar novas reposições. A preservação desses registros permite consultar o histórico de vendas e acompanhar produtos que podem voltar a ser comercializados.



**Relatórios gerenciais:** a empresa utiliza relatórios personalizados para analisar faturamento, estoque, ranking de produtos e marcas, comparativos de vendas, períodos sazonais e desempenho por canal de comercialização, incluindo loja física, e-commerce e marketplace.



**Recursos tecnológicos:** o sistema ERP Millennium é utilizado pela organização e acessado por computadores e notebooks.



**## 6. Problemas e necessidades identificados**



Com base nas informações obtidas durante o levantamento, foram identificados três problemas principais que serviram de base para a definição das soluções propostas no projeto.



**P1 — Perda de informações e retrabalho após a restauração de backup:** a entrevistada relatou um episódio de corrupção da base de dados que afetou as quantidades de estoque. Para recuperar as informações, a empresa precisou utilizar um backup anterior do inventário, realizar uma nova contagem física dos produtos e registrar novamente as quantidades no sistema. Também foram mencionadas situações de informações perdidas, duplicadas ou desatualizadas, que exigiram correções manuais ou recuperação de versões anteriores. Esse cenário evidencia a importância de mecanismos de backup, controle e recuperação de dados que reduzam o risco de perda de informações e a necessidade de retrabalho.



**P2 — Dificuldade na geração de relatórios:** a empresa utiliza relatórios para acompanhar faturamento, estoque, desempenho de produtos e marcas, períodos sazonais e resultados por canal de comercialização. Entretanto, a entrevistada apontou a necessidade de relatórios personalizados com mais informações para facilitar o cruzamento dos dados e apoiar a tomada de decisões gerenciais.



**P3 — Controle da disponibilidade de produtos:** a entrevistada explicou que a empresa acompanha a quantidade de produtos em estoque por meio de relatórios, alertas do sistema, inventários e análise da demanda. Entretanto, podem ocorrer divergências entre a quantidade registrada no sistema e a quantidade física disponível, inclusive situações em que uma venda é permitida mesmo quando o estoque registrado está zerado. Esse cenário demonstra a importância de aprimorar o controle da disponibilidade dos produtos, considerando as quantidades cadastradas, as movimentações de estoque e as necessidades de reposição.



Esses três problemas orientaram as propostas desenvolvidas pelo grupo, incluindo mecanismos de registro de backups e restaurações, consultas e relatórios gerenciais e controles relacionados à disponibilidade de produtos e ao estoque.



**## 7. Considerações finais**



O levantamento realizado por meio do questionário, da entrevista remota e dos contatos posteriores permitiu compreender com maior profundidade os processos da ANSARAH, incluindo suas atividades comerciais, operacionais, financeiras e administrativas.



As informações obtidas serviram como base para a definição das entidades, dos atributos, dos relacionamentos, dos requisitos funcionais e não funcionais e das regras de negócio do projeto. Também orientaram a elaboração das consultas gerenciais e de auditoria, buscando representar as necessidades identificadas durante o levantamento.



Dessa forma, o modelo de banco de dados proposto foi desenvolvido considerando os processos informados pela organização e as oportunidades de melhoria identificadas pelo grupo, mantendo a distinção entre as práticas relatadas pela empresa e as soluções propostas para o projeto acadêmico. 

