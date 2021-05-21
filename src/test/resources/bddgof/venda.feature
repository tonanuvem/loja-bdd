# language: pt
@venda
Funcionalidade: Venda de produtos para Loja
  Descrição da funcionalidade, preferencialmente atrelando a feature ao valor gerado para a organização

  @verificar_disponibilidade_produto
  Cenario: Cliente quer verificar disponibilidade de um produto
    Dado Que cliente VISITA a pagina do site
    Quando O cliente pesquisa por um produto XXXXX
    Entao Deve ser consultado o estoque do produto XXXX
    E Retornar a quantidade de Produtos Disponiveis em estoque de cada loja

  @seleciona_produto_comprar
  Cenario: Cliente seleciona um produto e adiciona ao Carrinho de compras
    Dado Que cliente FEZ LOGIN na pagina do site
    Quando O cliente adiciona um produto ao carrinho de compras
    Entao O produto fica reservado por 15 minutos

  @finaliza_compra_produto
  Cenario: Cliente finaliza a compra do seu Carrinho de compras
    Dado Que cliente FEZ LOGIN na pagina do site
    E Cliente tem itens no seu Carrinho de Compras
    Quando O cliente finaliza a compra
    Entao Emite as opcoes de pagamento

  @finaliza_pagamento
  Esquema do Cenario: Cliente efetua o pagamento
    Dado Que cliente finalizou a compra do seu Carrinho de Compras
    Quando Escolhe a opcao de pagamento: <tipo pagamento>
    E clica em finalizar Pagamento: <valor>
    Entao O pagamento tem que ser concluido com sucesso: <resultado esperado>
    Exemplos:
        | tipo pagamento  | valor  | resultado esperado                             |
        | "CARTAO"        | 50     | "Pagamento em Cartão processado com sucesso"   |
        | "CARTAO"        | 1000   | "Pagamento em Cartão processado com sucesso"   |
        | "CARTAO"        | 1001   | "Pagamento não autorizado"                     |
        | "CHEQUE"        | 50     | "Pagamento em Cheque processado com sucesso"   |
        | "CHEQUE"        | 500    | "Pagamento não autorizado"                     |
        | "CHEQUE"        | 5000   | "Pagamento não autorizado"                     |
        | "DINHEIRO"      | 50     | "Pagamento em Dinheiro processado com sucesso" |
        | "DINHEIRO"      | 500    | "Pagamento em Dinheiro processado com sucesso" |
        | "DINHEIRO"      | 5000   | "Pagamento em Dinheiro processado com sucesso" |
        | "DINHEIRO"      | -1     | "Pagamento em Dinheiro processado com sucesso" |
