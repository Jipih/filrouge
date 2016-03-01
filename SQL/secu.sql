use Papyrus

create login util1 with password ='pwd', DEFAULT_DATABASE=[shop], CHECK_EXPIRATION=OFF, CHECK_POLICY=OFF
create login util2 with password ='pwd', DEFAULT_DATABASE=[shop], CHECK_EXPIRATION=OFF, CHECK_POLICY=OFF
create login util3 with password ='pwd', DEFAULT_DATABASE=[shop], CHECK_EXPIRATION=OFF, CHECK_POLICY=OFF

go

create user util1 for login util1
create user util2 for login util2
create user util3 for login util3

go

grant select on  to util1
grant select on  to util1
grant select on  to util1
grant select on  to util1
grant select on to util1

go

deny delete on  to util1
deny delete on  to util1
deny delete on  to util1
deny delete on  to util1
deny delete  on  to util1

go

create role gestion

grant select on commande to gestion
grant update on commande to gestion

go

execute sp_addrolemember 'gestion','util3'

