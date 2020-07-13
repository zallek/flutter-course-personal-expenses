import 'package:flutter/material.dart';

import '../models/transaction.dart';
import 'transaction_card.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final Function(String id) onDelete;

  const TransactionList({
    Key key,
    @required this.transactions,
    @required this.onDelete,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: transactions.isEmpty
          ? Column(
              children: <Widget>[
                Container(
                  margin: const EdgeInsets.only(top: 40),
                  child: Text(
                    'No transactions added yet!',
                    style: Theme.of(context).textTheme.headline6,
                  ),
                ),
                Flexible(
                  child: Container(
                    height: 160,
                    margin: const EdgeInsets.symmetric(vertical: 20),
                    child: Image.asset(
                      'assets/images/waiting.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ],
            )
          : ListView.builder(
              itemBuilder: (ctx, index) {
                return TransactionCard(
                  key: Key(transactions[index].id),
                  transaction: transactions[index],
                  onDelete: onDelete,
                );
              },
              itemCount: transactions.length,
            ),
    );
  }
}
