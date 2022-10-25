import 'package:admin_dashboard/ui/cards/white_card.dart';
import 'package:admin_dashboard/ui/labels/custom_labels.dart';
import 'package:flutter/material.dart';

class Menu_CorredoresView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        physics: ClampingScrollPhysics(),
        children: [
          Text('Menu De Corredores', style: CustomLabels.h1),
          SizedBox(height: 10),
          Wrap(
            crossAxisAlignment: WrapCrossAlignment.start,
            direction: Axis.horizontal,
            children: [
              WhiteCard(
                title: 'ac_unit_outlined',
                child: Center(child: Icon(Icons.ac_unit_outlined)),
                widht: 170,
              ),
              WhiteCard(
                title: 'ac_unit_outlined',
                child: Center(child: Icon(Icons.abc_outlined)),
                widht: 170,
              ),
              WhiteCard(
                title: 'ac_unit_outlined',
                child: Center(child: Icon(Icons.access_alarm_outlined)),
                widht: 170,
              ),
              WhiteCard(
                title: 'ac_unit_outlined',
                child: Center(child: Icon(Icons.dark_mode)),
                widht: 170,
              ),
            ],
          )
        ],
      ),
    );
  }
}
