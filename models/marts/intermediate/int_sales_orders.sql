with 
    pedidos as (
        select *
        from {{ ref('stg_erp__salesorderheader') }}
    ), 

    pedidos_itens as (
        select *
        from {{ ref('stg_erp__salesorderdetail') }}
    ),

    join_pedidos_itens as (
        select 
            pedidos.pedidoID,
            pedidos.clienteID,
            pedidos.cartaoID,
            pedidos.territoryID,
            pedidos.enderecoCompraID,
            pedidos.enderecoEntregaID,
            pedidos.pessoaID,
            pedidos_itens.pedidoDetalheID,
            pedidos_itens.produtoID,
            pedidos_itens.ofertaID,
            pedidos.status,
            pedidos.pedidoOnline,
            pedidos.numeropedido,
            pedidos.numeroConta,
            pedidos.tipoEntrega,
            pedidos.cartaoAprovadoCodigo,
            pedidos.taxaCambio,
            pedidos.subtotal,
            pedidos.imposto,
            pedidos.frete ,
            pedidos.total,
            pedidos.dataPedido,
            pedidos.dataVencimento,
            pedidos.dataEntrega,
            pedidos_itens.codigoRastreio,
            pedidos_itens.quantidadePedido,
            pedidos_itens.precoUnitario,
            pedidos_itens.descontoUnitario
        from pedidos_itens
        left join pedidos on pedidos.pedidoID = pedidos_itens.pedidoID
    ),

    chave_vendas as (
        select 
            cast((pedidoID || '-' || produtoID )as string) as pk_vendas
            ,*
        from join_pedidos_itens
    )

select * 
from chave_vendas
