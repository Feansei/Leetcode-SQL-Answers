# Write your MySQL query statement below
with cte as (
    select
        E.name as Employee,
        E.salary as Salary,
        dense_rank() over (partition by E.departmentId order by E.salary desc) as rnk,
        D.name as Department
    from Employee E
        left join Department D
            on E.departmentId = D.id
)

select
    Department,
    Employee,
    Salary
    from cte
    where rnk = 1;