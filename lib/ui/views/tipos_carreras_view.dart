import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:admin_dashboard/providers/tipo_carrera_provider.dart';
import '../../datatables/tipCar_datasource.dart';
import 'package:admin_dashboard/ui/buttons/custom_icon_button.dart';
import 'package:admin_dashboard/ui/labels/custom_labels.dart';
import '../modals/tipo_carreras_modal.dart';

class Tipos_Carreras_View extends StatefulWidget {
  @override
  State<Tipos_Carreras_View> createState() => _Tipos_CarrerasState();
}

class _Tipos_CarrerasState extends State<Tipos_Carreras_View> {
  int _rowsPerPage = PaginatedDataTable.defaultRowsPerPage;

  @override
  void initState() {
    super.initState();

    Provider.of<CatCarreraProvider>(context, listen: false).getCatCarrera();
  }

  @override
  Widget build(BuildContext context) {
    final tiposProvider = Provider.of<CatCarreraProvider>(context);

    final tipos = Provider.of<CatCarreraProvider>(context).racetypes;

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: ListView(
        physics: ClampingScrollPhysics(),
        children: [
          Text('Tipos de carreras view', style: CustomLabels.h1),
          SizedBox(height: 10),
          PaginatedDataTable(
            sortAscending: tiposProvider.ascending,
            sortColumnIndex: tiposProvider.sortColIndex,
            columns: [
              DataColumn(
                label: Text('Nombre'),
                onSort: (colIndex, _) {
                  tiposProvider.sortColIndex = colIndex;
                  tiposProvider.sort<String>((tipo) => tipo.typeName);
                },
              ),
              DataColumn(label: Text('Descripcion')),
              DataColumn(label: Text('Acciones')),
            ],
            source: TipCarDatasource(tipos, context),
            header: Text('Tipo de carreras', maxLines: 2),
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
                      builder: (_) => TipoCarrerasModal(
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
