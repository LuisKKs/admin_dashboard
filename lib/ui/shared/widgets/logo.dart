import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Logo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          //Icon(Icon.bubble_chart_outlined, color:Color (0xff7A6BF5))
          Icon(emoji_events_outlined),
          SizedBox(width: 10),
          Text('INICIO',
              style: GoogleFonts.montserratAlternates(
                  fontSize: 20,
                  fontWeight: FontWeight.w200,
                  color: Colors.white)),
        ],
      ),
    );
  }

  static const IconData emoji_events_outlined =
      IconData(0xf01a, fontFamily: 'MaterialIcons');
}
