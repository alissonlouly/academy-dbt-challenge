with 
    erp_razaovendas as (
        select *
        from {{ ref('stg_erp__salesreason') }}

    ),

    erp_razaopedidos as (
        select *
        from {{ ref('stg_erp__salesorderheadersalesreason') }}

    ),

    

    join_razoes_pedidos as (
        select
            erp_razaopedidos.pk_pedidoID,
            erp_razaovendas.pk_razaoVendaID,
            erp_razaovendas.razaoVenda,
            erp_razaovendas.tipoRazao
           
            
            
        from  erp_razaovendas
        left join erp_razaopedidos on erp_razaovendas.pk_razaoVendaID = erp_razaopedidos.fk_razaoVendaID
        
        
    )

    select *
    from join_razoes_pedidos