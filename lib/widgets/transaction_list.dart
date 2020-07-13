import 'package:flutter/material.dart';

import '../models/transaction.dart';
import 'transaction_card.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;

  const TransactionList({
    Key key,
    @required this.transactions,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      child: transactions.isEmpty
          ? Column(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.symmetric(vertical: 40),
                  child: Text(
                    'No transactions added yet!',
                    style: Theme.of(context).textTheme.headline6,
                  ),
                ),
                Container(
                  height: 160,
                  child: Image.asset(
                    'assets/images/waiting.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            )
          : ListView.builder(
              itemBuilder: (ctx, index) {
                return TransactionCard(
                  key: Key(transactions[index].id),
                  transaction: transactions[index],
                );
              },
              itemCount: transactions.length,
            ),
    );
  }
}
