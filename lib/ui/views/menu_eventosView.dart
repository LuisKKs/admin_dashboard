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
              columns: [
                DataColumn(label: Text('Nombre')),
                DataColumn(label: Text('Nombre Del Evento')),
                DataColumn(label: Text('Fecha Inicio')),
                DataColumn(label: Text('Fehca Final')),
                DataColumn(label: Text('Hora Del Evento')),
                DataColumn(label: Text('Logotipo')),
                DataColumn(label: Text('Organizadores')),
                DataColumn(label: Text('Correo')),
                DataColumn(label: Text('Telefono')),
                DataColumn(label: Text('Pagina')),
                DataColumn(label: Text('Pais')),
                DataColumn(label: Text('Estado')),
                DataColumn(label: Text('Tipo de Carrera')),
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
