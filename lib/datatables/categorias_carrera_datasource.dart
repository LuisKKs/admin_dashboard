import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/categorias_provider.dart';
import '../models/categorias.dart';
import '../ui/modals/categorias_modal.dart';


class CategoriasDataSource extends DataTableSource {
  final List<Categorias> categorias;
  final BuildContext context;
  CategoriasDataSource(this.categorias, this.context);

  @override
  DataRow getRow(int index) {
    final categoria = categorias[index];

    return DataRow.byIndex(index: index, cells: [
      DataCell(Text(categoria.categoryName)),
      DataCell(Text(categoria.raceType.typeName)),
      DataCell(Text(categoria.branch)),
      DataCell(Text(categoria.description)),
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
                      return CategoriaModal(edit: true, categoria: categoria,);//TipoCarrerasModal(tipcar: tipo, edit: edit);
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
                        await Provider.of<CategoriasProvider>(context,
                                listen: false)
                            .deleteCategoria(categoria.id);
                        Navigator.of(context).pop();
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
  int get rowCount => categorias.length;

  @override
  int get selectedRowCount => 0;
}
