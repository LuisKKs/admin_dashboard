import 'package:flutter/material.dart';

class EventosDatasource extends DataTableSource {
  @override
  DataRow getRow(int index) {
    return DataRow.byIndex(index: index, cells: [
      DataCell(Text('Cell #1 $index:$index')),
      DataCell(Text('Cell #2 $index:$index')),
      DataCell(Text('Cell #3 $index:$index')),
      DataCell(Text('Cell #4 $index:$index')),
      DataCell(Text('Cell #5 $index:$index')),
      DataCell(Text('Cell #6 $index:$index')),
      DataCell(Text('Cell #7 $index:$index')),
      DataCell(Text('Cell #8 $index:$index')),
      DataCell(Text('Cell #9 $index:$index')),
      DataCell(Text('Cell #10 $index:$index')),
      DataCell(Text('Cell #11 $index:$index')),
      DataCell(Text('Cell #12 $index:$index')),
      DataCell(Text('Cell #13 $index:$index')),
      DataCell(Text('Cell #14 $index:$index')),
    ]);
  }

  @override
  bool get isRowCountApproximate => true;

  @override
  int get rowCount => 1000;

  @override
  int get selectedRowCount => 0;
}
