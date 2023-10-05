import 'package:eveo_app/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
      body: Center(
          child: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextFormField(
                controller: _emailController,
                decoration: InputDecoration(
                  label: Text('E-mail'),
                  hintText: 'nome.sobrenome@eveo.com.br',
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
                decoration: InputDecoration(
                  label: Text('Senha'),
                  hintText: 'Digite sua senha',
                  suffixIcon: IconButton(
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
              const SizedBox(
                height: 12,
              ),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    Navigator.push(
                        context, MaterialPageRoute(builder: (_) => HomePage()));
                  }
                },
                child: const Text(
                  'Entrar',
                ),
              ),
            ],
          ),
        ),
      )),
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
