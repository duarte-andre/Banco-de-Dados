create database formativaHogwarts;
use formativaHogwarts;
alter table usuarios add column cell varchar(11);
alter table usuarios add column linkphoto varchar(150);

create table status (
id bigint not null auto_increment,
name_status varchar(50) not null,
primary key (id) 
);

create table tarefa (
id bigint not null auto_increment,
nome varchar (20) not null,
describ varchar (100) not null, 
prazo datetime  not null,
data_abertura datetime default now() not null,
FK_locais bigint not null,
FK_usuario bigint not null,
primary key (id),
foreign key (FK_locais) references locais (id) ,
foreign key (FK_usuario) references usuarios (id)
);

create table tarefa_responsaveis (
id bigint not null auto_increment, 
FK_responsaveis bigint not null,
fk_tarefa bigint not null,
FK_status bigint not null,
primary key (id),
foreign key (FK_responsaveis) references usuarios(id),
foreign key (fk_tarefa) references tarefa(id),
foreign key (FK_status) references status(id)
);

create table historico_tarefa(
id bigint not null auto_increment,
FK_tarefa bigint not null,
FK_status bigint not null,
date_modificacao datetime  not null,
comentario varchar(150),
primary key(id),
foreign key(FK_tarefa) references tarefa(id),
foreign key(FK_status) references status(id)
);

create table anexos_tarefa(
id bigint not null auto_increment,
FK_tarefas bigint not null,
link_photo varchar(150) not null,
primary key (id),
foreign key(FK_tarefas) references tarefa(id)
);

/*Inserindo dados*/

/*status*/
insert into status (name_status) values("não iniciada"),("Aberta"),("Em andamento"),("Concluida"),("Encerrada");

/*tarefa*/
insert into tarefa (nome, describ, prazo,FK_locais,FK_usuario)
values ("lista_1","fazer boxplot","2023-06-30",5,2),
("lista_2","fazer limite inferior","2023-06-30",5,2),
("lista_3","fazer limite superior","2023-06-29",2,4),
("lista_4","fazer histograma","2023-06-25",3,3),
("lista_5","fazer banco de dados","2023-08-30",5,6);

/*responsavel*/
insert into tarefa_responsaveis (FK_responsaveis, fk_tarefa, FK_status) 
values (1,1,3),(1,2,2),(4,3,1),(4,4,4),(5,4,1),(5,3,5),(6,2,3),(6,3,3),(1,5,2);

/*historico*/
insert into historico_tarefa (FK_tarefa,FK_status,date_modificacao)
values(1,2,'2023-06-05 12:44:40'),(2,3,'2023-06-10 13:46:33'),(3,4,'2023-06-08 14:15:37'),
(4,5,'2023-06-01 11:02:55'),(5,3,'2023-06-013 09:10:08');

/*anexo_tarefa*/
insert into anexos_tarefa (FK_tarefas, link_photo) 
values (1,"https://www.imaginarylink1.com"),(2,"https://www.imaginarylink2.com"),
(3,"https://www.imaginarylink3.com"),(4,"https://www.imaginarylink4.com"),(5,"https://www.imaginarylink5.com"),(5,"https://www.imaginarylink5.com");
