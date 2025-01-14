// Created by: Adwaith Jayasankar, Created at: 06-01-2025 22:47
import 'package:counter/components/actor_card.dart';
import 'package:counter/providers/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../enums/api_status_enum.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
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

  @override
  Widget build(BuildContext context) {
    return Consumer<UserProvider>(
      builder: (context, userModel, child) => Scaffold(
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
                  userModel.getData(_textFieldController.text);
                },
                child: Text(
                  "Fetch User",
                  style: TextStyle(color: Colors.white),
                ),
              ),
              SizedBox(height: 20),
              if (userModel.status == Status.loading)
                const CircularProgressIndicator()
              else if (userModel.status == Status.initial)
                const Text("Enter a user ID and click to get the user details")
              else if (userModel.status == Status.success)
                ActorCard(info: userModel.info)
              else if (userModel.status == Status.error)
                Text(userModel.info?.error ?? 'An unexpected error occurred'),
            ],
          ),
        ),
      ),
    );
  }
}
