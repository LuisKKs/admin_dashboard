import 'package:admin_dashboard/ui/cards/white_card.dart';
import 'package:admin_dashboard/ui/labels/custom_labels.dart';
import 'package:flutter/material.dart';

class Tipos_CarrerasView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: ListView(
        physics: ClampingScrollPhysics(),
        children: [
          Text('Tipos De Carreras', style: CustomLabels.h1),
          SizedBox(height: 10),
          WhiteCard(title: 'sales statics', child: Text('hola mundo'))
        ],
      ),
    );
  }
}
