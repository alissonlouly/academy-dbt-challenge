with 

source as (

    select * from {{ source('erp', 'salesorderheader') }}

),

renamed as (

    select
        cast(salesorderid as int) as pedidoID,
        cast(substring(orderdate,1,10) as date) as dataPedido,
        cast(substring(duedate,1,10) as date) as dataVencimento,
        cast(substring(shipdate,1,10) as date) as dataEntrega,
        cast(status as string) as status,
        cast(onlineorderflag as boolean) as pedidoOnline,
        cast (purchaseordernumber as string) as numeropedido,
        cast(accountnumber as string) as numeroConta,
        cast(customerid as int) as clienteID,
        cast(salespersonid as int) as pessoaID,
        cast(territoryid as int) as territoryID,
        cast (billtoaddressid as int) as  enderecoCompraID,
        cast (shiptoaddressid as int) as enderecoEntregaID,
        cast(shipmethodid as int) as tipoEntrega,
        cast(creditcardid as int) as cartaoID,
        cast(creditcardapprovalcode as string) as cartaoAprovadoCodigo,
        cast(currencyrateid as int) as taxaCambio,
        cast(subtotal as numeric) as subtotal,
        cast(taxamt as numeric) as imposto,
        cast(freight as numeric) as frete ,
        cast(totaldue as numeric) as total

    from source

)

select * from renamed
