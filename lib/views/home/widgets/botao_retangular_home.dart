import 'package:eveo_app/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BotaoRetangularHome extends StatefulWidget {
  final IconData icon;
  final String title;
  final VoidCallback onTap;

  const BotaoRetangularHome({
    super.key,
    required this.icon,
    required this.title,
    required this.onTap,
  });

  @override
  State<BotaoRetangularHome> createState() => _BotaoRetangularHomeState();
}

class _BotaoRetangularHomeState extends State<BotaoRetangularHome> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          color: Colors.white,
          margin: const EdgeInsets.only(bottom: 8),
          child: ListTile(
            onTap: widget.onTap,
            leading: Icon(
              color: vermelho,
              widget.icon,
              size: 28,
            ),
            title: Text(
              widget.title,
              style: GoogleFonts.montserrat(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: cinza,
              ),
            ),
            trailing: const Icon(Icons.arrow_forward_ios),
          ),
        ),
      ],
    );
  }
}
