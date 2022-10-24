import 'package:admin_dashboard/ui/cards/white_card.dart';
import 'package:admin_dashboard/ui/labels/custom_labels.dart';
import 'package:flutter/material.dart';

class Menu_EventosView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        physics: ClampingScrollPhysics(),
        children: [
          Text('Menu De Eventos view', style: CustomLabels.h1),
          SizedBox(height: 10),
          WhiteCard(title: 'sales statics', child: Text('hola mundo'))
        ],
      ),
    );
  }
}
