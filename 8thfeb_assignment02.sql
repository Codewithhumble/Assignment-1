create table orders 
(
OrderID	number(10) ,
CustomerID  INT CONSTRAINT PK_custmer_id PRIMARY KEY,
OrderDat date not null
);
create table custemers
(
CustomerID	INT primary key ,
CustomerName varchar(20) not null,
ContactName	varchar(20) not null,
Country varchar(20) not null
);

insert into orders values(10308, 2 , to_date('1996-09-18' , 'yyyy-mm-dd'))
insert into orders values(10309,37,to_date('1996-09-19','yyyy-mm-dd'));
insert into orders values(10310,77,to_date('1996-09-20','yyyy-mm-dd'));

insert into custemers values (1,'Alfreds Futterkiste','Maria Anders','Germany');
insert into custemers values (2,'Ana Trujillo','Ana Trujillo','Mexico');
insert into custemers values (3,'Moreno Taquería','Antonio Moreno','Mexico');

select * from orders
select * from custemers

-- inner join 
select * from 
            orders 
inner join
            custemers 
on
    orders.CustomerID=custemers.CustomerID;

--full join 
select * from 
            orders 
full outer join
            custemers 
on
    orders.CustomerID=custemers.CustomerID;
    
--left outer join

select * from 
            custemers  
left join
            orders 
on
    orders.CustomerID=custemers.CustomerID;
    
--RIGHT outer join

select * from 
            custemers  
RIGHT JOIN
            orders 
on
    orders.CustomerID=custemers.CustomerID;

--CROSS JOIN
select * from 
            orders  
CROSS JOIN
            custemers 
WHERE
    orders.CustomerID=custemers.CustomerID;


--SELF JOIN 
SELECT * FROM 
            orders O1,
            orders O2
WHERE 
        O1.CustomerID=O1.CustomerID;