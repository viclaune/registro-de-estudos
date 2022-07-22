/*1. FILTRAGEM COM WHERE
	* Vem logo apos o FROM, e filtra alguma condicao logica.
		* Para isso temos que usar operadores
			= (igual)
            > (maior)
            < (menor)
            >= (maior ou igual)
            <= (menor ou igual)
            != ou <> (diferente)
*/
-- Exemplo:
SELECT city_id,
		city,
        country_id
FROM sakila.city
WHERE city = "Abu Dhabi" 

/*2. CONDICOES LOGICAS BASICAS
	* Utilizando os operadores logicos vistos acima
    * Utilizando AND (E) ou OR (OU) para mudar o fluxo do codigo
*/

-- Exemplo:
SELECT * FROM payment WHERE amount > 5;
SELECT * FROM payment WHERE payment_date > "2005-05-29";
SELECT * FROM customer WHERE first_name = "LINDA";

SELECT * FROM customer WHERE first_name = "LINDA" OR first_name = "MARY";
SELECT * FROM customer WHERE first_name = "MARY" AND last_name = "SMITH";

-- Exemplos mais avancados:
SELECT *
  FROM sakila.film
 WHERE rental_rate < 10
	   AND rental_duration > 2 
       AND rental_duration < 5;

SELECT *
  FROM sakila.film
 WHERE rental_rate < 2 
	   OR rental_duration < 5;

/*3. FILTROS EM DADOS NULL
	* Representam ausencia de informacao na tabela
		* Sao diferentes de valores neutros, como por exemplo o numero 0 ou um texto vazio.
        * Dependendo da arquitetura de dados utilizada, podem ter significado importante
*/
SELECT * FROM sakila.address WHERE address2 IS NULL;
SELECT * FROM sakila.address WHERE address2 IS NOT NULL;

/*4. FILTROS AVANCADOS
*/
-- IN -> Utilizada para avaliar se os valores estao presentes em uma lista de valores. Exemplos:
SELECT * FROM sakila.payment WHERE amount IN (0.99, 2.99);
SELECT * FROM sakila.payment WHERE amount = 0.99 OR amount = 2.99;
SELECT * FROM sakila.film WHERE rating IN ('PG', 'G');

-- BETWEEN -> Buscando valores numericos que estao entre 2 valores
SELECT * FROM sakila.payment WHERE amount BETWEEN 0 AND 5;

-- LIKE -> Estabelecer uma condicao na tabela para que o texto se pareca com outro texto na tabela.
SELECT * FROM sakila.film WHERE special_features LIKE "Commentaries"
SELECT * FROM sakila.film WHERE special_features LIKE "%Commentaries"
