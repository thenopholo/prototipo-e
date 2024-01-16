import 'package:eveo_app/views/feed/widgets/card_noticias.dart';
import 'package:eveo_app/utils/colors.dart';
import 'package:eveo_app/views/feed/info_noticia.dart';
import 'package:eveo_app/views/feed/components/noticias.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FeedPage extends StatefulWidget {
  const FeedPage({super.key});

  @override
  State<FeedPage> createState() => _FeedPageState();
}

class _FeedPageState extends State<FeedPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: Colors.white,
            title: Text(
              'Feed da EVEO',
              style: GoogleFonts.montserrat(
                fontSize: 18,
                fontWeight: FontWeight.w700,
                color: cinza,
              ),
            ),
            centerTitle: true,
            floating: true,
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                var noticia = noticias[index];
                return InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => InfoNoticias(noticia: noticia),
                      ),
                    );
                  },
                  child: CardNoticia(
                    imagem: noticia['imagem'],
                    titulo: noticia['titulo'],
                    data: noticia['data'],
                    local: noticia['local'],
                  ),
                );
              },
              childCount: noticias.length,
            ),
          ),
        ],
      ),
    );
  }
}
