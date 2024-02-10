create database lalala;
use lalala;

create table usuarios(
id bigint not null auto_increment, 
nome VARCHAR (100) not null,
email VARCHAR (100) not null,
data_nascimento datetime not null,
senha VARCHAR (20) not null,
data_cadastro DATETIME default now(), 
ocupacao_id bigint not null,
primary key (id),
foreign key(ocupacao_id) references Ocupacoes(id)
);

create table regras_acesso(
id bigint  not null auto_increment,
nome VARCHAR (50) not null,
primary key(id)
);

create table Ocupacoes(
id bigint not null auto_increment,
Nome_da_Ocupacao varchar (100),
regras_id bigint not null,
primary key (id),
foreign key(regras_id) references regras_acesso(id)
);


create table locais(
id bigint not null auto_increment,
nome VARCHAR (100) not null,
bloco ENUM('A', 'B', 'C', 'D'),
ocupacao bigint not null,
primary key(id)
);

create table checklist_itens (
id bigint not null auto_increment,
local_id bigint not null, 
itens_id  bigint not null, 
presente BOOLEAN,
primary key (id),
foreign key (local_id) references locais (id),
foreign key (itens_id) references itens (id)

);


create table itens(
id bigint not null auto_increment,
nome_item varchar (20) not null,
primary key(id)
);


create table Eventos(
id bigint not null auto_increment,
Nome_Evento varchar (150),
Data_Inicio  datetime default now(),
Data_Termino datetime,
Capacidade_Maxima int(10) not null,
Tempo_Permitido datetime,
Tempo_Máximo datetime,
id_local bigint not null,
primary key (id),
foreign key(id_local) references locais(id)
);

create table ticket (
id bigint not null auto_increment,
id_Evento bigint not null,
id_Usuario bigint not null,
Data_Check datetime default now(),
primary key (id),
foreign key (id_Evento) references Eventos(id),
foreign key(id_Usuario) references usuarios(id)
);