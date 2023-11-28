import 'package:flutter/material.dart';

class AccountPage extends StatefulWidget {
  @override
  _AccountPageState createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.1,
            color: Colors.yellow,
            child: Center(
              child: Text(
                'Ma Carte',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
          ),
          Expanded(
            child: Container(
              color: Colors.black,
              child: Padding(
                padding: EdgeInsets.all(60),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(child: Container()),
                    Center(
                      child: Container(
                        width: 500,
                        height: 300,
                        decoration: BoxDecoration(
                          color: Color.fromRGBO(7, 7, 7, 0.91),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(16),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Image.asset(
                                'assets/images/logo.jpeg',
                                width: 150,
                                height: 150,
                              ),
                              SizedBox(height: 16),
                              Text(
                                'patrice neussi',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                              SizedBox(height: 4),
                              Text(
                                '1234 5678 9012 3456',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 32),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Icon(
                          Icons.credit_card,
                          size: 60,
                          color: Colors.white,
                        ),
                        SizedBox(width: 16),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Votre carte expire le 12/2025',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.white,
                                ),
                              ),
                              SizedBox(height: 8),
                              Text(
                                'Blocage temporaire de ma carte',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(width: 16),
                        Icon(
                          Icons.lock,
                          size: 60,
                          color: Colors.white,
                        ),
                      ],
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