import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:admin_dashboard/providers/carrera_corredores_provider.dart';
import 'package:admin_dashboard/datatables/corredores_carrera_datasource.dart';
import 'package:admin_dashboard/ui/modals/carreras_modal.dart';
import '../buttons/custom_icon_button.dart';
import '../labels/custom_labels.dart';

class CarreraCorredoresView extends StatefulWidget {
  final String id;

  const CarreraCorredoresView({super.key, required this.id});
  @override
  State<CarreraCorredoresView> createState() => _CarreraCorredoresViewState();
}

class _CarreraCorredoresViewState extends State<CarreraCorredoresView> {
  int _rowsPerPage = PaginatedDataTable.defaultRowsPerPage;

  @override
  void initState() {
    super.initState();

    Provider.of<CarreraCorredoresProvider>(context, listen: false).getCarreras();
  }

  @override
  Widget build(BuildContext context) {
    final carreras = Provider.of<CarreraCorredoresProvider>(context).corredores;
    final size = MediaQuery.of(context).size;
    ScrollController controller =
        ScrollController(keepScrollOffset: true, initialScrollOffset: 0.0);
    controller.createScrollPosition;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: ListView(
        children: [
          Text('Corredores registrados en la carrera', style: CustomLabels.h1),
          SizedBox(height: 10),
          SingleChildScrollView(
            controller: controller,
            child: PaginatedDataTable(
              columns: [
                DataColumn(label: Text('Nombre')),
                DataColumn(label: Text('ID')),
                DataColumn(label: Text('Acciones')),
              ],
              source: CorredoresCarreraDatasource(widget.id, carreras, context),
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
