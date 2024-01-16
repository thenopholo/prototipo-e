import 'dart:developer';

import 'package:eveo_app/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ionicons/ionicons.dart';

class CustomDrawer extends StatelessWidget {
  CustomDrawer({super.key});

  ///Icons
  final List<IconData> icons = [
    Ionicons.home_outline,
    Ionicons.person_outline,
    Ionicons.settings_outline,
    Ionicons.log_out_outline,
  ];

  ///Texts
  final List<String> texts = [
    'Home',
    'Perfil',
    'Configurações',
    'Sair',
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 90),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: AppColors.secundaryGradientColors,
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: Column(
        children: [
          const CircleAvatar(
            radius: 50,
            backgroundImage: NetworkImage(
                "https://www.eveo.com.br/wp-content/uploads/2023/10/Rodrigo-Thenopholo.jpg"),
          ),
          const SizedBox(height: 8),
          Text(
            'Rodrigo Thenopholo',
            style: GoogleFonts.montserrat(
              fontSize: 16,
              color: Colors.white,
              fontWeight: FontWeight.w700,
            ),
          ),
          Text(
            'Designer Gráfico',
            style: GoogleFonts.montserrat(
              fontSize: 12,
              color: Colors.white,
              fontWeight: FontWeight.w500,
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(
              vertical: 30,
              horizontal: 10,
            ),
            width: double.infinity,
            height: 300,
            child: ListView.builder(
                itemCount: icons.length,
                itemBuilder: ((context, index) {
                  return InkWell(
                    onTap: () {
                      log('${texts[index]} Item selecionado');
                    },
                    child: Container(
                      margin: const EdgeInsets.symmetric(vertical: 3),
                      child: ListTile(
                        leading: Icon(
                          icons[index],
                          color: Colors.white,
                        ),
                        title: Text(
                          texts[index],
                          style: GoogleFonts.montserrat(
                            fontSize: 16,
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                  );
                })),
          ),
        ],
      ),
    );
  }
}
