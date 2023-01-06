import 'package:admin_dashboard/models/http/corredores_carrera_id_response.dart';
import 'package:admin_dashboard/router/router.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:admin_dashboard/providers/carrera_corredores_provider.dart';
import 'package:admin_dashboard/datatables/corredores_carrera_datasource.dart';
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
  late List<List<Result>> corredores;
  @override
  void initState() {
    super.initState();
  }
  @override
  void didChangeDependencies() {
    Provider.of<CarreraCorredoresProvider>(context, listen: false).getCarrerasId(widget.id);
    super.didChangeDependencies();
  }
  @override
  Widget build(BuildContext context) {
    corredores = Provider.of<CarreraCorredoresProvider>(context).cocar;
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
                DataColumn(label: Text('Teléfono')),
                DataColumn(label: Text('Nombre')),
                DataColumn(label: Text('Apellido paterno')),
                DataColumn(label: Text('Apellido materno')),
                DataColumn(label: Text('Carrera')),
                DataColumn(label: Text('Status')),
                DataColumn(label: Text('Registrar')),
                DataColumn(label: Text('Acciones')),
              ],
              source: CorredoresCarreraDatasource(corredores: corredores.single, context: context),
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
                    Navigator.popAndPushNamed(context, Flurorouter.Menu_CarrerasRoute);
                  },
                  text: 'Retroceder',
                  icon: Icons.arrow_back_outlined,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
