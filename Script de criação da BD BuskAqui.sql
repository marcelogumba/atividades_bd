create database buskaAqui;
use buskaAqui;

create table usuario(
	id_usuario int auto_increment primary key not null, 
    nome varchar(100) not null, 
    email varchar(100) not null, 
    senha varchar(100) not null, 
    tefone char(16), 
    data_cadastro date not null
);

create table endereco(
	id_endereco int auto_increment primary key not null, 
	id_usuario int not null, 
    rua varchar(50), 
    bairro varchar(50), 
    municipio varchar(50), 
    provincia varchar(50) not null, 
    pais varchar(50) not null,
    foreign key (id_usuario) references usuario(id_usuario)
);

create table categoria(
	id_categoria int auto_increment primary key not null, 
    nome varchar(100) not null, 
    descricao varchar(200)
);

create table produto(
	id_produto int auto_increment primary key not null,
    nome varchar(100) not null,
	descricao varchar(200),
    preco decimal(10,2) not null, 
    id_categoria int not null,
    foreign key (id_categoria) references categoria(id_categoria)
);

create table estoque(
	id_estoque int auto_increment primary key not null, 
    id_produto int not null,
    quantidade int not null,
    ultima_atualizacao date not null,
    foreign key (id_produto) references produto(id_produto)
);

create table pedido(
	id_pedido int auto_increment primary key not null, 
	id_usuario int not null, 
    data_pedido date not null,
    _status varchar(50), 
    id_endereco int not null, 
    foreign key (id_usuario) references usuario(id_usuario),
    foreign key (id_endereco) references endereco(id_usuario)
);

create table item_pedido(
	id_item_pedido int auto_increment primary key not null, 
    id_pedido int not null, 
	id_produto int not null, 
	preco_unitario decimal(10,2) not null, 
    foreign key (id_pedido) references pedido(id_pedido),
    foreign key (id_produto) references produto(id_produto)
);

create table pagamento(
	id_papamento int auto_increment primary key not null, 
	id_pedido int not null, 
    metodo varchar(50), 
    _status varchar(50), 
    data_pagamento date not null,
    foreign key (id_pedido) references pedido(id_pedido)
);