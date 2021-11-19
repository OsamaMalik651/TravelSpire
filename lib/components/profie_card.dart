import 'package:flutter/material.dart';

class ProfileCard extends StatefulWidget {
  final String ImageAddress;
  final String CardTitle;
  final String CardBodyText;
  bool isSelected;

  // const ProfileCard({
  //   Key? key,
  // }) : super(key: key);
  ProfileCard(
      {required this.ImageAddress,
      required this.CardTitle,
      required this.CardBodyText,
      required this.isSelected});

  @override
  State<ProfileCard> createState() => _ProfileCardState();
}

class _ProfileCardState extends State<ProfileCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: widget.isSelected
          ? (RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
              side: BorderSide(
                color: Color(0xFF00FFB1),
                width: 3,
              )))
          : RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
      elevation: 6,
      child: SizedBox(
        width: double.infinity,
        height: 140,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Container(
              margin: EdgeInsets.symmetric(vertical: 4, horizontal: 10),
              child: Image(
                image: AssetImage(widget.ImageAddress),
                width: 120,
              ),
            ),
            Flexible(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(
                    height: 30,
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 2, horizontal: 4),
                    child: Text(
                      widget.CardTitle,
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 2, horizontal: 4),
                    child: Text(
                      widget.CardBodyText,
                      style: TextStyle(fontSize: 12),
                      maxLines: 4,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
      color: Colors.white,
    );
  }
}
