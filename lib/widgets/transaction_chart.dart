import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/transaction.dart';

class TransactionChart extends StatelessWidget {
  final List<Transaction> recentTransactions;

  const TransactionChart({
    Key key,
    @required this.recentTransactions,
  }) : super(key: key);

  List<Map<String, Object>> get groupedTransactions {
    return List.generate(7, (index) {
      final weekDay = DateTime.now().subtract(Duration(days: index));
      final weekDayTransactions = recentTransactions.where((tx) =>
          tx.date.day == weekDay.day &&
          tx.date.month == weekDay.month &&
          tx.date.year == weekDay.year);
      final weekDayAmount =
          weekDayTransactions.fold(0.0, (sum, tx) => sum + tx.amount);
      return {
        'day': DateFormat.E().format(weekDay).toString(),
        'amount': weekDayAmount,
      };
    });
  }

  double get totalSpending {
    return groupedTransactions.fold(0.0, (sum, gp) => sum + gp['amount']);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: EdgeInsets.all(5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: groupedTransactions.reversed.map((gp) {
            return Expanded(
              child: _TransactionChartBar(
                label: gp['day'],
                spendingAmount: gp['amount'],
                spendingPctOfTotal: totalSpending > 0
                    ? (gp['amount'] as double) / totalSpending
                    : 0,
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}

class _TransactionChartBar extends StatelessWidget {
  final String label;
  final double spendingAmount;
  final double spendingPctOfTotal;

  const _TransactionChartBar({
    Key key,
    @required this.label,
    @required this.spendingAmount,
    @required this.spendingPctOfTotal,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 18,
          child: FittedBox(
            fit: BoxFit.scaleDown,
            child: Text('\$${spendingAmount.toStringAsFixed(0)}'),
          ),
        ),
        Container(
          height: 60,
          width: 10,
          margin: EdgeInsets.symmetric(
            vertical: 5,
          ),
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey, width: 1),
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.grey[100],
                ),
              ),
              FractionallySizedBox(
                heightFactor: spendingPctOfTotal,
                child: Container(
                  decoration: BoxDecoration(
                    color: Theme.of(context).accentColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ],
          ),
        ),
        Text(label),
      ],
    );
  }
}
