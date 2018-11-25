create table person(
  name varchar(50),
  age integer
);
-------------------------------
create user user2 password 'kbtu';
grant select, insert on person to user2;
revoke all privileges on person from user2;

insert into person values('Madina', 19),
                        ('Amina', 19),
                        ('Kausar', 20);
select * from person;

begin transaction isolation level serializable ;
insert into person values ('Omar', 45),
                         ('Arman', 21);
delete from person where name='Amina';
savepoint mysave;
select * from person;
rollback to mysave;
commit;