import 'package:flutter/material.dart';
import 'package:flutter_expenses/models/transaction.dart';

class Chart extends StatelessWidget {

  final List<Transaction> _recentTransactions;

  Chart(this._recentTransactions);

  List<Map<String, Object>> get groupedTransactionValues {
    return List.generate(7, (i) {
      return {'day': 'T', 'amount': 9.99};
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      margin: const EdgeInsets.all(20),
      child: Row(
        children: <Widget>[
          
        ],
      ),
    );
  }
}
