select * from [Order];

select * from product;

select employee.firstName,
        employee.lastName,
        [order].id,
        [order].CustomerId,
        [order].ShipCountry,
        customer.CompanyName
from [order]
join employee on [order].EmployeeId = employee.id
join customer on [order].CustomerId = customer.id;

select p.ProductName, od.Quantity, p.UnitPrice, * from [order] as o
join orderdetail as od
    on o.id = od.OrderId
join product as p
    on od.productId = p.id;

//To Calculate Line Totals
(od.Quanity * p.UnitPrice) as LineTotal

select p.ProductName, od.Quantity, p.UnitPrice, s.CompanyName, * from [order] as o
join orderdetail as od
    on o.id = od.OrderId
join product as p
    on od.productId = p.id
join supplier as s
    on s.id = p.SupplierId;