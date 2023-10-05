import 'package:eveo_app/botao_home.dart';
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
                      icon: Icons.circle,
                      title: 'Terapia com\nPsicológo',
                    ),
                    BotaoHome(
                      icon: Icons.abc_outlined,
                      title: 'Recibo de\nPagamentos',
                    ),
                    BotaoHome(
                      icon: Icons.ac_unit,
                      title: 'Documentos\nPessoais',
                    ),
                    BotaoHome(
                      icon: Icons.access_alarm_outlined,
                      title: 'Gerenciador de\nTarefas',
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  children: [
                    Container(
                      color: Colors.white,
                      margin: EdgeInsets.only(bottom: 8),
                      child: ListTile(
                        leading: Icon(Icons.person),
                        title: Text('Bla bla bla bla'),
                        trailing: Icon(Icons.arrow_forward),
                      ),
                    ),
                    Container(
                      color: Colors.white,
                      margin: EdgeInsets.only(bottom: 8),
                      child: ListTile(
                        leading: Icon(Icons.person),
                        title: Text('Bla bla bla bla'),
                        trailing: Icon(Icons.arrow_forward),
                      ),
                    ),
                    Container(
                      color: Colors.white,
                      margin: EdgeInsets.only(bottom: 8),
                      child: ListTile(
                        leading: Icon(Icons.person),
                        title: Text('Bla bla bla bla'),
                        trailing: Icon(Icons.arrow_forward_ios),
                      ),
                    ),
                    Container(
                      color: Colors.white,
                      margin: EdgeInsets.only(bottom: 8),
                      child: ListTile(
                        leading: Icon(Icons.person),
                        title: Text('Bla bla bla bla'),
                        trailing: Icon(Icons.arrow_forward),
                      ),
                    ),
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
