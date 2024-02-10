/*Consultas*/


/*Crie uma consulta que mostre todas as tarefas ainda não iniciadas com as informações de seus  respectivos envolvidos no processo; */
select t.nome as nome_tarefa, t.describ as descrição,t.prazo,u.nome as responsavel  from tarefa_responsaveis tr
join tarefa t on t.id=fk_tarefa
join usuarios u on u.id=FK_responsaveis
where tr.FK_status = 1;

/*Crie uma consulta que mostre todos os locais que não tiveram associação a nenhuma tarefa;mecanica e eletronica*/

SELECT locais.id,locais.nome
FROM locais
LEFT JOIN tarefa ON locais.id = tarefa.FK_locais
WHERE tarefa.id IS NULL;


/*crie uma consulta que mostre todos os usuários que não tiveram associação a nenhuma tarefa*/

SELECT usuarios.*
FROM usuarios
LEFT JOIN tarefa_responsaveis ON usuarios.id = tarefa_responsaveis.FK_responsaveis
WHERE tarefa_responsaveis.id IS NULL;

/*Crie uma consulta que mostre todos eventos que ainda acontecerão e as tarefas que ainda não foram executadas nos locais destes eventos*/

SELECT eventos.nome, tarefa.nome AS nome_tarefa
FROM eventos
JOIN locais ON eventos.localFk = locais.id
JOIN tarefa ON locais.id = tarefa.FK_locais
JOIN tarefa_responsaveis ON tarefa.id = tarefa_responsaveis.fk_tarefa
JOIN status ON tarefa_responsaveis.FK_status = status.id
WHERE eventos.fim > '2023-06-04' AND status.name_status <> 'Concluído';


/*Crie uma consulta que mostre os locais e a quantidade de tarefas existentes (independente do status): */

SELECT locais.nome, COUNT(tarefa.id) AS quantidade_tarefas
FROM locais
LEFT JOIN tarefa ON locais.id = tarefa.FK_locais
GROUP BY locais.nome;

/*Crie uma consulta que mostre os locais e a quantidade de tarefas não concluidas;*/

SELECT locais.nome, COUNT(tarefa.id) AS quantidade_tarefas_nao_concluidas
FROM locais
JOIN tarefa ON locais.id = tarefa.FK_locais
JOIN tarefa_responsaveis ON tarefa.id = tarefa_responsaveis.fk_tarefa
WHERE tarefa_responsaveis.FK_status < 4
GROUP BY locais.nome;

/*Crie uma consulta que mostre os usuários e quantas tarefas possuem atribuidas (independente do status)*/

SELECT usuarios.nome, COUNT(tarefa_responsaveis.id) AS quantidade_tarefas_pendentes
FROM usuarios
JOIN tarefa_responsaveis ON usuarios.id = tarefa_responsaveis.FK_responsaveis
JOIN status ON tarefa_responsaveis.FK_status = status.id
WHERE status.name_status <> 'Concluido'
GROUP BY usuarios.nome;

/*Crie uma consulta que mostre os usuários e quantas tarefas possuem atribuidas a serem feitas*/

SELECT usuarios.nome, COUNT(tarefa_responsaveis.id) AS quantidade_tarefas
FROM usuarios
LEFT JOIN tarefa_responsaveis ON usuarios.id = tarefa_responsaveis.FK_responsaveis
GROUP BY usuarios.nome;


/*Crie uma consulta que mostre a média por mês de quantas tarefas são criadas por local*/

SELECT MONTH(data_abertura) AS mes, locais.nome, AVG(1) AS media_tarefas
FROM tarefa
JOIN locais ON tarefa.FK_locais = locais.id
GROUP BY mes, locais.nome;

