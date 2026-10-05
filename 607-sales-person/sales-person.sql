# Write your MySQL query statement below
select
    sp.name
    from SalesPerson sp
    where sp.name not in (
        select sp.name
        from SalesPerson sp
        left join Orders o
            on sp.sales_id = o.sales_id
        left join Company c
            on c.com_id = o.com_id
        where c.name = 'RED'
    )
    ;
    