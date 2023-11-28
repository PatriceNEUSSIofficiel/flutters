import 'package:flutter/material.dart';

class StatistiqueScreen extends StatefulWidget {
  @override
  _StatistiqueScreenState createState() =>_StatistiqueScreenState();
}

class _StatistiqueScreenState extends State<StatistiqueScreen> {
  bool isBalanceVisible = false;
  double accountBalance = 3588000;
  int _selectedIndex = 0;



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/imapp.jpeg'), // Replace 'assets/background_image.jpg' with your own image path
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Center(
                      child: Container(
                        width: double.infinity,
                        constraints: BoxConstraints(
                          maxWidth: 400.0,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.yellow,
                          borderRadius: BorderRadius.circular(50.0),
                        ),
                        padding: EdgeInsets.all(8),
                        margin: EdgeInsets.symmetric(vertical: 20.0),
                        child: Column(
                          children: [
                            Text(
                              'Compte personnel',
                              style: TextStyle(
                                color: const Color.fromARGB(255, 35, 35, 35),
                                fontSize: 24.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 8.0),
                            Container(
                              width: 250.0,
                              height: 2.0,
                              color: Colors.black,
                            ),
                            SizedBox(height: 12.0),
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  isBalanceVisible = !isBalanceVisible;
                                });
                              },
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    isBalanceVisible ? Icons.visibility : Icons.visibility_off,
                                    color: const Color.fromARGB(255, 5, 5, 5),
                                  ),
                                  SizedBox(width: 8.0),
                                  Text(
                                    isBalanceVisible ? 'XAF ${accountBalance.toStringAsFixed(2)}' : 'XAF **********',
                                    style: TextStyle(
                                      color: const Color.fromARGB(255, 4, 4, 4),
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
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
              ),
            ),
          ],
        ),
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