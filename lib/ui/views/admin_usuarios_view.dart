import 'package:admin_dashboard/providers/usuarios_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../datatables/usuarios_datasource.dart';
import '../buttons/custom_icon_button.dart';
import '../labels/custom_labels.dart';
import '../modals/evento_modal.dart';

class Admin_UsuariosView extends StatefulWidget {
  @override
  State<Admin_UsuariosView> createState() => _Admin_UsuariosViewState();
}

class _Admin_UsuariosViewState extends State<Admin_UsuariosView> {
  int _rowsPerPage = PaginatedDataTable.defaultRowsPerPage;

  @override
  void initState() {
    super.initState();

    Provider.of<UsuariosProvider>(context, listen: false).getUsuarios();
  }

  @override
  Widget build(BuildContext context) {
    final usuarios = Provider.of<UsuariosProvider>(context).usuarios;

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: ListView(
        physics: ClampingScrollPhysics(),
        children: [
          Text('Menu De Usuarios view', style: CustomLabels.h1),
          SizedBox(height: 10),
          PaginatedDataTable(
            columns: [
              DataColumn(label: Text('Nombre')),
              DataColumn(label: Text('Apellidos')),
              DataColumn(label: Text('Correo')),
              DataColumn(label: Text('Status')),
              DataColumn(label: Text('Telefono')),
              DataColumn(label: Text('Rol')),
              DataColumn(label: Text('Acciones')),
            ],
            source: UsuariosDatasource(usuarios, context),
            header: Text('Corredores Disponibles', maxLines: 2),
            onRowsPerPageChanged: (value) {
              setState(() {
                _rowsPerPage = value ?? 10;
              });
            },
            rowsPerPage: _rowsPerPage,
            actions: [
              CustomIconButton(
                onPressed: () {
                  showModalBottomSheet(
                      backgroundColor: Colors.transparent,
                      context: context,
                      builder: (_) => EventoModal());
                },
                text: 'Crear',
                icon: Icons.add_outlined,
              )
            ],
          )
        ],
      ),
    );
  }
}
