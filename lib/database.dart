import 'package:mysql1/mysql1.dart';

class Database {
  static Future<MySqlConnection> getConnection() async {
    final settings = ConnectionSettings(
      host: 'localhost', //adresse IP ou le nom d'hôte de votre serveur MySQL
      port: 3306, // Port MySQL par défaut
      user: 'root', // Nom d'utilisateur MySQL
      password: '', // Mot de passe MySQL
      db: 'free_achat', // Nom de la base de données MySQL
    );

    final connection = await MySqlConnection.connect(settings);
    return connection;
  }
}




