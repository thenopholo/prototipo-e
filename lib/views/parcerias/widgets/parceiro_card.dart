import 'package:eveo_app/utils/colors.dart';
import 'package:eveo_app/views/parcerias/google_maps_marago.dart';
import 'package:eveo_app/views/parcerias/widgets/restaurante.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ParceiroCard extends StatefulWidget {
  Restaurante restaurante;

  ParceiroCard({
    super.key,
    required this.restaurante,
  });

  @override
  _ParceiroCardState createState() => _ParceiroCardState();
}

class _ParceiroCardState extends State<ParceiroCard> {
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => const ParceiroMapsPage(),
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.only(bottom: 8),
        child: Container(
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(
              Radius.circular(60),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 10,
                offset: Offset(0, 5),
              ),
            ],
          ),
          margin: const EdgeInsets.all(8),
          child: Column(
            children: [
              AspectRatio(
                aspectRatio: 16 / 9,
                child: Stack(
                  children: [
                    Image.network(
                      widget.restaurante.imagem,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CircleAvatar(
                            backgroundColor: Colors.white,
                            child: IconButton(
                              onPressed: () {
                                setState(() {
                                  isFavorite = !isFavorite;
                                });
                              },
                              icon: Icon(
                                isFavorite
                                    ? Icons.favorite
                                    : Icons.favorite_border,
                                color: vermelho,
                              ),
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.all(8),
                            color: vermelho,
                            child: Text(
                              widget.restaurante.desconto,
                              style: const TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                color: Colors.white,
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 8,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          widget.restaurante.nome,
                          style: GoogleFonts.montserrat(
                            fontSize: 24,
                            fontWeight: FontWeight.w700,
                            color: cinza,
                          ),
                        ),
                        const Row(
                          children: [
                            Text(
                              '4.9',
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 12,
                              ),
                            ),
                            Icon(
                              Icons.star,
                              color: Colors.amber,
                              size: 16,
                            )
                          ],
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const Icon(
                          Icons.place_outlined,
                          size: 16,
                          color: Colors.grey,
                        ),
                        Text(
                          widget.restaurante.endereco,
                          style: const TextStyle(
                            fontSize: 14,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 4),
                          child: Icon(
                            widget.restaurante.icon,
                            size: 16,
                            color: Colors.grey,
                          ),
                        ),
                        Text(
                          widget.restaurante.categoria,
                          style: const TextStyle(
                            fontSize: 14,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
