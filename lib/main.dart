import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import './transaction.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Personal Expenses',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final List<Transaction> transactions = [
    Transaction(
      id: 't1',
      title: 'New Shoes',
      amount: 69.99,
      date: DateTime.now(),
    ),
    Transaction(
      id: 't2',
      title: 'Weekly Groceries Weekly Groceries',
      amount: 16.53,
      date: DateTime.now(),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Personal Expenses'),
        backgroundColor: Colors.green,
      ),
      body: Column(
        children: <Widget>[
          Container(
            child: TransactionChart(),
            width: double.infinity,
          ),
          Column(
            children: transactions.map((tx) {
              return TransactionCard(
                key: Key(tx.id),
                transaction: tx,
              );
            }).toList(),
          ),
        ],
        mainAxisAlignment: MainAxisAlignment.spaceAround,
      ),
    );
  }
}

class TransactionChart extends StatelessWidget {
  const TransactionChart({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Text('CHART!'),
      elevation: 5,
    );
  }
}

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
            child: Text(
              '\$${transaction.amount}',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
                color: Colors.green,
              ),
            ),
            margin: EdgeInsets.symmetric(
              vertical: 20,
            ),
            width: 110,
          ),
          Expanded(
            child: Column(
              children: <Widget>[
                Container(
                  child: Text(
                    transaction.title,
                    style: TextStyle(
                      fontSize: 16,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                  margin: EdgeInsets.only(bottom: 5),
                ),
                Text(
                  DateFormat.yMMMEd().format(transaction.date),
                  style: TextStyle(
                    color: Colors.grey,
                  ),
                ),
              ],
              crossAxisAlignment: CrossAxisAlignment.start,
            ),
          ),
        ],
      ),
    );
  }
}
