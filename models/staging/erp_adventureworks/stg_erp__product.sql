with 

source as (

    select * from {{ source('erp', 'product') }}

),

renamed as (

    select
        cast(productid as int) as pk_productID,
        cast(productsubcategoryid as int) as fk_produtosubcategoriaID,
        cast(name as string) as nomeProduto,
        cast (productnumber as string) numeroProduto,
        cast (listprice as numeric) as preco,
        cast (productline as string) as linhaProduto,
        cast (class as string) as classeProduto
        


    from source 

)

select * from renamed
