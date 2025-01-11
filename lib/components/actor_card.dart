// Created by: Adwaith Jayasankar, Created at: 07-01-2025 00:51
import 'package:counter/components/text_combo.dart';
import 'package:counter/models/user_model.dart';
import 'package:flutter/material.dart';

class ActorCard extends StatelessWidget {
  const ActorCard({super.key, required this.info});

  final UserModel? info;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      color: Colors.green,
      child: SizedBox(
        width: 500,
        height: 300,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            children: [
              Container(
                width: 220,
                height: 300,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                  image: DecorationImage(
                    image: NetworkImage(info!.data!.user.profileImage),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextCombo(leftText: "Name", rightText: "${info!.data?.user.name}"),
                    TextCombo(leftText: "User ID", rightText: "${info!.data?.user.userId}"),
                    TextCombo(leftText: "Age", rightText: "${info!.data?.user.age}"),
                    TextCombo(leftText: "Profession", rightText: "${info!.data?.user.profession}")
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
