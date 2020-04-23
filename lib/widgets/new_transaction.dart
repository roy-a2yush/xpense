import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewTransaction extends StatefulWidget {
  final Function addTransactionHandler;

  NewTransaction(this.addTransactionHandler);

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final _inputTitleController = TextEditingController();
  final _inputAmountController = TextEditingController();
  DateTime _selectedDate;

  void _submitTransaction() {
    var _enteredTitle = _inputTitleController.text;
    var _enteredAmount = int.parse(_inputAmountController.text);

    if (_enteredAmount <= 0 || _enteredTitle.isEmpty || _selectedDate == null) {
      return;
    }
    widget.addTransactionHandler(
      _enteredTitle,
      _enteredAmount,
      _selectedDate,
    );
    Navigator.of(context).pop();
  }

  void _presentDatePicker(BuildContext ctx) {
    showDatePicker(
      context: ctx,
      initialDate: DateTime.now(),
      firstDate: DateTime.now().subtract(
        Duration(
          days: int.parse(DateFormat.d().format(DateTime.now())),
        ),
      ),
      lastDate: DateTime.now(),
    ).then((pickedDate) {
      if (pickedDate == null) {
        return;
      }
      setState(() {
        _selectedDate = pickedDate;
      });
    });
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
                controller: _inputTitleController,
                autofocus: true,
                onSubmitted: (_) => _submitTransaction(),
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
                controller: _inputAmountController,
                keyboardType: TextInputType.phone,
                onSubmitted: (_) => _submitTransaction(),
                //onChanged: (value) {
                //amountInput = value;
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
              child: Container(
                padding: EdgeInsets.only(top: 5),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: Text(
                        _selectedDate == null
                            ? 'No date chosen'
                            : 'Date chosen: ${DateFormat.yMMMd().format(_selectedDate)}',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.black54,
                        ),
                      ),
                    ),
                    IconButton(
                        icon: Icon(Icons.calendar_today),
                        onPressed: () => _presentDatePicker(context))
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              padding: EdgeInsets.only(right: 10),
              child: RaisedButton(
                color: Theme.of(context).primaryColor,
                onPressed: _submitTransaction,
                child: Text('Add Transaction'),
                textColor: Theme.of(context).textTheme.button.color,
              ),
            )
          ],
        ),
      ),
    );
  }
}
