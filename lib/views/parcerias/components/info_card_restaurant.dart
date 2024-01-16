import 'package:eveo_app/views/parcerias/widgets/restaurante.dart';
import 'package:ionicons/ionicons.dart';

List<Restaurante> restaurantes = [
  Restaurante(
    nome: 'Maragô Restô Bar',
    imagem: 'https://www.eveo.com.br/wp-content/uploads/2023/11/marago.jpg',
    endereco: 'Rua 13 de Maio, 283',
    desconto: '10% OFF',
    categoria: 'Brasileiro',
    icon: Ionicons.fast_food_outline,
  ),
  Restaurante(
    nome: 'Bentô',
    imagem: 'https://www.eveo.com.br/wp-content/uploads/2023/11/Bento.jpg',
    endereco: 'Rua 13 de Maio, 283',
    desconto: '5% OFF',
    categoria: 'Japones',
    icon: Ionicons.fish_outline,
  ),
  Restaurante(
    nome: 'Dom Galetos Grill',
    imagem: 'https://www.eveo.com.br/wp-content/uploads/2023/11/Galetos.jpg',
    endereco: 'Rua 13 de Maio, 283',
    desconto: '5% OFF',
    categoria: 'Galeto',
    icon: Ionicons.pizza_outline,
  ),
];
