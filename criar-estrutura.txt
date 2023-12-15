create table categoria (
	id serial not null primary key,
	nome varchar not null
);

CREATE TYPE Cor AS ENUM ('branco', 'preto', 'prata');

CREATE TABLE carro (
    id serial not null primary key,
    montadora varchar not null,
    modelo varchar not null,
    cor Cor not null,
    ano int not null,
    status_locacao boolean not null,
    quilometragem_atual int not null,
    categoria_id int not null,
    constraint fk_categoria_id foreign key (categoria_id) references categoria (id) on delete cascade
);


create table cliente (
	id serial not null primary key,
	nome varchar not null,
	cpf varchar(11) not null unique,
	email varchar not null unique
);

create table filial (
	id serial not null primary key,
	nome varchar not null,
	cidade varchar not null,
	estado char(2) not null
);

create table locadora (
	id serial not null primary key,
	cliente_id int not null,
	carro_id int not null,
	locacao_data date not null,
	devolucao_data date not null,
	quilometragem_saida int not null,
	quilometragem_chegada int not null,
	locacao_filial_id int not null,
	devolucao_filial_id int not null,
	constraint fk_cliente_id foreign key (cliente_id) references cliente (id) on delete cascade,
	constraint fk_carro_id foreign key (carro_id) references carro (id) on delete cascade,
	constraint fk_locacao_filial_id foreign key (locacao_filial_id) references filial (id) on delete cascade,
	constraint fk_locacao_devolucao_id foreign key (devolucao_filial_id) references filial (id) on delete cascade
);

