import 'package:flutter/material.dart';

class ResultPage extends StatefulWidget {
  final double resultado;
  final String nota;

  const ResultPage({
    Key? key,
    required this.resultado,
    required this.nota,
  }) : super(key: key);

  @override
  _ResultPageState createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  definirClassificacao(double resultado) {
    if (resultado >= 1 && resultado <= 2) {
      return "Muito Ruim";
    }
    if (resultado >= 2 && resultado <= 3) {
      return "Ruim";
    }
    if (resultado >= 3 && resultado <= 4) {
      return "Regular";
    }
    if (resultado >= 4 && resultado <= 5) {
      return "Boa";
    }
    return "Muito Boa";
  }

  definirNotaQ(double resultado) {
    if (resultado >= 1 && resultado <= 2) {
      return "Q1";
    }
    if (resultado >= 2 && resultado <= 3) {
      return "Q2";
    }
    if (resultado >= 3 && resultado <= 4) {
      return "Q3";
    }
    if (resultado >= 4 && resultado <= 5) {
      return "Q4";
    }
    return "Q5";
  }

  definirDescricao(double resultado) {
    if (resultado >= 1 && resultado <= 2) {
      return "Realizar um diagnóstico aprofundado da área, incluindo as condições químicas e físicas no perfil; adotar e/ou readequar as práticas conservacionistas mecânicas (ex. terraceamento, alocação de estradas, operações em nível) e vegetativas (cultivo em nível, faixas de retenção, consorciação e rotação de culturas) do solo. Repensar o sistema de produção utilizado. Adotar estratégias integradas de recuperação que envolvam sistemas diversificados de produção com alta capacidade de aporte de fitomassa aérea e raízes, podendo requerer intervenções mecânicas de recuperação física do solo, desde que adotadas criteriosamente, considerando a umidade do solo, as condições do equipamento e a velocidade adequada, entre outras. Inclusão de gramíneas no sistema, de preferência com pastejo, com correto manejo da pastagem e ajuste de lotação, visando intensificar a recuperação da estrutura do solo. Uso de adubação orgânica de forma criteriosa pode ajudar.";
    }
    if (resultado >= 2 && resultado <= 3) {
      return "Realizar um diagnóstico da área, incluindo as condições químicas e físicas no perfil, revisando as práticas conservacionistas do solo (ex. terraceamento, alocação de estradas e operações em nível). Rever e aprimorar o sistema de produção utilizado, aumentando a diversidade de espécies vegetais e priorizando culturas com alta capacidade de aporte de fitomassa aérea e raízes (ex. gramíneas). Na recuperação do solo, preferir o uso de plantas recuperadoras, em relação ao emprego de práticas mecânicas. Evitar operações de preparo de solo, mesmo as realizadas esporadicamente. Racionalizar o tráfego de máquinas agrícolas.";
    }
    if (resultado >= 3 && resultado <= 4) {
      return "Aprimorar o sistema de produção ampliando a diversificação de culturas, incluindo espécies vegetais com alta capacidadede aporte de fitomassa aérea e raízes (ex. gramíneas), e evitar/eliminar operações mecanizadas no preparo do solo. Gerenciaras operações mecanizadas visando redução de tráfego";
    }
    if (resultado >= 4 && resultado <= 5) {
      return "Intensificar o uso de sistemas diversificados de produção com alta capacidade de aporte de fitomassa aérea e raízes (ex.gramíneas). Verificar se não há necessidade de interferir na estratégia de rotação e consorciação de culturas adotada no sistema de produção.";
    }
    return "Muito Boa,Manter o sistema de manejo utilizado, atentando para a possibilidade de adoção de novas tecnologias conservacionistas.";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Blue Earth"),
        centerTitle: true,
        backgroundColor: Colors.blue[75],
        toolbarHeight: 50,
      ),
      body: Container(
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              child: Padding(
                padding: EdgeInsets.only(top: 30),
                child: Text(
                  "Média Ponderada: " + widget.resultado.toString(),
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                  ),
                ),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              child: Padding(
                padding: EdgeInsets.all(20),
                child: Text(
                  "IOES: " + definirNotaQ(widget.resultado),
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                  ),
                ),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              child: Padding(
                padding: EdgeInsets.all(20),
                child: Text(
                  "Qualidade estrutural: " +
                      definirClassificacao(widget.resultado),
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                  ),
                ),
              ),
            ),
            Container(
              child: Padding(
                padding: EdgeInsets.all(20),
                child: Text(
                  definirDescricao(widget.resultado),
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
