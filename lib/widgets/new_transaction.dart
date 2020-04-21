import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {
  final inputTitleController = TextEditingController();
  final inputAmountController = TextEditingController();
  final Function addTransactionHandler;

  NewTransaction(this.addTransactionHandler);

  void submitTransaction() {
    var enteredTitle = inputTitleController.text;
    var enteredAmount = int.parse(inputAmountController.text);

    if (enteredAmount <= 0 || enteredTitle.isEmpty) {
      return;
    }
    addTransactionHandler(
      inputTitleController.text,
      int.parse(inputAmountController.text),
    );
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
              textColor: Colors.purple,
            )
          ],
        ),
      ),
    );
  }
}
