import 'package:admin_dashboard/services/navigation_service.dart';
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
      DataCell(ClipOval(child: image)),
      DataCell(Text(user.name)),
      DataCell(Text(user.lastname)),
      DataCell(Text(user.email)),
      DataCell(Text(user.phonenumber)),
      DataCell(IconButton(
        icon: Icon(Icons.edit_outlined),
        onPressed: (() {
          NavigationService.replaceTo(
              '/dasboard/Administracion De Usuarios/${user.uid}');
        }),
      )),
    ]);
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => usuarios.length;

  @override
  int get selectedRowCount => 0;
}
