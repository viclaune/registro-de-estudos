# Modelagem

Modelos são abstrações dos elementos do mundo real. Abstração de dados é a técnica de focar nos elementos principais dos dados, em seu significado, características e como se relacionam entre si, suas funções no negócio... A modelagem de dados é extamente a representação dos dados abstraídos em diferentes níveis, sendo o Modelo conceitual o de maior abstração e o Modelo Físico de menor, por já se preocupar mais no formato do dado em sua camada final.

## 1.1 Modelagem Conceitual
![image](https://i.stack.imgur.com/Vfu9R.png)

Fonte: https://pt.stackoverflow.com/questions/126104/modelo-conceitual

É o modelo que está mais próximo da realidade dos usuários. Sendo construído a partir dos resultados extraídos na fase de levantamento de requisitos (quando os projetistas de db entrevistam os usuários para entenderem como realizam suas atividades, como se relacionam com os processos e sistemas vigentes e documentam os resultados). Nesta fase não há uso de tecnologias e ferramentas, apenas o entendimento dos agentes que executam as ações, suas características e como se relacionam.

O modelo conceitual mais conhecido é o MER (Modelo Entidade Relacionamento), criado em 1970 por Edgar F. Codd, que propôs a criação de um modelo que permitisse maior abstração, em que as aplicações não precisassem conhecer o detalhamento do armazenamento, o que resultaria em melhor portabilidade. O diagrama resultante do modelo conceitual MER é o DER (Diagrama de Entidade e Relacionamento)

**Entidade:** É o objeto básico do modelo ER, é algo no mundo real com uma existência independente. Pode ser abstrata, concreta ou associativa:
  - Concreta: Existe fisicamente no mundo real (carro, pessoa, livro)
  - Abstrata: Não existe fisicamente, mas conceitualmente (empresa, pedido, disciplina/matéria)
  - Fortes: Existência não depende de outra entidade. Já possuem sentido completo por si mesma (funcionário, produto, carro)
  - Fracas: Só existem quando estão se relacionando com outra entidade (itens do pedido só existem se houver pedido; dependentes de um plano de saúde só existe se existir um contratante)
  - Associativas: Entidade que existe como resultado do relacionamento "muios para muitos", quando em um relacionamento temos muitas ocorrências de uma entidade para muitas ocorrências da outra. (Um produto para estar em várias pedidos diferentes, e um pedido pode ter vários produtos. É um relacionamento "muitos para muitos", não ligamos as duas entidades diretamente, e sim, criamos uma tabela no meio para representar esse relacionamento, que seria algo como `Itens_pedido`, com a chave de Produto e Pedido.) 

**Atributo:** Atributos são características, propriedades específicas que descrevem as entidades. Eles podem ser simples, compostos, monolavorados, multivalorados, armazenados ou derivados:
  - Simples: Atributos atômicos, que não podem ser divididos em partes menores. (Idade, CPF)
  - Composto: Atributos que podem ser divididos em subpartes menores, que representam atributos mais básicos com significados independentes. (Endereço - Rua, número, cidade, país)
  - Monovalorado: Possui apenas um valor para uma entidade. (Idade, CPF, altura)
  - Multivalorado: Pode ter mais de uma ocorrência para uma mesma entidade. (Endereço pode ser comercial e residencial; Telefone; Formação acadêmica;)
  - Armazenado: Atributos com valores fixos persistidos em banco.
  - Derivado: Atributos cujos valores devem ser obtidos após algum processamento utilizando informações obtidas do próprio banco de dados (idade = Data_Atual - Data_Nascimento)
  - Atributo chave: É aquele que representa unicamente uma ocorrência da entidade, que garente unicidade (cod_cliente, CPF, CRM).

**Relacionamento:** É uma associação entre uma ou mais entidades.
  - Binária/Ternário: Definido pela quantidade de entidades envolvidas no relacionamento. Binário são duas entidades, ternário três entidades e assim por diante. 
  - Auto relacionamento, recursivo ou unário: Auto-explicável; É preciso entender que entidades possuem papéis, ou uma "função"no relacionamento. Ex.: Funcionário é gerenciado por um outro Funcionário.
  - <u>Cardinalidade</u>: Os relacionamentos também podem ser definidos pela razão de cardinalidade. A razão de cardinalidade especifica a quantidade de instâncias/ocorrências de relacionamentos em que uma entidade pode participar (1:1, 1:N, N:N).
      - **1:1**: **Um** empregado gerencia **um** departamento e um departamento pode ser gerenciado por apenas **um** funcionário.
      - **1:N ou N:1**: **Um** empregado trabalha em **um** departamento, e **um** departamento pode ter **vários** (N) empregados.
      - **N:N**: Empregado pode trabalhar em **vários** (N) projetos e um projeto pode possuir **vários** (N) empregados. Para evitar redundância de dados, cria-se uma **entidade associativa**.
  - <u>Obrigatoriedade</u>: Além da cardinalidade também especificamos a obrigatoriedade, ou seja, se uma ocorrência de uma entidade é obrigatória ou não.
 ![image](https://i.stack.imgur.com/vqEc6.png)

Fonte: https://pt.stackoverflow.com/questions/391730/cardinalidade-m%C3%ADnima-e-m%C3%A1xima-modelo-relacional

**Notação DER - Peter Chen**

![image](https://sites.google.com/site/fkbancodedados1/_/rsrc/1466881366775/modelodados/der/bd13.png)

Fonte: https://sites.google.com/site/fkbancodedados1/modelodados/der

## 1.2 Modelo Lógico

![image](https://www.devmedia.com.br/imagens/sqlmagazine/abr2006/30-05pic02.JPG)

Fonte: https://www.devmedia.com.br/associando-tabelas-no-sql-server/1964

O modelo lógico é um aprofundamento do modelo conceitual. Neste modelo, ainda não se escolheu a tecnologia, mas sim o paradigma: relacional, orientado a objeto, hierárquico, de rede... o paradigma é o que apresenta como os dados se organizarão e irão interagir entre si. Iremos trabalhar em cima do paradigma relacional, com base no MER, avançamos mais um nível, agora descrevendo os dados com mais detalhes, preparando para o próximo nível, o modelo físico.

O Modelo Relacional representa o banco de dados como uma coleção de relações, que as entidades do modelo conceitual representam as tabelas no modelo lógico/físico, e as tabelas possuem atributos, ou colunas, que lhe conferem características, e que cada ocorrência dessa tabela são as linhas, tuplas, ou registros. E cada registro possui um domínio (numérico, alfanumérico, data, etc.)

No modelo relacional essas tabelas se relacionam através das **chaves**. As chaves são os atributos identificadores, aqueles que identificam unicamente uma linha (chave primária e chave única), ou atributos que promovem o relacionamento entre tabelas (chave estrangeira).

  - Chave Primária (**P**rimary **K**ey): Recupera uma única ocorrência do conjunto de dados; Unicidade de valores na coluna que compõe a chave. Único e não nulo. 
  - Chave Única (**U**nique **K**ey): Recupera uma única ocorrência do conjunto de dados e pode receber valores nulos. Pode ser usada para definir um relacionamento.
  - Chave Estrangeira (**F**oreign **K**ey): Atributo(s) chave de uma relação, cujos valores estão presente em outra relacionada a ela. Implementa o relacionamento entre tabelas.

## 1.3 Bancos Relacionais e SGBDs

## 1.4 Modelo Físico

É baseado no paradigma escolhido no modelo lógico, definimos a tecnologia que amarzenará os dados, ou seja, o SGBD (Sistema Gerenciador de Banco de Dados). Cada SGBD disponível no mercado possui suas características próprias que o modelo físico deve considerar, mas, independente do SGBD, os padrões básicos serão consistentes com o paradigma. Logo, qualquer banco relacional do mercado implementará os conceitos relacionais (entidade, atributo, relacionamento, chaves...)

Esta é a fase de escolher o SGBD e criar o modelo de armazenamento utilizando alguma linguagem e respeitando as restrições impostas pela tecnologia escolhida.

Para os modelos relacionais, alguns dos SGBDs que implementam tal arquitetura são: Microsoft SQL Server, Oracle, MySQL, PostgreSQL.



