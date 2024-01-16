import 'package:eveo_app/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BotaoHome extends StatelessWidget {
  final IconData icon;
  final String title;
  const BotaoHome({super.key, required this.icon, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12), color: Colors.white),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Icon(
            color: vermelho,
            icon,
            size: 64,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8),
            child: Text(
              title,
              textAlign: TextAlign.center,
              style: GoogleFonts.montserrat(
                fontSize: 18,
                fontWeight: FontWeight.w500,
                color: cinza,
              ),
            ),
          )
        ],
      ),
    );
  }
}
