import 'package:flutter/material.dart';

class NavbarAvatar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: Container(
        child: Image.network(
            'https://thumbs.dreamstime.com/b/hombre-gris-del-placeholder-de-la-foto-persona-136701248.jpg'),
        width: 30,
        height: 30,
      ),
    );
  }
}
