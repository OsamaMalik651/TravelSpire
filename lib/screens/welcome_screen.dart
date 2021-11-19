import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:travel_spire_practice/screens/profile_screen.dart';
import '../IntroData.dart';

final List<IntroData> introData = [
  IntroData(
    imgAddress: 'assets/images/image1.png',
    title: 'Welcome to TravelSpire',
    bodyText:
        'A mobile experience for travelers to personalise and curate travel recommendations.',
    isSelected: true,
  ),
  IntroData(
    imgAddress: 'assets/images/image2.png',
    title: 'Your Journey. Your Profile',
    bodyText:
        'At TravelSpire, we use AI (Artificial Intelligence), to curate search results to you.',
    isSelected: true,
  )
];

class WelcomeScreen extends StatefulWidget {
  static String id = 'welcome_screen';
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  int _current = 0;
  final CarouselController _controller = CarouselController();
  final ButtonStyle style = ElevatedButton.styleFrom(
      minimumSize: Size(274, 48),
      primary: Color(0xFFFFBA5C),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
      textStyle: const TextStyle(fontSize: 20));
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TravelSpire',
      home: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              CarouselSlider(
                options: CarouselOptions(
                  viewportFraction: 1,
                  height: 450,
                  onPageChanged: (index, reason) {
                    setState(() {
                      _current = index;
                    });
                  },
                ),
                items: introData.map((i) {
                  return Builder(
                    builder: (BuildContext context) {
                      return Container(
                          width: MediaQuery.of(context).size.width,
                          margin: EdgeInsets.symmetric(horizontal: 5.0),
                          child: Column(
                            children: <Widget>[
                              Expanded(
                                flex: 1,
                                child: Image(
                                  image: AssetImage(
                                    "${i.imgAddress}",
                                  ),
                                ),
                              ),
                              Text(
                                '${i.title}',
                                style: TextStyle(
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.bold),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 2, horizontal: 80),
                                child: Text(
                                  "${i.bodyText}",
                                  style: TextStyle(
                                    fontSize: 15.0,
                                    fontWeight: FontWeight.w300,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ],
                          ));
                    },
                  );
                }).toList(),
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: introData.asMap().entries.map((entry) {
                  return GestureDetector(
                    onTap: () => _controller.animateToPage(entry.key),
                    child: Container(
                      width: 8.0,
                      height: 8.0,
                      margin:
                          EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: (Theme.of(context).brightness ==
                                      Brightness.dark
                                  ? Colors.white
                                  : Colors.blue)
                              .withOpacity(_current == entry.key ? 0.9 : 0.4)),
                    ),
                  );
                }).toList(),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                style: style,
                onPressed: () {
                  Navigator.pushNamed(context, ProfileScreen.id);
                },
                child: const Text(
                  'CHOOSE TRAVELLER PROFILE',
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
