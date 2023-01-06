import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:admin_dashboard/providers/eventos_provider.dart';
import 'package:admin_dashboard/datatables/eventos_datasource.dart';
import 'package:admin_dashboard/ui/buttons/custom_icon_button.dart';
import 'package:admin_dashboard/ui/labels/custom_labels.dart';
import 'package:admin_dashboard/ui/modals/evento_modal.dart';

class Menu_EventosView extends StatefulWidget {
  @override
  State<Menu_EventosView> createState() => _Menu_EventosViewState();
}

class _Menu_EventosViewState extends State<Menu_EventosView> {
  int _rowsPerPage = PaginatedDataTable.defaultRowsPerPage;

  @override
  void initState() {
    super.initState();
    Provider.of<EventosProvider>(context, listen: false).getEventos();
  }

  @override
  Widget build(BuildContext context) {
    final eventosProvider = Provider.of<EventosProvider>(context);

    final eventos = Provider.of<EventosProvider>(context).eventos;

    final size = MediaQuery.of(context).size;
    final ScrollController controller =
        ScrollController(keepScrollOffset: true, initialScrollOffset: 0.0);
    controller.createScrollPosition;
    return Container(
      width: size.width,
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: ListView(
        children: [
          Text('Menu De Eventos view', style: CustomLabels.h1),
          SizedBox(height: 10),
          SingleChildScrollView(
            controller: controller,
            child: PaginatedDataTable(
              sortAscending: eventosProvider.ascending,
              sortColumnIndex: eventosProvider.sortColIndex,
              columns: [
                DataColumn(
                  label: Text('Nombre'),
                  onSort: (colIndex, _) {
                    eventosProvider.sortColIndex = colIndex;
                    eventosProvider
                        .sort<String>((eventos) => eventos.shortName);
                  },
                ),
                DataColumn(
                  label: Text('Nombre Del Evento'),
                  onSort: (colIndex, _) {
                    eventosProvider.sortColIndex = colIndex;
                    eventosProvider
                        .sort<String>((eventos) => eventos.eventName);
                  },
                ),
                DataColumn(
                  label: Text('Fecha Inicio'),
                  onSort: (colIndex, _) {
                    eventosProvider.sortColIndex = colIndex;
                    eventosProvider.sort<String>(
                        (eventos) => eventos.dateStart.toString());
                  },
                ),
                DataColumn(
                  label: Text('Fehca Final'),
                  onSort: (colIndex, _) {
                    eventosProvider.sortColIndex = colIndex;
                    eventosProvider.sort<String>(
                        (eventos) => eventos.dateFinish.toString());
                  },
                ),
                DataColumn(label: Text('Hora Del Evento')),
                DataColumn(label: Text('Logotipo')),
                DataColumn(
                  label: Text('Organizadores'),
                  onSort: (colIndex, _) {
                    eventosProvider.sortColIndex = colIndex;
                    eventosProvider
                        .sort<String>((eventos) => eventos.organizer);
                  },
                ),
                DataColumn(label: Text('Correo')),
                DataColumn(label: Text('Telefono')),
                DataColumn(label: Text('Pagina')),
                DataColumn(
                  label: Text('Pais'),
                  onSort: (colIndex, _) {
                    eventosProvider.sortColIndex = colIndex;
                    eventosProvider.sort<String>((eventos) => eventos.country);
                  },
                ),
                DataColumn(
                  label: Text('Estado'),
                  onSort: (colIndex, _) {
                    eventosProvider.sortColIndex = colIndex;
                    eventosProvider
                        .sort<String>((eventos) => eventos.stateCountry);
                  },
                ),
                DataColumn(
                  label: Text('Tipo de Carrera'),
                  onSort: (colIndex, _) {
                    eventosProvider.sortColIndex = colIndex;
                    eventosProvider
                        .sort<String>((eventos) => eventos.raceType.typeName);
                  },
                ),
                DataColumn(label: Text('Acciones')),
              ],
              source: EventosDatasource(eventos, context),
              header: Text('Eventos Disponibles', maxLines: 2),
              onRowsPerPageChanged: (value) {
                setState(() {
                  _rowsPerPage = value ?? 12;
                });
              },
              rowsPerPage: _rowsPerPage,
              actions: [
                CustomIconButton(
                  onPressed: () {
                    showModalBottomSheet(
                        elevation: size.height / 2,
                        isScrollControlled: false,
                        context: context,
                        builder: (context) => EventoModal(
                              edit: false,
                            )); //evento: null
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
