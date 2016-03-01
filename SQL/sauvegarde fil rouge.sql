exec sp_addumpdevice 'disk', 'savshop', 'C:\backup\shop.bak'

backup database shop to savshop

alter database shop set restricted_user with rollback immediate


alter database shop set multi_user

restore database shop from savshop with replace