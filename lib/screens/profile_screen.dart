import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:travel_spire_practice/components/profie_card.dart';

import '../IntroData.dart';

final List<IntroData> ProfileCards = [
  IntroData(
      imgAddress: 'assets/images/PartyMonkey.png',
      title: 'Party Monkey',
      bodyText: 'Clubs, live music, raves,',
      isSelected: false),
  IntroData(
      imgAddress: 'assets/images/Chameleon.png',
      title: 'Chameleon',
      bodyText:
          'Someone who wants to blend in with the locals, find local, non-touristy hotspots.',
      isSelected: false),
  IntroData(
      imgAddress: 'assets/images/NatureLover.png',
      title: 'Nature lover',
      bodyText: 'Hikes, trails, viewpoints,parks, etc.',
      isSelected: false),
  IntroData(
      imgAddress: 'assets/images/Culturist.png',
      title: 'Culturist',
      bodyText:
          'Individuals who are into art,music exhibits, galleries. Who might be interested in certain types of events happening.',
      isSelected: false),
  IntroData(
      imgAddress: 'assets/images/Relaxer.png',
      title: 'Relaxer',
      bodyText:
          'Individuals looking for a more ‘chill’ holiday. Beaches, parks, spas.',
      isSelected: false),
  IntroData(
      imgAddress: 'assets/images/Adventurer.png',
      title: 'Adventurer',
      bodyText:
          'individuals looking for thrills, surfing, camping, hiking, water sports.',
      isSelected: false),
  IntroData(
      imgAddress: 'assets/images/UrbanExplorer.png',
      title: 'Urban Explorer',
      bodyText:
          'cool things in the city to check out such as architecture, interesting streets, landmarks,monuments, city squares.',
      isSelected: false),
  IntroData(
      imgAddress: 'assets/images/Foodie.png',
      title: 'Foodie',
      bodyText:
          'Values unique dining experiences, good food, hip restaurants, hole-in-wall spots, authenticity',
      isSelected: false),
];

class ProfileScreen extends StatefulWidget {
  static String id = 'profile_screen';
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  int currentIndex = 0;

  void clearIndices() {
    ProfileCards.forEach((element) {
      element.isSelected = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFE5E5E5),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            AppBar(
              automaticallyImplyLeading: false,
              title: Center(
                child: Column(
                  children: <Widget>[
                    Text(
                      "Your Traveller Profile",
                      style: TextStyle(fontSize: 20, color: Colors.black),
                    ),
                    // SizedBox(height: 10),
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 40),
                      child: Text(
                        "Please choose a profile that fits your traveling style.",
                        style: TextStyle(fontSize: 15, color: Colors.black),
                        maxLines: 2,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ),
              backgroundColor: Colors.white,
              toolbarHeight: 120,
            ),
            Expanded(
              child: ListView.builder(
                padding: EdgeInsets.all(8),
                scrollDirection: Axis.vertical,
                itemCount: ProfileCards.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      final snackBar = SnackBar(
                        backgroundColor: Colors.white,
                        duration: Duration(minutes: 10),
                        content: Container(
                          margin:
                              EdgeInsets.symmetric(vertical: 16, horizontal: 5),
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              elevation: 6,
                              minimumSize: Size(260, 48),
                              primary: Color(0xFFFFBA5C),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(25),
                              ),
                            ),
                            onPressed: () {
                              print(ProfileCards[index].title);
                            },
                            child: Text(
                              "Choose Traveller Profile".toUpperCase(),
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ),
                      );
                      ScaffoldMessenger.of(context)
                        ..hideCurrentSnackBar()
                        ..showSnackBar(snackBar);
                      setState(() {
                        clearIndices();
                        ProfileCards[index].isSelected =
                            !ProfileCards[index].isSelected;
                      });
                    },
                    child: ProfileCard(
                      ImageAddress: ProfileCards[index].imgAddress,
                      CardTitle: ProfileCards[index].title,
                      CardBodyText: ProfileCards[index].bodyText,
                      isSelected: ProfileCards[index].isSelected ? true : false,
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
