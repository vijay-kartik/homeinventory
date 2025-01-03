import 'package:flutter/material.dart';

class TransactionTable extends StatelessWidget {
  const TransactionTable({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DataTable(
      columns: const [
        DataColumn(label: Text('Transaction')),
        DataColumn(label: Text('Date')),
        DataColumn(label: Text('Amount')),
      ],
      rows: [
        DataRow(cells: [
          const DataCell(Text('Shopping')),
          const DataCell(Text('Mar 10, 2025')),
          const DataCell(Text('-\$250')),
        ]),
        DataRow(cells: [
          const DataCell(Text('Salary Deposit')),
          const DataCell(Text('Mar 5, 2025')),
          const DataCell(Text('+ \$4,500')),
        ]),
        DataRow(cells: [
          const DataCell(Text('Restaurant')),
          const DataCell(Text('Mar 3, 2025')),
          const DataCell(Text('-\$85')),
        ]),
        DataRow(cells: [
          const DataCell(Text('Fuel')),
          const DataCell(Text('Mar 1, 2025')),
          const DataCell(Text('-\$60')),
        ]),
      ],
    );
  }
} 