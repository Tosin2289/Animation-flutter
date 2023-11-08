import 'package:flutter/material.dart';

import 'images.dart';

class HeroAnimation extends StatelessWidget {
  HeroAnimation({super.key});
  List<Profile> profiles = [
    Profile(name: "Jude", img: img1, age: "20"),
    Profile(name: "Casimero", img: img2, age: "25"),
    Profile(name: "Bruno", img: img3, age: "30"),
    Profile(name: "Jack", img: img4, age: "40"),
    Profile(name: "Rashford", img: img5, age: "50"),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("Hero Animation"),
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: ListView.builder(
          itemCount: profiles.length,
          itemBuilder: (context, index) {
            final profile = profiles[index];
            return ListTile(
              leading: CircleAvatar(
                backgroundImage: AssetImage(profile.img),
              ),
              title: Text(profile.name),
              subtitle: Text(profile.age),
            );
          },
        ),
      ),
    );
  }
}

class Profile {
  final String name;
  final String img;
  final String age;

  Profile({required this.name, required this.img, required this.age});
}

class SecondScreen extends StatelessWidget {
  const SecondScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
