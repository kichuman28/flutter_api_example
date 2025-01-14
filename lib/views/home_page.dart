// Created by: Adwaith Jayasankar, Created at: 06-01-2025 22:47
import 'package:counter/components/actor_card.dart';
import 'package:counter/models/user_model.dart';
import 'package:counter/services/user_service.dart';
import 'package:flutter/material.dart';

enum Status {
  initial,
  success,
  error,
  loading,
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  UserModel? info;
  Status apiStatus = Status.initial;
  late TextEditingController _textFieldController;
  OutlineInputBorder textFieldColor = OutlineInputBorder(
    borderSide: const BorderSide(color: Colors.green, width: 3.0),
    borderRadius: BorderRadius.circular(15.0),
  );

  @override
  void initState() {
    // TODO: implement initState
    _textFieldController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _textFieldController.dispose();
    super.dispose();
  }

  void getData(String userID) async {
    setState(() {
      apiStatus = Status.loading;
    });

    info = await UserService.getUser(userID);
    if (info != null && info!.success) {
      setState(() {
        apiStatus = Status.success;
      });
    } else {
      setState(() {
        apiStatus = Status.error;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 150.0, right: 150.0),
              child: TextField(
                decoration: InputDecoration(
                  enabledBorder: textFieldColor,
                  focusedBorder: textFieldColor,
                  hintText: 'User ID',
                ),
                controller: _textFieldController,
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor: WidgetStateProperty.all(Colors.blue),
              ),
              onPressed: () {
                getData(_textFieldController.text);
              },
              child: Text(
                "Fetch User",
                style: TextStyle(color: Colors.white),
              ),
            ),
            SizedBox(height: 20),
            if (apiStatus == Status.loading)
              const CircularProgressIndicator()
            else if (apiStatus == Status.initial)
              const Text("Enter a user ID and click to get the user details")
            else if (apiStatus == Status.success)
              ActorCard(info: info)
            else if (apiStatus == Status.error)
              Text(info?.error ?? 'An unexpected error occurred'),
          ],
        ),
      ),
    );
  }
}
