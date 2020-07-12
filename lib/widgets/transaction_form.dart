import 'package:flutter/material.dart';

class TransactionForm extends StatefulWidget {
  final void Function(String title, double amount) onAdd;

  TransactionForm({
    Key key,
    @required this.onAdd,
  }) : super(key: key);

  @override
  _TransactionFormState createState() => _TransactionFormState();
}

class _TransactionFormState extends State<TransactionForm> {
  final titleController = TextEditingController();

  final amountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          TextField(
            decoration: InputDecoration(
              labelText: 'Title',
            ),
            controller: titleController,
            onSubmitted: (_) => _submitData(),
          ),
          TextField(
            decoration: InputDecoration(
              labelText: 'Amount',
            ),
            controller: amountController,
            keyboardType: TextInputType.number,
            onSubmitted: (_) => _submitData(),
          ),
          Container(
            child: FlatButton(
              child: Text('Add Transaction'),
              textColor: Colors.green,
              onPressed: _submitData,
            ),
            margin: EdgeInsets.symmetric(vertical: 20),
          ),
        ],
      ),
      padding: EdgeInsets.all(10),
    );
  }

  void _submitData() {
    final enteredTitle = titleController.text;
    final enteredAmount = double.tryParse(amountController.text);

    if (enteredTitle.isEmpty || enteredAmount <= 0 || enteredAmount == null) {
      return;
    }

    widget.onAdd(enteredTitle, enteredAmount);
  }
}
