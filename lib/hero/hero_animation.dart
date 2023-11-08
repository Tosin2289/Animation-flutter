// ignore_for_file: public_member_api_docs, sort_constructors_first
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
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) {
                    return SecondScreen(
                        text: profile.name, img: profile.img, age: profile.age);
                  },
                ));
              },
              leading: Hero(
                tag: profile.img,
                child: CircleAvatar(
                  backgroundImage: AssetImage(profile.img),
                ),
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
  final String text;
  final String img;
  final String age;
  const SecondScreen({
    Key? key,
    required this.text,
    required this.img,
    required this.age,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Hero(
              tag: img,
              child: Image(
                image: AssetImage(img),
                height: 300,
              ),
            ),
            Text(
              text.toUpperCase(),
              style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            Text(
              age,
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
