// Created by: Adwaith Jayasankar, Created at: 07-01-2025 00:51
import 'package:counter/models/user_model.dart';
import 'package:flutter/material.dart';

class ActorCard extends StatelessWidget {
  const ActorCard({super.key, required this.info});

  final Welcome? info;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 50,
      shadowColor: Colors.black,
      color: Colors.green,
      child: Expanded(
        child: SizedBox(
          width: 500,
          height: 300,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Expanded(
              child: Row(
                children: [
                  Container(
                    width: 220,
                    height: 300,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(info!.data.user.profileImage),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  // SizedBox(
                  //   width: 15,
                  // ),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text("Name: ${info!.data.user.name}"),
                        Text("User ID: ${info!.data.user.userId}"),
                        Text("Age: ${info!.data.user.age}"),
                        Text("Profession: ${info!.data.user.profession}"),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
