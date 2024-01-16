import 'package:eveo_app/views/home/components/slider_drawer.dart';
import 'package:eveo_app/views/home/widgets/botao_home.dart';
import 'package:eveo_app/views/home/widgets/botao_retangular_home.dart';
import 'package:eveo_app/utils/colors.dart';
import 'package:eveo_app/views/feed/feed_noticia.dart';
import 'package:eveo_app/views/home/components/home_app_bar.dart';
import 'package:eveo_app/views/parcerias/parcerias.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_slider_drawer/flutter_slider_drawer.dart';
import 'package:ionicons/ionicons.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  GlobalKey<SliderDrawerState> drawerKey = GlobalKey<SliderDrawerState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SliderDrawer(
        key: drawerKey,
        isDraggable: false,
        animationDuration: 1000,
        slider: CustomDrawer(),
        appBar: HomeAppBar(
          drawerKey: drawerKey,
        ),
        child: _buildHomeBody(context),
      ),
    );
  }
}

Widget _buildHomeBody(BuildContext context) {
  return Stack(
    children: [
      Column(
        children: [
          Expanded(
            flex: 2,
            child: Container(color: vermelho),
          ),
          Expanded(
            flex: 10,
            child: Container(color: Colors.grey[100]),
          ),
        ],
      ),
      Column(
        children: [
          Text(
            'Bem-Vindo, Rodrigo!',
            textAlign: TextAlign.center,
            style: GoogleFonts.montserrat(
              fontSize: 24,
              fontWeight: FontWeight.w700,
              color: Colors.white,
            ),
          ),
          Expanded(
            child: GridView.count(
              physics: const NeverScrollableScrollPhysics(),
              padding: const EdgeInsets.all(16),
              mainAxisSpacing: 16,
              crossAxisSpacing: 16,
              crossAxisCount: 2,
              shrinkWrap: true,
              children: const [
                BotaoHome(
                  icon: Ionicons.happy_outline,
                  title: 'Psicologia\nViva',
                ),
                BotaoHome(
                  icon: Ionicons.receipt_outline,
                  title: 'Recibo de\nPagamento',
                ),
                BotaoHome(
                  icon: Ionicons.document_attach_outline,
                  title: 'Documentos\nPessoais',
                ),
                BotaoHome(
                  icon: Ionicons.checkbox_outline,
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
                  icon: Ionicons.sparkles_outline,
                  title: 'Benefícios Disponíveis',
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const FeedPage()),
                    );
                  },
                ),
                BotaoRetangularHome(
                  icon: Ionicons.pricetags_outline,
                  title: 'Parcerias e Descontos',
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const FeedParceriasPage()),
                    );
                  },
                ),
                BotaoRetangularHome(
                  icon: Ionicons.newspaper_outline,
                  title: 'Feed de Notícias',
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const FeedPage()),
                    );
                  },
                ),
                BotaoRetangularHome(
                  icon: Ionicons.rocket_outline,
                  title: 'Metas e OKR',
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const FeedPage()),
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    ],
  );
}
