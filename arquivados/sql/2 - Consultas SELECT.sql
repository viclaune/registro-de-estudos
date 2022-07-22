/*1. LINHAS e COLUNAS
	* Diferenca entre atributos e registros
		* Registros
			* Sao as linhas de uma tabela
            * Cada linha representa uma entidade naquela tabela:
				* Ex.: em uma tabela "pedidos", cada linha eh um pedido.
                * Ex.: em uma tabela "alunos", cada linha eh um aluno.
	* Atributos
		* Sao as colunas de uma tabela
        * Representam as caracteristicas de um registro
        * Tambem sao usadas para relacionar tabelas
*/

/*2. PRIMEIROS PASSOS COM SELECT
	* Entradas e saidas do comando SELECT
		* O que? (quais atributos)
		* De onde? (qual tabela)
*/
USE sakila;

-- Exemplo 1:
SELECT first_name AS primeiro_nome
  FROM staff;

-- Exemplo 2:
SELECT *
  FROM staff
  
-- Selecione tudo com o * da tabela staff
-- AS eh o alias, que serve para modificar o nome da tabela em seu resultado.

/*3. SELECT DISTINCT
	* Para conhecer todos os valores distintos da tabela passamos o DISTINCT ao lado do SELECT
    * Eh similar ao remover duplicatas (nao altera a tabela, apenas tem efeito em sua apresentacao.
*/

SELECT DISTINCT first_name
  FROM customer;
