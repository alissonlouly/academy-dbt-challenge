with 
    erp_vendas as (
        select *
        from {{ ref('stg_erp__salesorderheader') }}

    ),
 
        dias_da_semana AS (
            SELECT 1 AS dia_numero, 'domingo' AS dia_nome UNION ALL
            SELECT 2 AS dia_numero, 'segunda-feira' AS dia_nome UNION ALL
            SELECT 3 AS dia_numero, 'terça-feira' AS dia_nome UNION ALL
            SELECT 4 AS dia_numero, 'quarta-feira' AS dia_nome UNION ALL
            SELECT 5 AS dia_numero, 'quinta-feira' AS dia_nome UNION ALL
            SELECT 6 AS dia_numero, 'sexta-feira' AS dia_nome UNION ALL
            SELECT 7 AS dia_numero, 'sábado' AS dia_nome),

     datas as (
        select
        distinct(cast(erp_vendas.datapedido as date)) as data,
        cast(extract(year from erp_vendas.datapedido) as int) as ano,
        case extract(month from erp_vendas.datapedido)
            when 1 then 'Janeiro'
            when 2 then 'Fevereiro'
            when 3 then 'Março'
            when 4 then 'accountnumberbril'
            when 5 then 'Maio'
            when 6 then 'Junho'
            when 7 then 'Julho'
            when 8 then 'Agosto'
            when 9 then 'Setembro'
            when 10 then 'Outubro'
            when 11 then 'Novembro'
            when 12 then 'Dezembro'
            end as mes,
        cast(extract(month from erp_vendas.datapedido) as int) as mesNumero,
        (SELECT dia_nome FROM dias_da_semana WHERE EXTRACT(DAYOFWEEK FROM erp_vendas.datapedido) = dia_numero) AS dia_da_semana,
        cast(extract(day from erp_vendas.datapedido) as int) as dia,
        cast(
        case 
            when extract(month from erp_vendas.datapedido) in (1, 2, 3) then 1
            when extract(month from erp_vendas.datapedido) in (4, 5, 6) then 2
            when extract(month from erp_vendas.datapedido) in (7, 8, 9) then 3
            else 4
            end as int
            ) as trimestre,
        cast(case when extract(month from erp_vendas.datapedido) <= 6 then 1 else 2 end as int) as semestre

            
    from  erp_vendas)
        
    
    select *
    from datas