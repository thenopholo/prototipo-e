import 'package:eveo_app/utils/colors.dart';
import 'package:eveo_app/views/parcerias/widgets/caregorias_widget.dart';
import 'package:eveo_app/views/parcerias/widgets/parceiro_card.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ionicons/ionicons.dart';
import 'package:eveo_app/views/parcerias/components/info_card_restaurant.dart';

class FeedParceriasPage extends StatefulWidget {
  const FeedParceriasPage({Key? key}) : super(key: key);

  @override
  State<FeedParceriasPage> createState() => _FeedParceriasPageState();
}

class _FeedParceriasPageState extends State<FeedParceriasPage> {
  List items = [
    '1',
    '2',
    '3',
    '4',
    '5',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            floating: true,
            title: Text(
              'Parcerias da EVEO',
              style: GoogleFonts.montserrat(
                fontSize: 18,
                fontWeight: FontWeight.w700,
                color: cinza,
              ),
            ),
            centerTitle: true,
            actions: [
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.search),
              ),
            ],
          ),
          SliverToBoxAdapter(
            child: Container(
              color: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: TextField(
                decoration: InputDecoration(
                  hoverColor: vermelho,
                  prefixIcon: const Icon(
                    Ionicons.search_outline,
                    color: vermelho,
                  ),
                  hintText: 'O que você está procurando hoje?',
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.red.shade300),
                  ),
                  border: const OutlineInputBorder(
                    borderSide: BorderSide(),
                  ),
                  isDense: true,
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Categorias'),
                  TextButton(
                    onPressed: () {},
                    child: const Text('ver tudo'),
                  ),
                ],
              ),
            ),
          ),
          const SliverToBoxAdapter(
            child: SizedBox(
              height: 100.0,
              child: CategoriasBotao(),
            ),
          ),
          const SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Text(
                '05 Restaurantes',
                textAlign: TextAlign.end,
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              childCount: restaurantes.length,
              (context, index) {
                return ParceiroCard(
                  restaurante: restaurantes[index],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
