# Modelagem

Modelos são abstrações dos elementos do mundo real. Abstração de dados é a técnica de focar nos elementos principais dos dados, em seu significado, características e como se relacionam entre si, suas funções no negócio... A modelagem de dados é extamente a representação dos dados abstraídos em diferentes níveis, sendo o Modelo conceitual o de maior abstração e o Modelo Físico de menor, por já se preocupar mais no formato do dado em sua camada final.

### 1.1 Modelagem Conceitual
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

### 1.2 Modelo Lógico

### 1.3 Bancos Relacionais e SGBDs

### 1.4 Modelo Físico


