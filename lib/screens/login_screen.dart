import 'package:flutter/material.dart';
import 'user_home_screen.dart';

class LoginScreen extends StatelessWidget {
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
                'assets/images/log.jpeg',
                width: 200,
                height: 200,
              ),
            ),
            SizedBox(height: 32),
            // Texte "WELCOME" en couleur jaune et gras
            Text(
              'WELCOME',
              style: TextStyle(
                color: Colors.yellow,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 32),
            // Champs "username" et "password" centralisés
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 32),
              child: Column(
                children: [
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Username',
                      filled: true,
                      fillColor: Colors.white,
                    ),
                  ),
                  SizedBox(height: 16),
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Password',
                      filled: true,
                      fillColor: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 32),
            // Bouton "CONNEXION" en jaune avec texte en blanc
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LoginPage()),
                );
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.yellow,
                onPrimary: Colors.white,
              ),
              child: Text('CONNEXION'),
            ),
            SizedBox(height: 32),
            // Bouton "Login to my account" en jaune avec texte en noir
            TextButton(
              onPressed: () {
                // Action lorsque le bouton "Login to my account" est appuyé
              },
              style: TextButton.styleFrom(
                primary: Colors.black,
                backgroundColor: Colors.yellow,
              ),
              child: Text('Login to my account'),
            ),
            SizedBox(height: 16),
            // Texte "Forget password ?" en blanc
            Text(
              'Forget password ?',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            SizedBox(height: 32),
            // Texte "Register new" en jaune
            Text(
              'Register new',
              style: TextStyle(
                color: Colors.yellow,
              ),
            ),
          ],
        ),
      ),
    );
  }
}