import 'package:admin_dashboard/datatables/usuarios_datasource.dart';
import 'package:admin_dashboard/providers/usuarios_provider.dart';
import 'package:admin_dashboard/ui/labels/custom_labels.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Admin_UsuariosView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final usersProvider = Provider.of<UsuariosProvider>(context);

    final userDataSource = UsuariosDatasource(usersProvider.usuarios);

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: ListView(
        physics: ClampingScrollPhysics(),
        children: [
          Text(
            'User View',
            style: CustomLabels.h1,
          ),
          SizedBox(height: 10),
          PaginatedDataTable(
            sortAscending: usersProvider.ascending,
            sortColumnIndex: usersProvider.sortColIndex,
            columns: [
              DataColumn(label: Text('Avatar')),
              DataColumn(
                label: Text('Nombre'),
                onSort: (colIndex, _) {
                  usersProvider.sortColIndex = colIndex;
                  usersProvider.sort<String>((usuario) => usuario.name);
                },
              ),
              DataColumn(
                label: Text('Apellido'),
                onSort: (colIndex, _) {
                  usersProvider.sortColIndex = colIndex;
                  usersProvider.sort<String>((usuario) => usuario.lastname);
                },
              ),
              DataColumn(
                label: Text('Email'),
                onSort: (colIndex, _) {
                  usersProvider.sortColIndex = colIndex;
                  usersProvider.sort<String>((usuario) => usuario.email);
                },
              ),
              DataColumn(
                label: Text('Telefono'),
                onSort: (colIndex, _) {
                  usersProvider.sortColIndex = colIndex;
                  usersProvider.sort<String>((usuario) => usuario.phonenumber);
                },
              ),
              DataColumn(label: Text('Opciones')),
            ],
            source: userDataSource,
            onPageChanged: (page) {
              print('page: $page');
            },
          )
        ],
      ),
    );
  }
}
