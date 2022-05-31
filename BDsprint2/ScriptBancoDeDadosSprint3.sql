create database immuncold;
use immuncold;


create table empresa (
id_empresa int not null primary key auto_increment,
nome varchar(255) not null,
representante varchar(255) not null,
cnpj varchar(25) not null unique,
cep varchar(50),
endereco varchar(150),
telefone varchar(14) not null unique,
email varchar(100) not null unique,
senha varchar(25)not null) auto_increment = 1000;

insert into empresa values (null, 'teste1', 'quaquer1', '1231231123', '1231231231', 'Rua sakjdhaskda', '1193232423', 'teste1@gmail.com', '1234');

create table usuario (
id_usuario int not null primary key auto_increment,
nome_usuario varchar (255) not null,
telefone_usuario int,
email_usuario varchar (255) unique not null,
senha_usuario varchar (25),
fk_empresa int,
foreign key (fk_empresa) references empresa (id_empresa)
);

create table localidade (
id_localidade int not null primary key auto_increment,
tipo varchar(13) not null,
check (tipo = 'Transporte' or tipo = 'Armazenamento'),
endereco_localidade varchar(150) not null,
identificador varchar(25) not null);

insert into localidade values (null, 'Armazenamento', 'ASDJKASDHASDKASDA', '1A');

insert into localidade values (null, 'Armazenamento', 'askjdasdhajk', 'A');

create table parametro (
id_parametro int not null primary key auto_increment,
temp_max int not null,
temp_min int not null);

create table sensor (
id_sensor int not null primary key auto_increment,
nome_vacina varchar(50),
fk_empresa int not null,
foreign key (fk_empresa)
references empresa(id_empresa),
fk_localidade int not null,
foreign key (fk_localidade)
references localidade(id_localidade),
fk_parametro int,
foreign key (fk_parametro) references parametro(id_parametro));

select * from empresa;
insert into sensor (fk_empresa, fk_localidade) values ('1000', '1');

select * from empresa;

insert into sensor (nome_vacina, fk_empresa, fk_localidade) values ('Pfizer', '1001', '1');

select * from sensor;



create table hist_medicao (
id_hist int not null primary key auto_increment,
lm35 decimal(10,2),
data_horario datetime default current_timestamp not null,
fk_sensor int not null,
foreign key (fk_sensor)
references sensor(id_sensor));


insert into hist_medicao (lm35, fk_sensor) values ('30', 4),
('29', 4),
('20', 4),
('15', 4),
('30', 4),
('23', 4),
('34', 4),
('25', 4),
('10', 4),
('50', 4),
('40', 4);

insert into hist_medicao (lm35, fk_sensor) values ('30', 4),
('29', 4),
('20', 4),
('15', 4),
('30', 4),
('23', 4),
('34', 4),
('25', 4),
('50', 4),
('100', 4),
('40', 4);

insert into hist_medicao (lm35, fk_sensor) values ('16', 4);

select * from hist_medicao order by data_horario desc limit 1;



select * from hist_medicao;

select * from sensor;

select * from empresa;