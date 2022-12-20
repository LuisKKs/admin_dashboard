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
          PaginatedDataTable(columns: [
            DataColumn(label: Text('Avatar')),
            DataColumn(label: Text('Nombre')),
            DataColumn(label: Text('Apellido')),
            DataColumn(label: Text('Email')),
            DataColumn(label: Text('Opciones')),
          ], source: userDataSource)
        ],
      ),
    );
  }
}
