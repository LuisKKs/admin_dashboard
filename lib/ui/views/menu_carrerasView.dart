import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../datatables/carreras_datasource.dart';
import 'package:admin_dashboard/providers/carreras_provider.dart';
import '../buttons/custom_icon_button.dart';
import '../labels/custom_labels.dart';
import 'package:admin_dashboard/ui/modals/carreras_modal.dart';

class Menu_CarrerasView extends StatefulWidget {
  @override
  State<Menu_CarrerasView> createState() => _Menu_CarrerasViewState();
}

class _Menu_CarrerasViewState extends State<Menu_CarrerasView> {
  int _rowsPerPage = PaginatedDataTable.defaultRowsPerPage;

  @override
  void initState() {
    super.initState();
    Provider.of<CarrerasProvider>(context, listen: false).getCarreras();
  }

  @override
  Widget build(BuildContext context) {
    final carreraProvider = Provider.of<CarrerasProvider>(context);

    final carreras = Provider.of<CarrerasProvider>(context).carreras;
    final size = MediaQuery.of(context).size;
    ScrollController controller =
        ScrollController(keepScrollOffset: true, initialScrollOffset: 0.0);
    controller.createScrollPosition;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: ListView(
        children: [
          Text('Menu De Carreras view', style: CustomLabels.h1),
          SizedBox(height: 10),
          SingleChildScrollView(
            controller: controller,
            child: PaginatedDataTable(
              sortAscending: carreraProvider.ascending,
              sortColumnIndex: carreraProvider.sortColIndex,
              columns: [
                DataColumn(
                  label: Text('Nombre'),
                  onSort: (colIndex, _) {
                    carreraProvider.sortColIndex = colIndex;
                    carreraProvider.sort<String>((carrera) => carrera.longName);
                  },
                ),
                DataColumn(
                  label: Text('Siglas'),
                  onSort: (colIndex, _) {
                    carreraProvider.sortColIndex = colIndex;
                    carreraProvider
                        .sort<String>((carrera) => carrera.shortName);
                  },
                ),
                DataColumn(
                  label: Text('Fecha'),
                  onSort: (colIndex, _) {
                    carreraProvider.sortColIndex = colIndex;
                    carreraProvider
                        .sort<String>((carrera) => carrera.raceDate.toString());
                  },
                ),
                DataColumn(label: Text('Hora')),
                DataColumn(
                  label: Text('Responsable'),
                  onSort: (colIndex, _) {
                    carreraProvider.sortColIndex = colIndex;
                    carreraProvider
                        .sort<String>((carrera) => carrera.responsable);
                  },
                ),
                DataColumn(label: Text('Numero de Contacto')),
                DataColumn(
                  label: Text('Evento'),
                  onSort: (colIndex, _) {
                    carreraProvider.sortColIndex = colIndex;
                    carreraProvider
                        .sort<String>((carrera) => carrera.event.eventName);
                  },
                ),
                DataColumn(label: Text('Link')),
                DataColumn(label: Text('email')),
                DataColumn(label: Text('Localizacion')),
                DataColumn(label: Text('Altitud')),
                DataColumn(label: Text('Latitud')),
                DataColumn(
                  label: Text('Municipio'),
                  onSort: (colIndex, _) {
                    carreraProvider.sortColIndex = colIndex;
                    carreraProvider
                        .sort<String>((carrera) => carrera.municipality);
                  },
                ),
                DataColumn(
                  label: Text('Estado'),
                  onSort: (colIndex, _) {
                    carreraProvider.sortColIndex = colIndex;
                    carreraProvider.sort<String>((carrera) => carrera.state);
                  },
                ),
                DataColumn(label: Text('Corredores')),
                DataColumn(label: Text('Acciones')),
              ],
              source: CarrerasDatasource(carreras, context),
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
                        elevation: size.height / 2,
                        isScrollControlled: false,
                        backgroundColor: Colors.white,
                        context: context,
                        builder: (_) => CarrerasModal(
                              edit: false,
                            ));
                  },
                  text: 'Crear',
                  icon: Icons.add_outlined,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
