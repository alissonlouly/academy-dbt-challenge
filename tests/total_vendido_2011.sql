{{
    config (
        severity = 'error'
    )
}}

with 
    vendas_em_1997 as (
        select sum(totalBruto) as totalVendido
        from {{ ref('fato_vendas') }}
        where datapedido between '2011-01-01' and '2011-12-31'
    )

select totalVendido
from vendas_em_1997
where totalVendido not between 12646112.00 and 12646113.00




