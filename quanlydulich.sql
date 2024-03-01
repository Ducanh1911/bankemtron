create database quanlydulich
use quanlydulich

create table diadiem(
	madd varchar(30) primary key,
	tendd varchar(20),
	tp varchar(20)
)

create table chuyendi(
	macd varchar(30) primary key,
	tencd varchar(20),
	ngkh date,
	ngkt date,
	khdk int
)

create table ctietcd(
	macd varchar(30) foreign key references chuyendi(macd),
	madd varchar(30) foreign key references diadiem(madd),
	snluu int,
	primary key(macd, madd)
)

--2
select ctietcd.madd, tendd
from diadiem, ctietcd
where ctietcd.madd=diadiem.madd and macd='cd02'

--3
select top 1 with ties snluu, macd, madd
from ctietcd
order by snluu DESC

--5
create default def_snluu
as
	0
go
exec sp_bindefault def_snluu, 'ctietcd.snluu'

--6 
select macd, tencd
from chuyendi
where ngkh='2020/09/02'

--7
create default def_ngaykh
as
	getdate()
go
exec sp_bindefault def_ngaykh, 'chuyendi.ngkh'

--8
select top 1 with ties snluu
from ctietcd
where macd='cd02'
order by snluu DESC

select top 1 with ties snluu
from ctietcd
where macd='cd02'
order by snluu ASC

--9
select top 1 with ties khdk, macd, tencd
from chuyendi
order by khdk ASC

--10
create rule rul_khdk
as @khdk>0
go 
exec sp_bindrule rul_khdk, 'chuyendi.khdk'

--11
select madd, tendd
from diadiem
where tp='hanoi'

--12
create rule rul_ngkh
as
	@ngkh>=getdate() 
go 
exec sp_bindrule rul_ngkh, 'chuyendi.ngkh'

create rule rul_ngkt
as
	@ngkt>=getdate()
go
exec sp_bindrule rul_ngkt, 'chuyendi.ngkt'