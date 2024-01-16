import 'package:flutter/material.dart';

class Restaurante {
  String imagem;
  String nome;
  String endereco;
  String desconto;
  String categoria;
  IconData icon;

  Restaurante({
    required this.imagem,
    required this.nome,
    required this.endereco,
    required this.desconto,
    required this.categoria,
    required this.icon,
  });

  factory Restaurante.fromJson(Map<String, dynamic> json) {
    return Restaurante(
      imagem: json['imagem'],
      nome: json['nome'],
      endereco: json['endereco'],
      desconto: json['desconto'],
      categoria: json['categoria'],
      icon: json['icon'],
    );
  }

  Map<String, dynamic> toJson() => {
        'imagem': imagem,
        'nome': nome,
        'endereco': endereco,
        'desconto': desconto,
        'categoria': categoria,
        'icon': icon,
      };
}
