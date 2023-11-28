import 'package:flutter/material.dart';

class PaymentScreen extends StatefulWidget {
  @override
  _PaymentScreenState createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        titleSpacing: 0.0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Nous sommes là pour vous',
              style: TextStyle(color: Colors.white, fontSize: 18.0),
            ),
            SizedBox(width: 32.0),
            Image.asset(
              'assets/images/logo.jpeg',
              width: 100.0,
              height: 100.0,
            ),
          ],
        ),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 16.0),
          Text(
            'Mon compte',
            style: TextStyle(fontSize: 18.0, color: Colors.black),
          ),
          SizedBox(height: 8.0),
          Card(
            elevation: 2.0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10.0),
                topRight: Radius.circular(10.0),
              ),
            ),
            child: Column(
              children: [
                ListTile(
                  leading: Icon(Icons.account_circle),
                  title: Text('Modifier le code secret'),
                  onTap: () {
                    // Fonctionnalité : Modifier le code secret
                  },
                ),
                ListTile(
                  leading: Icon(Icons.credit_card),
                  title: Text('Crédits'),
                  onTap: () {
                    // Fonctionnalité : Crédits
                  },
                ),
                ListTile(
                  leading: Icon(Icons.location_on),
                  title: Text('Nos agences'),
                  onTap: () {
                    // Fonctionnalité : Nos agences
                  },
                ),
                ListTile(
                  leading: Icon(Icons.language),
                  title: Text('Langues'),
                  onTap: () {
                    // Fonctionnalité : Langues
                  },
                ),
                ListTile(
                  leading: Icon(Icons.logout),
                  title: Text('Me déconnecter'),
                  onTap: () {
                    // Fonctionnalité : Me déconnecter
                  },
                ),
                ListTile(
                  leading: Icon(Icons.info),
                  title: Text('Infos'),
                  onTap: () {
                    // Fonctionnalité : Infos
                  },
                ),
                Divider(),
                ListTile(
                  leading: Icon(Icons.help),
                  title: Text('Assistance'),
                  onTap: () {
                    // Fonctionnalité : Assistance
                  },
                ),
              ],
            ),
          ),
          Expanded(child: Container()), // Utilisation du widget Expanded pour occuper l'espace restant
          Container(
            color: Colors.yellow,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                buildNavItem(Icons.home, 'Accueil', 0),
                buildNavItem(Icons.credit_card, 'Cartes', 1),
                buildNavItem(Icons.money, 'Virement', 2),
                buildNavItem(Icons.search, 'QRCODE', 3),
                buildNavItem(Icons.add, 'Plus', 4),
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