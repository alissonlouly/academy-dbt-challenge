with 

source as (

    select * from {{ source('erp', 'salesorderheadersalesreason') }}

),

renamed as (

    select
        cast (salesorderid as int) as pk_pedidoID,
        cast (salesreasonid as int) as fk_razaoVendaID
        
        
        

    from source

)

select * from renamed
