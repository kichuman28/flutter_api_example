// Created by: Adwaith Jayasankar, Created at: 06-01-2025 22:47
import 'package:counter/components/actor_card.dart';
import 'package:counter/models/user_model.dart';
import 'package:counter/services/user_service.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  UserModel? info;
  bool apiCall = false;
  String userID = "";
  final textFieldController = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    textFieldController.dispose();
    super.dispose();
  }

  void getData(String userID) async {
    try {
      info = await UserService().getUser(userID);
    } catch (error) {
      print(error);
    }

    apiCall = false;
    if (info != null) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: 150.0, right: 150.0),
              child: TextField(
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15.0),
                    borderSide: const BorderSide(color: Colors.green, width: 3.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15.0),
                    borderSide: const BorderSide(color: Colors.green, width: 3.0),
                  ),
                  hintText: 'User ID',
                ),
                controller: textFieldController,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor: WidgetStateProperty.all(Colors.blue), // Change button color
              ),
              onPressed: () {
                setState(() {
                  apiCall = true;
                });
                getData(textFieldController.text);
              },
              child: Text(
                "Fetch User",
                style: TextStyle(color: Colors.white),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            apiCall == true
                ? CircularProgressIndicator()
                : info == null
                    ? Text("Enter a user ID and click to get the user details")
                    : info!.success
                        ? ActorCard(info: info)
                        : Text(info!.error)
          ],
        ),
      ),
    );
  }
}
