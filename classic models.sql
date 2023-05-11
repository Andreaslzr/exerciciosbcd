use classicmodels;

#a)
select employeeNumber, lastName, firstName, extension, email, 
officeCode, reportsTo, jobTitle, count(customerNumber) as vendas from employees e
inner join customers c on e.employeeNumber = c.salesRepEmployeeNumber
group by employeeNumber having count(customerNumber)>0;

#b)
select c.customerNumber as numero_cliente, customerName as nome_cliente, 
count(checkNumber) as total_de_compras from customers c
inner join payments p on c.customerNumber = p.customerNumber
group by c.customerNumber;

#c)
select c.customerNumber as numero_cliente, customerName as nome_cliente, 
avg(amount) as media_de_compras from customers c
inner join payments p on c.customerNumber = p.customerNumber
group by c.customerNumber;

#d)
select o.officeCode, addressLine1, count(employeeNumber) as total_de_funcionarios from offices o
inner join employees e on o.officeCode = e.officeCode
group by o.officeCode;

#e)
select employeeNumber, lastName, firstName,
 count(customerNumber) as vendas_realizadas from employees e
inner join customers c on e.employeeNumber = c.salesRepEmployeeNumber
group by employeeNumber;

#f)
select p.productCode, productName, count(orderNumber) as compras from products p
inner join orderdetails od on p.productCode = od.productCode
group by p.productCode
order by count(orderNumber) desc
limit 5;

#g)
select max(total_de_funcionarios) from (
select o.officeCode, addressLine1, count(employeeNumber) as total_de_funcionarios from offices o
inner join employees e on o.officeCode = e.officeCode
group by o.officeCode) sub;

#h)
select c.customerNumber, customerName from customers c
inner join payments p on c.customerNumber = p.customerNumber
where c.customerNumber in(
select customerNumber from payments
where amount>10000);


