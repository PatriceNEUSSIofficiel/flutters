import 'package:flutter/material.dart';

class MyAccountScreen extends StatefulWidget {
  @override
  _MyAccountScreenState createState() => _MyAccountScreenState();
}

class _MyAccountScreenState extends State<MyAccountScreen> {
  bool isBalanceVisible = false;
  double accountBalance = 3588000;
  int _selectedIndex = 0;

 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          Container(
            alignment: Alignment.center,
            margin: EdgeInsets.only(top: 20.0),
            child: Image.asset(
              'assets/images/logo.jpeg',
              width: 280.0,
              height: 280.0,
            ),
          ),
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
         Expanded(
            child: Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30.0),
                topRight: Radius.circular(30.0),
              ),
              ),
              padding: EdgeInsets.all(0.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 30.0,
                      height: 2.0,
                      color: Colors.black,
                    ),
                    Text(
                      'Choisissez le type de virement',
                      style: TextStyle(
                        color: const Color.fromARGB(255, 35, 35, 35),
                        fontSize: 24.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 30.0),
                    InkWell(
                      onTap: () {
                        // Fonction à exécuter lorsque cette option est cliquée
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Icon(
                            Icons.account_balance,
                            size: 32.0,
                          ),
                          SizedBox(width: 10.0),
                          Text(
                            'Virement vers mon compte Free',
                            style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 16.0),
                    InkWell(
                      onTap: () {
                        // Fonction à exécuter lorsque cette option est cliquée
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Icon(
                            Icons.swap_horiz,
                            size: 32.0,
                          ),
                          SizedBox(width: 10.0),
                          Text(
                            'Virement vers mon compte Free à un autre compte',
                            style: TextStyle(
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 16.0),
                    InkWell(
                      onTap: () {
                        // Fonction à exécuter lorsque cette option est cliquée
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Icon(
                            Icons.history,
                            size: 32.0,
                          ),
                          SizedBox(width: 10.0),
                          Text(
                            'Historique des virements',
                            style: TextStyle(
                              fontSize: 20.0,
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
          ),
          Container(
            color: Colors.yellow,
            padding: EdgeInsets.symmetric(vertical: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                 buildNavItem(Icons.home, 'Accueil', 0),
                buildNavItem(Icons.credit_card, 'Cartes', 1),
                buildNavItem(Icons.money, 'Virement', 2),  // Nouveau bouton "Virement" avec une icône personnalisée
                buildNavItem(Icons.search, 'QRCODE', 3),  // Mis à jour de l'index pour le bouton "Recherche"
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
              '©Copyright',
              style: TextStyle(
                color: Colors.yellow,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildOptionItem(IconData icon, String label) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10.0),
      child: Row(
        children: [
          Icon(
            icon,
            color: Colors.black,
            size: 24.0,
          ),
          SizedBox(width: 12.0),
          Text(
            label,
            style: TextStyle(
              color: Colors.black,
              fontSize: 18.0,
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