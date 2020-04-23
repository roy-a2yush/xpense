import 'package:flutter/material.dart';

class NewTransaction extends StatefulWidget {
  final Function addTransactionHandler;

  NewTransaction(this.addTransactionHandler);

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final inputTitleController = TextEditingController();

  final inputAmountController = TextEditingController();

  void submitTransaction() {
    var enteredTitle = inputTitleController.text;
    var enteredAmount = int.parse(inputAmountController.text);

    if (enteredAmount <= 0 || enteredTitle.isEmpty) {
      return;
    }
    widget.addTransactionHandler(
      enteredTitle,
      enteredAmount,
    );
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Card(
        elevation: 5,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(
                top: 1,
                bottom: 3,
                left: 10,
                right: 10,
              ),
              child: TextField(
                decoration: InputDecoration(labelText: 'Title'),
                controller: inputTitleController,
                autofocus: true,
                onSubmitted: (_) => submitTransaction(),
                //onChanged: (value) {
                //titleInput = value;
                //},
              ),
            ),
            Container(
              margin: EdgeInsets.only(
                top: 1,
                bottom: 3,
                left: 10,
                right: 10,
              ),
              child: TextField(
                decoration: InputDecoration(labelText: 'Amount'),
                controller: inputAmountController,
                keyboardType: TextInputType.phone,
                onSubmitted: (_) => submitTransaction(),
                //onChanged: (value) {
                //amountInput = value;
                //},
              ),
            ),
            FlatButton(
              onPressed: submitTransaction,
              child: Text('Add Transaction'),
              textColor: Theme.of(context).primaryColor,
            )
          ],
        ),
      ),
    );
  }
}
