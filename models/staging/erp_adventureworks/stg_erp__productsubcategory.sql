with 

source as (

    select * from {{ source('erp', 'productsubcategory') }}

),

renamed as (

    select
        cast(productsubcategoryid as int) as pk_subcategoriaProdutoID,
        cast (productcategoryid as int) as fk_produtocategoriaID,
        cast (name as string) as subcategoriaProduto
        

    from source

)

select * from renamed
