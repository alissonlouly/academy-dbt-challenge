with 
source as (

    select * from {{ source('erp', 'salesorderdetail') }}

),

renamed as (

    select
        cast(salesorderid as int) pedidoID,
        cast(salesorderdetailid as int) as pedidoDetalheID,
        cast(carriertrackingnumber as string) as codigoRastreio,
        cast(orderqty as int) as quantidadePedido,
        cast(productid as int) as produtoID,
        cast(specialofferid as int) as ofertaID,
        cast(unitprice as numeric) as precoUnitario,
        cast(unitpricediscount as numeric) as descontoUnitario
        
    from source

)

select * from renamed
