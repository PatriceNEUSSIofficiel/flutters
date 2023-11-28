import 'package:flutter/material.dart';
import 'transaction_screen.dart';
import 'statistique_screen.dart';


class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String password = '';
  bool rememberMe = false;

  void _updatePassword(String value) {
    setState(() {
      password = value;
    });
  }

  void _toggleRememberMe(bool value) {
    setState(() {
      rememberMe = value;
    });
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
                width: 250,
                height: 250,
              ),
            ),
            SizedBox(height: 24),
            // Input en blanc avec bordure réduite
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 25),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: TextField(
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Nom d\'utilisateur',
                    contentPadding: EdgeInsets.all(16),
                  ),
                ),
              ),
            ),
            SizedBox(height: 16),
            // Petit cercle blanc à cocher et texte "Se souvenir de moi"
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    _toggleRememberMe(!rememberMe);
                  },
                  child: Container(
                    width: 20,
                    height: 20,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: rememberMe ? Colors.yellow : Colors.white,
                      border: Border.all(color: Colors.black),
                    ),
                    child: rememberMe
                        ? Icon(Icons.check, size: 14, color: Colors.black)
                        : null,
                  ),
                ),
                SizedBox(width: 8),
                Text(
                  'Se souvenir de moi',
                  style: TextStyle(color: Colors.white),
                ),
              ],
            ),
            SizedBox(height: 24),
            // Bouton jaune "Suivant"
            ElevatedButton(
              onPressed: () {
                // Action à effectuer lors du clic sur le bouton
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.yellow,
                padding: EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: Text('Suivant'),
            ),
            SizedBox(height: 32),
            // Petit cercle avec bordures blanches et icône de personne
            Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
                border: Border.all(color: Colors.white),
              ),
              child: Icon(Icons.person, color: Colors.black),
            ),
            SizedBox(height: 16),
            // 6 petits ronds pour le mot de passe
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                6,
                (index) => Container(
                  width: 20,
                  height: 20,
                  margin: EdgeInsets.symmetric(horizontal: 4),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: const Color.fromARGB(255, 11, 11, 11),
                    border: Border.all(color: Colors.white),
                  ),
                  child: index < password.length
                      ? Container(
                          width: 12,
                          height: 12,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Color.fromARGB(220, 250, 248, 248),
                          ),
                        )
                      : null,
                ),
              ),
            ),
            Visibility(
              visible: password.isNotEmpty,
              child: GestureDetector(
                onTap: () {
                  _updatePassword('');
                },
                child: Container(
                  width: 20,
                  height: 20,
                  margin: EdgeInsets.symmetric(horizontal: 4),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                    border: Border.all(color: Colors.white),
                  ),
                  child: Icon(Icons.clear, size: 14, color: Colors.black),
                ),
              ),
            ),
            SizedBox(height: 8),
            // Clavier de nombres
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _buildNumberButton('1'),
                    _buildNumberButton('2'),
                    _buildNumberButton('3'),
                    _buildNumberButton('4'),
                    _buildNumberButton('5'),
                  ],
                ),
                SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _buildNumberButton('6'),
                    _buildNumberButton('7'),
                    _buildNumberButton('8'),
                    _buildNumberButton('9'),
                    _buildNumberButton('0'),
                  ],
                ),
              ],
            ),
            SizedBox(height: 32),
            // Bouton jaune "Je me connecte"
            ElevatedButton(
              onPressed: () {
              Navigator.pushNamed(context, '/transaction'); 
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.yellow,
                padding: EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: Text('Je me connecte'),
            ),
            SizedBox(height: 16),
          ],
        ),
      ),
    );
  }

  Widget _buildNumberButton(String number) {
    return Expanded(
      child: Container(
        height: 60,
        margin: EdgeInsets.symmetric(horizontal: 4),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white,
          border: Border.all(color: Colors.white),
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            TextButton(
              onPressed: () {
                _updatePassword(password + number);
              },
              child: Text(
                number,
                style: TextStyle(fontSize: 16, color: Colors.black),
              ),
            ),
            Visibility(
              visible: password.length > 0,
              child: Positioned(
                right: 4,
                child: IconButton(
                  icon: Icon(Icons.clear),
                  onPressed: () {
                    _updatePassword(password.substring(0, password.length - 1));
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}