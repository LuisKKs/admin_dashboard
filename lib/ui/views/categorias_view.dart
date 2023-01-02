import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:admin_dashboard/providers/categorias_provider.dart';
import 'package:admin_dashboard/datatables/categorias_carrera_datasource.dart';
import 'package:admin_dashboard/ui/modals/categorias_modal.dart';
import '../labels/custom_labels.dart';
import '../buttons/custom_icon_button.dart';


class CategoriasView extends StatefulWidget {
  @override
  State<CategoriasView> createState() => _CategoriasViewState();
}

class _CategoriasViewState extends State<CategoriasView> {
    int _rowsPerPage = PaginatedDataTable.defaultRowsPerPage;
  @override
  void initState() {
    super.initState();
    Provider.of<CategoriasProvider>(context, listen: false).getCategorias();
  }

  @override
  Widget build(BuildContext context) {
    final categorias = Provider.of<CategoriasProvider>(context).categorias;
    final size = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: ListView(
        physics: ClampingScrollPhysics(),
        children: [
          Text('Tipos de carreras view', style: CustomLabels.h1),
          SizedBox(height: 10),
          PaginatedDataTable(
            columns: [
              DataColumn(label: Text('Categoria')),
              DataColumn(label: Text('Tipo de carrera')),
              DataColumn(label: Text('Rama')),
              DataColumn(label: Text('Descripción')),
              DataColumn(label: Text('Acciones'))
            ],
            source: CategoriasDataSource(categorias, context),
            header: Text('Categorias de la carrera', maxLines: 2),
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
                      builder: (_) => CategoriaModal(
                            edit: false,
                          ));
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