import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:admin_dashboard/services/notifications_service.dart';
import 'package:admin_dashboard/ui/modals/carrera_corredores_modal.dart';
import '../models/http/corredores_carrera_id_response.dart';
import '../providers/carrera_corredores_provider.dart';

class CorredoresCarreraDatasource extends DataTableSource {
  final List<Result> corredores;
  final BuildContext context;
  final String id;
  CorredoresCarreraDatasource( 
      {required this.id, required this.corredores, required this.context});
  @override
  DataRow getRow(int index) {
    var corredor = corredores[index];
    return DataRow.byIndex(index: index, cells: [
      DataCell(Text(corredor.runner.phoneNumber)),
      DataCell(Text(corredor.runner.name)),
      DataCell(Text(corredor.runner.lastname)),
      DataCell(Text(corredor.runner.lastname2)),
      DataCell(Text(corredor.race.longName)),
      DataCell(Text(corredor.preRegistration)),
      DataCell(Container(
        child: TextButton(
          child: Row(
            children: [
              if (corredor.preRegistration.compareTo('Registrado').isEven)
                Text('Registro aprobado'),
              if (corredor.preRegistration.compareTo('Pre-registrado').isEven)
                Text('Aprobar registro'),
              Icon(Icons.approval_outlined)
            ],
          ),
          onPressed: () async {
            if (corredor.preRegistration.compareTo('Pre-registrado').isEven) {
              await Provider.of<CarreraCorredoresProvider>(context,
                      listen: false)
                  .updateCarrCorr(id: corredor.id, status: 'Registrado');
              Navigator.popAndPushNamed(context,'/dasboard/menu_de_carreras/carrera-corredor/${id}');
              NotificationsService.showSnackbar('Corredor Registrado!');
            } else {
              NotificationsService.showSnackbar(
                  'Este corredor ya ha sido aprobado');
            }
          },
        ),
      )),
      DataCell(Row(
        verticalDirection: VerticalDirection.up,
        children: [
          IconButton(
              icon: Icon(Icons.edit_outlined),
              onPressed: () {
                bool edit = true;
                showModalBottomSheet(
                    context: context,
                    builder: (context) {
                      return CarreraCorredoresModal(
                        edit: true,
                        carrera: corredor,
                      ); //TipoCarrerasModal(tipcar: tipo, edit: edit);
                    });
              }),
          IconButton(
              icon: Icon(
                Icons.delete_outlined,
                color: Colors.red.withOpacity(0.8),
              ),
              onPressed: () {
                final dialog = AlertDialog(
                  title: Text('¿Esta seguro de borrarlo?'),
                  content: Text('Borrar definitivamente ?'),
                  actions: [
                    TextButton(
                      child: Text('No'),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                    TextButton(
                      child: Text('Si, borrar'),
                      onPressed: () async {
                        await Provider.of<CarreraCorredoresProvider>(context,
                                listen: false)
                            .deleteCarreraCorredor(corredor.id);
                        Navigator.popAndPushNamed(context,
                            '/dasboard/menu_de_carreras/carrera-corredor/${corredor.id}');
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
  int get rowCount => corredores.length;

  @override
  int get selectedRowCount => 0;
}
