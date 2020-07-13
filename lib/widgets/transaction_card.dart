import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/transaction.dart';

class TransactionCard extends StatelessWidget {
  final Transaction transaction;
  final Function(String id) onDelete;

  const TransactionCard({
    Key key,
    @required this.transaction,
    @required this.onDelete,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Container(
          alignment: Alignment.center,
          width: 70,
          child: FittedBox(
            child: Text(
              '\$${transaction.amount.toStringAsFixed(2)}',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
                color: Theme.of(context).primaryColor,
              ),
            ),
          ),
        ),
        title: Text(
          transaction.title,
          style: TextStyle(
            fontSize: 16,
          ),
          overflow: TextOverflow.ellipsis,
        ),
        subtitle: Text(
          DateFormat.yMMMEd().format(transaction.date),
          style: TextStyle(
            color: Colors.grey,
          ),
        ),
        trailing: IconButton(
          icon: Icon(
            Icons.delete,
            color: Theme.of(context).accentColor,
          ),
          onPressed: () => onDelete(transaction.id),
        ),
      ),
    );
  }
}
