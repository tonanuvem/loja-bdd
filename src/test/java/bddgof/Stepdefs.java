package bddgof;

import cucumber.api.java.pt.Dado;
import cucumber.api.java.pt.Quando;
import cucumber.api.java.pt.Entao;

import bddgof.PagamentoTeste;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.web.client.RestTemplate;

import static org.junit.Assert.*;

public class Stepdefs {

    private static String tipo;
    private static Integer valor;
    
    private static String endpoint = "http://localhost:8080/";


    @Dado("Que cliente finalizou a compra do seu Carrinho de Compras")
    public void que_cliente_finalizou_a_compra_do_seu_Carrinho_de_Compras() {
        // HttpRequestTest
        RestTemplate restTemplate = new RestTemplate();
        String s = restTemplate.getForObject(endpoint, String.class);
        assertTrue(s.contains("Pagamento"));
    }

    @Quando("Escolhe a opcao de pagamento: {string}")
    public void escolhe_a_opcao_de_pagamento(String string) {
        Stepdefs.tipo = string;
    }

    @Quando("clica em finalizar Pagamento: {int}")
    public void clica_em_finalizar_Pagamento(Integer int1) {
        Stepdefs.valor = int1;
    }

    @Entao("O pagamento tem que ser concluido com sucesso: {string}")
    public void o_pagamento_tem_que_ser_concluido_com_sucesso(String string) {
        RestTemplate restTemplate = new RestTemplate();
        String url = endpoint+"/pagamento?tipo_pagamento="+tipo+"&valor_pagamento="+valor;
        PagamentoTeste pagamentoTeste = restTemplate.getForObject(url, PagamentoTeste.class);
        assertEquals(pagamentoTeste.getStatusPagamento(), string);
    }

}
