import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
     final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Container(
      width: width,
      height: height * 0.05,
      margin: const EdgeInsets.only(top: 40),
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: const Row(
        children: [
          Icon(FontAwesomeIcons.chevronLeft),
          Spacer(),
          Icon(FontAwesomeIcons.comment),
          SizedBox(width: 20),
          Icon(FontAwesomeIcons.headphones),
           SizedBox(width: 20),
          // ignore: deprecated_member_use
          Icon( FontAwesomeIcons.externalLink),
        ],
      ),
    );
  }
}
