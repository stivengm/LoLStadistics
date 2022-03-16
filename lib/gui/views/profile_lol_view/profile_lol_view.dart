import 'package:flutter/material.dart';

class ProfileLolView extends StatelessWidget {
  const ProfileLolView({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          const Text("Profile Lol"),
          IconButton(
            icon: const Icon(
              Icons.add
            ),
            onPressed: () => Navigator.pushNamed(context, 'maestryLoLAccount'),
          )
        ],
      ),
    );
  }
}