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
            erp_produtos.produtoID,
            erp_produtos.produtosubcategoriaID,
            erp_subcategoria.produtocategoriaID,
            erp_categoria.categoriaProduto,
            erp_subcategoria.subcategoriaProduto,
            erp_produtos.nomeProduto,
            erp_produtos.numeroProduto,
            erp_produtos.preco,
            erp_produtos.linhaProduto,
            erp_produtos.classeProduto,
           
            
            
        from erp_produtos
        left join erp_subcategoria on erp_produtos.produtosubcategoriaID = erp_subcategoria.subcategoriaProdutoID
        left join erp_categoria on erp_subcategoria.produtocategoriaID = erp_categoria.categoriaProdutoID
        
    )

    select *
    from join_produtos_categorias