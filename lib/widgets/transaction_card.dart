import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/transaction.dart';

class TransactionCard extends StatelessWidget {
  final Transaction transaction;

  const TransactionCard({
    Key key,
    @required this.transaction,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Row(
        children: <Widget>[
          Container(
            alignment: Alignment.center,
            margin: EdgeInsets.symmetric(
              vertical: 20,
            ),
            padding: EdgeInsets.symmetric(
              horizontal: 7,
            ),
            width: 110,
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
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(bottom: 5),
                  child: Text(
                    transaction.title,
                    style: TextStyle(
                      fontSize: 16,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Text(
                  DateFormat.yMMMEd().format(transaction.date),
                  style: TextStyle(
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
