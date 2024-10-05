create database donghaemongdb;
create user manager@localhost identified by 'manager';
grant all privileges on donghaemongdb.* to manager@localhost;
commit;

