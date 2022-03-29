import 'package:flutter/material.dart';

import '../models/user.dart';
import '../utils/database_helper.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({ Key? key }) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List _users=[];

  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();

   @override
    void initState() {
      
      // for(int i = 0; i < _users.length; i++) {
      //   User user = User.map(_users[i]);

      //   debugPrint("Username: ${user.username}, UserId: ${user.id}");
      // }
      super.initState();
      getData();
    }

    Future<void> getData() async {
      var db = DatabaseHelper();
      _users = await db.getAllUsers();
      print("User-- $_users");
    }

    addDataForm() {
      return AlertDialog(
        title: const Text("Add", style: TextStyle(color: Colors.black),),
        content: Column(
          children: [
            TextField(
              controller: username,
              decoration: const InputDecoration(
                hintText: 'Name',
                hintStyle: TextStyle(
                  fontSize: 20,
                  color: Colors.black
                )
              ),
              style: const TextStyle(
                color: Colors.black
              ),
            ),
            TextField(
              controller: password,
              decoration: const InputDecoration(
                hintText: 'Password',
                hintStyle: TextStyle(
                  fontSize: 20,
                  color: Colors.black
                )
              ),
              style: const TextStyle(
                color: Colors.black
              ),
            ),
          ],
        ),

        actions: [
          TextButton(
            child: const Text("No"),
            onPressed: (){
              Navigator.pop(context);
            },
          ),
          TextButton(
            child: const Text("Add"),
            onPressed: () {
               DatabaseHelper().saveUser(
                User(
                  username.text, 
                  password.text
                )
              );
              Navigator.pop(context);
            }, 
            
          )
        ],
        
      );
    }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Database"),
      ),

      body: ListView.builder(
        itemCount: _users.length,
        itemBuilder: (context, index) {
          return Card(
            color: Colors.white,
            elevation: 2,
            child: ListTile(
              title: Text("Name: ${User.fromMap(_users[index]).username}", 
                style: const TextStyle(color: Colors.black),
              ),
              subtitle: Text("Id: ${User.fromMap(_users[index]).id.toString()} "),
              onTap: () {
                debugPrint("${User.fromMap(_users[index]).password}");
              },
            ),
          );
        }
      ),

      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add), 
        onPressed: () {
          showDialog(
            context: context,
            builder: (_) => addDataForm()
          );
        } , 
      ),
    );
  }
}