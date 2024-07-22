--Với project thiết kế cơ sở dữ liệu Multiple Language ( diagram 3.2 )
create table Product(
		p_id int IDENTITY(1000,1) PRIMARY KEY, 
		pname_EN nvarchar(128) NOT NULL,
		description_EN nvarchar(128),
		price decimal(18,2) NOT NULL,
		quantity int NOT NULL,
		);
create table transiation_product(
		p_id int,
		language_id int,
		description_trans nvarchar(128),
		pname_trans nvarchar(128),
		constraint PK_trans_product PRIMARY KEY (p_id,language_id),
		);
create table languega(
		language_id int IDENTITY(1,1) PRIMARY KEY,
		lang_name nvarchar(128) NOT NULL
		);
create table customer(
		customer_id int IDENTITY(1,1) PRIMARY KEY,
		customer_name_EN nvarchar(128),
		datebirth date,
		customer_address_EN nvarchar(128),
		contact_number nvarchar(128),
		email nvarchar(128),
		profil_EN nvarchar(500)
);
create table transiation_customer(
	customer_id int,
	language_id int,
	cname_trans nvarchar(128),
	profil_trans nvarchar(500),
	caddress_trans nvarchar(128)
	constraint trans_customer_FK PRIMARY KEY(customer_id,language_id)
	);
create table Orders(
		order_id int PRIMARY KEY,
		product_id int NOT NULL,
		customer_id int NOT NULL,
		create_date date NOT NULL,
		discriptions_EN nvarchar(128)
);
alter table  Orders add constraint FK_customer_order foreign key(customer_id) references customer(customer_id);
alter table  Orders add constraint FK_product_order foreign key(product_id) references product(p_id);

alter table  transiation_product add constraint FK_trans_pid foreign key(p_id) references product(p_id);
alter table  transiation_product add constraint FK_trans_planguage foreign key(language_id) references languega(language_id);
		
alter table  transiation_customer add constraint FK_trans_cid foreign key(customer_id) references customer(customer_id);
alter table  transiation_customer add constraint FK_trans_clanguage foreign key(language_id) references languega(language_id);
