with 

source as (

    select * from {{ source('erp', 'productsubcategory') }}

),

renamed as (

    select
        cast(productsubcategoryid as int) as subcategoriaProdutoID,
        cast (productcategoryid as int) as produtocategoriaID,
        cast (name as string) as subcategoriaProduto
        

    from source

)

select * from renamed
