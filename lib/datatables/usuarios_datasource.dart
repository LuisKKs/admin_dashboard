import 'package:flutter/material.dart';
import '../models/usuarios.dart';

class UsuariosDatasource extends DataTableSource {
  final List<Usuario> usuarios;
  final BuildContext context;
  UsuariosDatasource(this.usuarios, this.context);

  @override
  DataRow getRow(int index) {
    final usuario = this.usuarios[index];

    return DataRow.byIndex(index: index, cells: [
      DataCell(Text(usuario.name)),
      DataCell(Text(usuario.lastname)),
      DataCell(Text(usuario.email)),
      DataCell(Text(usuario.status.toString())),
      DataCell(Text(usuario.phonenumber.toString())),
      DataCell(Text(usuario.role.toString())),
      DataCell(Row(
        verticalDirection: VerticalDirection.up,
        children: [
          IconButton(
              icon: Icon(Icons.edit_outlined),
              onPressed: () {
                print('editando: $usuario');
              }),
          IconButton(
              icon: Icon(
                Icons.delete_outlined,
                color: Colors.red.withOpacity(0.8),
              ),
              onPressed: () {
                final dialog = AlertDialog(
                  title: Text('¿Esta seguro de borrarlo?'),
                  content: Text('Borrar definitivamente ${usuario.name}?'),
                  actions: [
                    TextButton(
                      child: Text('No'),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                    TextButton(
                      child: Text('Si, borrar'),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                  ],
                );

                showDialog(context: context, builder: (_) => dialog);
              }),
        ],
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
