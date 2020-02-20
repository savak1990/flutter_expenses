import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'adaptive_flat_button.dart';

class NewTransaction extends StatefulWidget {
  final Function _addNewTransaction;

  NewTransaction(this._addNewTransaction) {
    print(runtimeType.toString() + '.constructor');
  }

  @override
  _NewTransactionState createState() {
    print(runtimeType.toString() + '.createState');
    return _NewTransactionState();
  }
}

class _NewTransactionState extends State<NewTransaction> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  DateTime _selectedDate = DateTime.now();


  _NewTransactionState() {
    print(runtimeType.toString() + '.constructor()');
  }

  @override
  void initState() {
    print(runtimeType.toString() + '.initState()');
    super.initState();
  }


  @override
  void didUpdateWidget(NewTransaction oldWidget) {
    print(runtimeType.toString() + '.didUpdateWidget()');
    super.didUpdateWidget(oldWidget);
  }


  @override
  void dispose() {
    print(runtimeType.toString() + '.dispose()');
    super.dispose();
  }


  @override
  void deactivate() {
    print(runtimeType.toString() + '.deactivate()');
    super.deactivate();
  }

  void _submitData() {
    final inputTitle = _titleController.text;
    final inputAmount = double.parse(_amountController.text);

    if (inputTitle.isEmpty || inputAmount <= 0) {
      return;
    }

    widget._addNewTransaction(inputTitle, inputAmount, _selectedDate);

    Navigator.of(context).pop();
  }

  void _presentDatePicker(BuildContext ctx) {
    showDatePicker(
      context: ctx,
      initialDate: DateTime.now(),
      firstDate: DateTime(2019),
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
    return SingleChildScrollView(
      child: Card(
        elevation: 5,
        child: Container(
          padding: EdgeInsets.only(
            top: 10,
            left: 10,
            right: 10,
            bottom: MediaQuery.of(context).viewInsets.bottom + 10,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              TextField(
                decoration: InputDecoration(
                  labelText: 'Title',
                ),
                controller: _titleController,
                onSubmitted: (_) => _submitData(),
              ),
              TextField(
                decoration: InputDecoration(
                  labelText: 'Amount',
                ),
                controller: _amountController,
                keyboardType: TextInputType.number,
                onSubmitted: (_) => _submitData(),
              ),
              Container(
                height: 70,
                child: Row(
                  children: [
                    Expanded(
                      child: Text('Picked Date: ' +
                          DateFormat.yMd().format(_selectedDate)),
                    ),
                    AdaptiveFlatButton('Choose date', () => _presentDatePicker(context)),
                  ],
                ),
              ),
              FlatButton(
                child: Text('Add Transaction'),
                textColor: Theme.of(context).textTheme.button.color,
                color: Theme.of(context).primaryColor,
                onPressed: _submitData,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
