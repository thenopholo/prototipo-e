import 'package:eveo_app/utils/colors.dart';
import 'package:eveo_app/views/home/home_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _senhaController = TextEditingController();
  bool _versenha = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: cinza,
      appBar: AppBar(
        backgroundColor: cinza,
        centerTitle: true,
        foregroundColor: Colors.white,
        title: Text(
          'Login',
          style: GoogleFonts.montserrat(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      body: Column(
        children: [
          Image.asset(
            'assets/images/logo_EVEO(white_red).png',
            height: 150,
          ),
          Center(
              child: SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  TextFormField(
                    controller: _emailController,
                    style: GoogleFonts.montserrat(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),
                    decoration: InputDecoration(
                      labelText: 'E-mail',
                      labelStyle: GoogleFonts.montserrat(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),
                      hintText: 'nome.sobrenome@eveo.com.br',
                      hintStyle: GoogleFonts.montserrat(
                        color: Colors.white70,
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    validator: (email) {
                      if (email == null || email.isEmpty) {
                        return 'Digite seu e-mail';
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    controller: _senhaController,
                    obscureText: !_versenha,
                    style: GoogleFonts.montserrat(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),
                    decoration: InputDecoration(
                      labelText: 'Senha',
                      labelStyle: GoogleFonts.montserrat(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),
                      hintText: 'Digite sua senha',
                      hintStyle: GoogleFonts.montserrat(
                        color: Colors.white70,
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),
                      suffixIcon: IconButton(
                        color: Colors.white,
                        icon: Icon(_versenha
                            ? Icons.visibility_off_outlined
                            : Icons.visibility_outlined),
                        onPressed: () {
                          setState(() {
                            _versenha = !_versenha;
                          });
                        },
                      ),
                    ),
                    validator: (senha) {
                      if (senha == null || senha.isEmpty) {
                        return 'Digite sua senha';
                      } else if (senha.length < 6) {
                        return 'Digite uma senha mais forte';
                      }
                      return null;
                    },
                  ),
                  TextButton(
                    style: const ButtonStyle(alignment: Alignment.centerRight),
                    onPressed: () {},
                    child: Text(
                      'Esqueceu sua senha?',
                      style: GoogleFonts.montserrat(
                        color: vermelho,
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: vermelho,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (_) => const HomePage()));
                      }
                    },
                    child: Text(
                      'Entrar',
                      style: GoogleFonts.montserrat(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )),
        ],
      ),
    );
  }

  logar() async {
    var url = Uri.parse('uri');
    var response = await http.post(
      url,
      body: {
        'username': _emailController.text,
        'password': _senhaController.text,
      },
    );
    print(response.statusCode);
    print(response.body);
  }
}
