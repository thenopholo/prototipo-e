import 'package:eveo_app/botao_home.dart';
import 'package:eveo_app/botao_retangular_home.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        shadowColor: Colors.transparent,
        iconTheme: IconThemeData(color: Colors.white),
        title: Text(
          'Home',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.red,
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.account_circle,
              color: Colors.white,
            ),
          ),
        ],
      ),
      drawer: Drawer(),
      body: Stack(
        children: [
          Column(
            children: [
              Expanded(
                flex: 2,
                child: Container(color: Colors.red),
              ),
              Expanded(
                flex: 10,
                child: Container(color: Colors.grey[100]),
              ),
            ],
          ),
          ListView(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16),
                child: Text(
                  'Bem- Vindo Rodigo!',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                  ),
                ),
              ),
              Container(
                child: GridView.count(
                  primary: false,
                  padding: EdgeInsets.all(16),
                  mainAxisSpacing: 16,
                  crossAxisSpacing: 16,
                  shrinkWrap: true,
                  crossAxisCount: 2,
                  children: [
                    BotaoHome(
                      icon: Icons.emoji_emotions_outlined,
                      title: 'Terapia com\nPsicológo',
                    ),
                    BotaoHome(
                      icon: Icons.monetization_on_outlined,
                      title: 'Recibo de\nPagamentos',
                    ),
                    BotaoHome(
                      icon: Icons.document_scanner_outlined,
                      title: 'Documentos\nPessoais',
                    ),
                    BotaoHome(
                      icon: Icons.task_outlined,
                      title: 'Gerenciador de\nTarefas',
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  children: [
                    BotaoRetangularHome(
                        icon: Icons.star_border_outlined,
                        title: 'Benefícios Disponíveis'),
                    BotaoRetangularHome(
                        icon: Icons.discount_outlined,
                        title: 'Parcerias e Descontos'),
                    BotaoRetangularHome(
                        icon: Icons.feed_outlined, title: 'Feed de Notícias'),
                    BotaoRetangularHome(
                        icon: Icons.graphic_eq_outlined, title: 'Metas e OKR'),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
