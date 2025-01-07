// Created by: Adwaith Jayasankar, Created at: 06-01-2025 22:47
import 'package:counter/components/actor_card.dart';
import 'package:counter/models/user_model.dart';
import 'package:counter/services/user_service.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Welcome? info;
  bool apiCall = false;
  String userID = "";
  final myController = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    myController.dispose();
    super.dispose();
  }

  void getData(String userID) async {
    info = await UserService().getUser(userID);
    apiCall = false;
    if (info != null) {
      setState(() {});
    }
  }

  Widget getProperWidget() {
    if (apiCall) {
      return CircularProgressIndicator();
    } else {
      return ActorCard(info: info);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: 150.0, right: 150.0),
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'User ID',
                ),
                controller: myController,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  apiCall = true;
                });
                getData(myController.text);
              },
              child: Text("Fetch User"),
            ),
            SizedBox(
              height: 20,
            ),
            info == null
                ? Text("Enter a user ID and click to get the user details")
                : info!.success == true
                    ? getProperWidget()
                    : Text(info!.error),
          ],
        ),
      ),
    );
  }
}
