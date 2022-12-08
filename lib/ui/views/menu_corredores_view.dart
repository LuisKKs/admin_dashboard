import 'package:flutter/material.dart';

import '../buttons/custom_icon_button.dart';
import '../labels/custom_labels.dart';
import '../modals/evento_modal.dart';

class Menu_CorredoresView extends StatefulWidget  {
  @override
  
  State<Menu_CorredoresView> createState() => _Menu_CorredoresViewState();

}

class _Menu_CorredoresViewState extends State<Menu_CorredoresView> {

  int _rowsPerPage = PaginatedDataTable.defaultRowsPerPage;

  @override
  void initState() {
    super.initState();

    //Provider.of<EventosProvider>(context, listen: false).getEventos();
  }

  @override
  Widget build(BuildContext context) {
    //final eventos = Provider.of<EventosProvider>(context).eventos;

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: ListView(
        physics: ClampingScrollPhysics(),
        children: [
          Text('Menu De Eventos view', style: CustomLabels.h1),
          SizedBox(height: 10),
          PaginatedDataTable(
            columns: [
              DataColumn(label: Text('Nombre')),
              DataColumn(label: Text('Nombre Del Evento')),
              DataColumn(label: Text('Fecha Inicio')),
              DataColumn(label: Text('Fehca Final')),
              DataColumn(label: Text('Hora Del Evento')),
              DataColumn(label: Text('Logotipo')),
              DataColumn(label: Text('Acciones')),
            ],
            source: EventosDatasource(eventos, context),
            header: Text('Eventos Disponibles', maxLines: 2),
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
