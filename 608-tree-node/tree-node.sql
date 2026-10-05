# Write your MySQL query statement below
select
    id,
    case 
        when isnull(p_id) then 'Root'
        when id IN (SELECT p_id FROM Tree)THEN 'Inner'
        else 'Leaf'
    end as type
    from tree
    group by id
    ;