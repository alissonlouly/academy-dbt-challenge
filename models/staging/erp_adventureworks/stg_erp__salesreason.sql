with 

source as (

    select * from {{ source('erp', 'salesreason') }}

),

renamed as (

    select
        cast(salesreasonid as int) as pk_razaoVendaID,
        cast(name as string) as razaoVenda,
        cast(reasontype as string) as tipoRazao
       

    from source

)

select * from renamed
