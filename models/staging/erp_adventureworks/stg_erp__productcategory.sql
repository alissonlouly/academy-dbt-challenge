with 

source as (

    select * from {{ source('erp', 'productcategory') }}

),

renamed as (

    select
        cast(productcategoryid as int) as categoriaProdutoID,
        cast (name as string) as categoriaProduto
        

    from source

)

select * from renamed
