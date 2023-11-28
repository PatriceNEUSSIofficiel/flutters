import 'package:flutter/material.dart';
import 'package:mysql1/mysql1.dart';

class RegistrationScreen extends StatefulWidget {
  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final TextEditingController nomController = TextEditingController();
  final TextEditingController prenomController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController idPaysController = TextEditingController();
  final TextEditingController paysController = TextEditingController();
  final TextEditingController villeController = TextEditingController();
  final TextEditingController telephoneController = TextEditingController();
  final TextEditingController motDePasseController = TextEditingController();

  Future<void> insertUser() async {
    var settings = ConnectionSettings(
      host: 'localhost',
      port: 3306,
      user: 'root',
      password: '',
      db: 'free_chat',
    );

    var conn = await MySqlConnection.connect(settings);

    var results = await conn.query(
      'INSERT INTO Utilisateur (nom, prenoms, email, numero_telephone, bp, pays, ville, mot_de_passe) VALUES (?, ?, ?, ?, ?, ?, ?, ?)',
      [
        nomController.text,
        prenomController.text,
        emailController.text,
        telephoneController.text,
        idPaysController.text,
        paysController.text,
        villeController.text,
        motDePasseController.text,
      ],
    );

    print('Données insérées avec succès !');

    await conn.close();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 64),
            // Logo centré en haut
            Center(
              child: Image.asset(
                'assets/images/logo.jpeg',
                width: 200,
                height: 200,
              ),
            ),
            SizedBox(height: 32),
            // Titre "INSCRIPTION" en couleur jaune et souligné
            Center(
              child: Text(
                'INSCRIPTION',
                style: TextStyle(
                  color: Colors.yellow,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
            SizedBox(height: 32),
            // Formulaire centralisé
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 32),
              child: Column(
                children: [
                  TextFormField(
                    controller: nomController,
                    decoration: InputDecoration(
                      labelText: 'NOMS',
                      filled: true,
                      fillColor: Colors.white,
                    ),
                  ),
                  SizedBox(height: 16),
                  TextFormField(
                    controller: prenomController,
                    decoration: InputDecoration(
                      labelText: 'PRENOMS',
                      filled: true,
                      fillColor: Colors.white,
                    ),
                  ),
                  SizedBox(height: 16),
                  TextFormField(
                    controller: emailController,
                    decoration: InputDecoration(
                      labelText: 'EMAIL',
                      filled: true,
                      fillColor: Colors.white,
                    ),
                  ),
                  SizedBox(height: 16),
                  Row(
                    children: [
                      SizedBox(
                        width: 80,
                        child: TextFormField(
                          controller: idPaysController,
                          decoration: InputDecoration(
                            labelText: 'BP',
                            filled: true,
                            fillColor: Colors.white,
                          ),
                        ),
                      ),
                      SizedBox(width: 16),
                      Expanded(
                        child: TextFormField(
                          controller: paysController,
                          decoration: InputDecoration(
                            labelText: 'Pays',
                            filled: true,
                            fillColor: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 16),
                  TextFormField(
                    controller: villeController,
                    decoration: InputDecoration(
                      labelText: 'Ville',
                      filled: true,
                      fillColor: Colors.white,
                    ),
                  ),
                  SizedBox(height: 16),
                  TextFormField(
                    controller: telephoneController,
                    decoration: InputDecoration(
                      labelText: 'Numéro de téléphone',
                      filled: true,
                      fillColor: Colors.white,
                    ),
                  ),
                  SizedBox(height: 16),
                  TextFormField(
                    controller: motDePasseController,
                    decoration: InputDecoration(
                      labelText: 'Mot de passe',
                      filled: true,
                      fillColor: Colors.white,
                    ),
                    obscureText: true,
                  ),
                  SizedBox(height: 32),
                  ElevatedButton(
                    onPressed: () async {
                      await insertUser();
                    },
                    child: Text('Créer'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}