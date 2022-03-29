import 'package:flutter/material.dart';
// import 'package:flutter_sqflite/models/user.dart';
import 'package:flutter_sqflite/screens/home_screen.dart';

// import 'utils/database_helper.dart';

List? _users;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // var db = DatabaseHelper();

  //Add user
  // int saveduser = await db.saveUser(User("Soe", "soe123"));
  // debugPrint("User saved $saveduser");

  // int? count = await db.getCount();
  // debugPrint("Count $count");

  // // Retrieving a user
  // User? ana = await db.getUser(1);
  // print("Got ID: ${ana!.id}");

  // //Update a user
  //  User anaUpdated = User.fromMap({
  //   "username": "UpdatedAna",
  //   "password": "updatedPassword",
  //   "id": 1
  // });

  // await db.updateUser(ana);

  // Delete a user
  // int userDeleted = await db.deleteUser(2);
  // print("Deleted: $userDeleted");

  // Get all users
  // _users = await db.getAllUsers();
  // for(int i = 0; i < _users!.length; i++) {
  //   User user = User.map(_users![i]);

  //   debugPrint("Username: ${user.username}, UserId: ${user.id}");
  // }

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Demo",
      theme: ThemeData(
        primarySwatch: Colors.blue,
        textTheme: Theme.of(context).textTheme.apply(bodyColor: Colors.white)
      ),
      home: const HomeScreen() ,
    );
  }
}

