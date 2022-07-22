/*1. ORDENACAO EM CONSULTAS
    * Ao executar uma consulta SELECT a ordenacao dos dados se da
		* na ordem em que os dados foram criados e inseridos na tabela
	
    * Por que ordenar?
		* Controlar o comportamento dos resultados
			* Aplicacoes especificas requerem resultados especificos
	
    * Facilitar analise exploratoria
		* Permite ver os primeiros ou ultimos registros com relacao a algum atributo
	
    * Comando ORDER BY
		* Utilizado para ordernar por uma coluna especifica.
*/
SELECT * FROM sakila.rental ORDER BY last_update LIMIT 10;

/*2. CLAUSULAS ASC E DESC
    * Inserindo o ORDER BY ele vai ordernar de forma crescente a partir de um atributo especifico
    * Para ficar em ordem decrescente devemos colocar o DESC apos o atributo
*/
SELECT * 
  FROM sakila.customer 
 ORDER BY first_name DESC 
 LIMIT 1;

/*3. ORDENACAO POR MULTIPLAS COLUNAS
    * Eh possivel combinar colunas
    * Assim, os resultados tem um ajuste fino
*/
SELECT first_name, 
       last_name, 
       email
  FROM sakila.customer
 ORDER BY first_name ASC, last_name ASC;
 
/*4. INTRODUCAO AO AGRUPAMENTO
    * Agrupamento permite juntar multiplas linhas em resultados condensados.
*/
SELECT customer_id FROM sakila.payment GROUP BY customer_id;

/*5. SINTAXE BASICA DE DQL
    * SELECT
    * FROM
    * WHERE
    * GROUP BY
    * ORDER BY
*/
