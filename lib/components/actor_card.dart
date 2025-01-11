// Created by: Adwaith Jayasankar, Created at: 07-01-2025 00:51
import 'package:counter/models/user_model.dart';
import 'package:flutter/material.dart';

class ActorCard extends StatelessWidget {
  const ActorCard({super.key, required this.info});

  final UserModel? info;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0), // Adjust the radius as needed
      ),
      color: Colors.green,
      child: Expanded(
        child: SizedBox(
          width: 500,
          height: 300,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Expanded(
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
                  // SizedBox(
                  //   width: 15,
                  // ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 15),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          textCombo("Name", "${info!.data?.user.name}"),
                          textCombo("User ID", "${info!.data?.user.userId}"),
                          textCombo("Age", "${info!.data?.user.age}"),
                          textCombo("Profession", "${info!.data?.user.profession}")
                        ],
                      ),
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

  Widget textCombo(String leftText, String rightText) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(
          width: 75,
          child: Text(
            leftText,
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
          ),
        ),
        Text(
          ":",
          style: TextStyle(color: Colors.white),
        ),
        SizedBox(width: 8),
        SizedBox(
          child: Text(
            rightText,
            style: TextStyle(color: Colors.yellow, fontWeight: FontWeight.w600),
          ),
        ),
      ],
    );
  }
}
