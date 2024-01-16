import 'package:eveo_app/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ionicons/ionicons.dart';

class CategoriasBotao extends StatefulWidget {
  const CategoriasBotao({super.key});

  @override
  State<CategoriasBotao> createState() => _CategoriasBotaoState();
}

class _CategoriasBotaoState extends State<CategoriasBotao> {
  List<String> itens = [
    "Restaurantes",
    "Educação",
    "Beleza",
  ];

  List<IconData> icones = [
    Ionicons.restaurant_outline,
    Ionicons.school_outline,
    Icons.face_retouching_natural_rounded,
  ];

  int current = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.all(5),
        width: double.infinity,
        height: double.infinity,
        child: Column(
          children: [
            SizedBox(
              height: 80,
              width: double.infinity,
              child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: itens.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: ((context, index) {
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        current = index;
                      });
                    },
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      margin: const EdgeInsets.all(5),
                      width: 125,
                      height: 80,
                      decoration: BoxDecoration(
                        color: current == index ? vermelho : Colors.white,
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                            color: const Color(0xffbf3130),
                            width: 1.0,
                            style: BorderStyle.solid,
                            strokeAlign: BorderSide.strokeAlignOutside),
                      ),
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.only(top: 2, bottom: 2),
                                child: Icon(
                                  icones[index],
                                  color: current == index
                                      ? Colors.white
                                      : vermelho,
                                ),
                              ),
                              Text(
                                itens[index],
                                style: GoogleFonts.montserrat(
                                    color:
                                        current == index ? Colors.white : cinza,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
