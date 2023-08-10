with 
    erp_produtos as (
        select *
        from {{ ref('stg_erp__product') }}

    ),

    erp_subcategoria as (
        select *
        from {{ ref('stg_erp__productsubcategory') }}

    ),

    erp_categoria as (
        select *
        from {{ ref('stg_erp__productcategory') }}

    ),

    join_produtos_categorias as (
        select
            erp_produtos.pk_productID,
            erp_produtos.fk_produtosubcategoriaID,
            erp_subcategoria.fk_produtocategoriaID,
            erp_categoria.categoriaProduto,
            erp_subcategoria.subcategoriaProduto,
            erp_produtos.nomeProduto,
            erp_produtos.numeroProduto,
            erp_produtos.preco,
            erp_produtos.linhaProduto,
            erp_produtos.classeProduto,
           
            
            
        from erp_produtos
        left join erp_subcategoria on erp_produtos.fk_produtosubcategoriaID = erp_subcategoria.pk_subcategoriaProdutoID
        left join erp_categoria on erp_subcategoria.fk_produtocategoriaID = erp_categoria.pk_categoriaProdutoID
        
    )

    select *
    from join_produtos_categorias