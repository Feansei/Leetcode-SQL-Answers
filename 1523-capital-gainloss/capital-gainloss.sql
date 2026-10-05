# Write your MySQL query statem

with cte as (
    select
        stock_name,
        operation,
        sum(price) as sell_total
    from stocks
    where operation = 'Sell'
    group by stock_name, operation
),

cte2 as (
    select
        stock_name,
        operation,
        sum(price) as buy_total
    from stocks
    where operation = 'Buy'
    group by stock_name, operation
)

select
    cte.stock_name,
    (sell_total - buy_total) as capital_gain_loss
    from cte
    join cte2
        on cte.stock_name = cte2.stock_name
    ;