import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';

class QRCodePage extends StatefulWidget {
  @override
  _QRCodePageState createState() => _QRCodePageState();
}

class _QRCodePageState extends State<QRCodePage> {
  int _selectedIndex = 0;

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            color: Colors.yellow,
            padding: EdgeInsets.all(32),
            child: Row(
              children: [
                Icon(
                  Icons.person,
                  color: Colors.black,
                ),
                SizedBox(width: 32),
                Text(
                  
                  'Nom de l\'utilisateur',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 32,
                    decoration: TextDecoration.underline,
                    decorationColor: Colors.black,
                    decorationThickness: 2.0,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 40),
          Text(
            'Scan QR Code',
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
            ),
          ),
          SizedBox(height: 16),
          Image.asset(
            'assets/images/QRcode.jpg',
            width: 200,
            height: 200,
          ),
          SizedBox(height: 16),
          Icon(
            Icons.camera_alt,
            color: Colors.white,
            size: 40,
          ),
          Expanded(child: Container()),
          Container(
            color: Colors.yellow,
            padding: EdgeInsets.symmetric(vertical: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                buildNavItem(Icons.home, 'Accueil', 0),
                buildNavItem(Icons.credit_card, 'Cartes', 1),
                buildNavItem(Icons.money, 'Virement', 2),  // Nouveau bouton "Virement" avec une icône personnalisée
                buildNavItem(Icons.search, 'QRcode', 3),  // Mis à jour de l'index pour le bouton "Recherche"
                buildNavItem(Icons.add, 'Plus', 4),  // Mis à jour de l'index pour le bouton "Plus"
              ],
            ),
          ),
          SizedBox(height: 8),
          Container(
            color: const Color.fromARGB(255, 9, 9, 9),
            padding: EdgeInsets.all(16),
            alignment: Alignment.center,
            child: Text(
              '©copyright',
              style: TextStyle(
                color: Colors.yellow,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildNavItem(IconData icon, String label, int index) {
    Color itemColor = _selectedIndex == index ? Colors.white : Colors.black;
    return GestureDetector(
      onTap: () => _onNavItemTapped(index),
      child: Column(
        children: [
          Icon(
            icon,
            color: itemColor,
            size: 32,
          ),
          SizedBox(height: 4),
          Text(
            label,
            style: TextStyle(
              color: itemColor,
            ),
          ),
        ],
      ),
    );
  }
  
void _onNavItemTapped(int index) {
  setState(() {
    _selectedIndex = index;
    switch (index) {
      case 0:
        Navigator.pushNamed(context, '/statistique');
        break;
      case 1:
        Navigator.pushNamed(context, '/card_info');
        break;
      case 2:
        Navigator.pushNamed(context, '/transaction');  // Navigation vers transaction_screen.dart pour le bouton "Virement"
        break;
      case 3:
        Navigator.pushNamed(context, '/barcode');
        break;
      case 4:
        Navigator.pushNamed(context, '/options');
        break;
    }
  });
}
}