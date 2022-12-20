import 'package:flutter/material.dart';

import '../models/usuarios.dart';

class UsuariosDatasource extends DataTableSource {
  final List<Usuario> usuarios;

  UsuariosDatasource(this.usuarios);

  @override
  DataRow getRow(int index) {
    final Usuario user = usuarios[index];

    final image =
        Image(image: AssetImage('no-image.jpg'), width: 35, height: 35);

    return DataRow.byIndex(index: index, cells: [
      DataCell(Text(image.toString())),
      DataCell(Text(user.name)),
      DataCell(Text(user.lastname)),
      DataCell(Text(user.email)),
      DataCell(Text('cell #$index')),
    ]);
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => usuarios.length;

  @override
  int get selectedRowCount => 0;
}
