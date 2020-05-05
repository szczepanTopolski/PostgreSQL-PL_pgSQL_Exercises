create table ACCOUNT_TYPE (
	id SERIAL PRIMARY KEY,
	type VARCHAR(50)
);
insert into ACCOUNT_TYPE (type) values ('savings');
insert into ACCOUNT_TYPE (type) values ('basic');