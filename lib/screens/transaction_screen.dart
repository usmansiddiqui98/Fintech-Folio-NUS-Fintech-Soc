import 'package:fintech_folio/constants.dart';
import 'package:flutter/material.dart';
import 'package:fintech_folio/components/gradient_app_bar.dart';
import 'package:fintech_folio/components/custom_buttom_navigation_bar.dart';
import 'package:fintech_folio/functions/user_database.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:fintech_folio/custom/chart_data.dart';
import 'package:fintech_folio/custom/transaction.dart';
import 'finance_screen.dart';
import 'package:intl/intl.dart';
import 'package:dropdown_formfield/dropdown_formfield.dart';


class TransactionScreen extends StatefulWidget {
  static const String id = 'transaction_screen';

  @override
  _TransactionScreenState createState() => _TransactionScreenState();
}

class _TransactionScreenState extends State<TransactionScreen> {
  String _itemName;
  double _amount;
  DateTime _date;
  String _category;
  UserDatabase userdb = new UserDatabase("3");


  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Widget _buildItemName() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Item name'),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Item name is required';
        }
        return null;
      },
      onSaved: (String value) {
        _itemName = value;
      },
    );
  }

  Widget _buildAmount() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Amount'),
      keyboardType: TextInputType.number,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Amount is required';
        }
        return null;
      },
      onSaved: (String value) {
        _amount = double.parse(value);
      },
    );
  }

  Widget _buildDate() {
    return InputDatePickerFormField(
      fieldLabelText: 'Date',
      initialDate: new DateTime.now(),
      firstDate: new DateTime(2016),
      lastDate: new DateTime.now(),
      errorFormatText: 'Please enter in a mm/dd/yyyy format',
      errorInvalidText: 'Are you in the future?',
      onDateSaved: (DateTime value) {
        _date = value;
      },
    );
  }

  Widget _buildCategory() {
    return DropDownFormField(
      titleText: 'Category',
      hintText: 'Please select one',
      value: _category,
      onSaved: (value) {
        setState(() {
          _category = value;
        });
      },
      onChanged: (value) {
        setState(() {
          _category = value;
        });
      },
      dataSource: [
        {
          "display": "Food",
          "value": "Food",
        },
        {
          "display": "Hobbies",
          "value": "Hobbies",
        },
        {
          "display": "Technology",
          "value": "Technology",
        },
        {
          "display": "Transportation",
          "value": "Transportation",
        },
        {
          "display": "Travel",
          "value": "Travel",
        },
      ],
      textField: 'display',
      valueField: 'value',
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GradientAppBar(title: "new transaction"),
      body: Container(
        margin: EdgeInsets.all(24),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              _buildItemName(),
              _buildAmount(),
              _buildDate(),
              _buildCategory(),
              SizedBox(height: 100),
              ElevatedButton(
                child: Text(
                  'Submit',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
                onPressed: () {
                  if (!_formKey.currentState.validate()) {
                    return;
                  }

                  _formKey.currentState.save();
                  userdb.setTransaction(_amount, _category, _itemName, _date);
                },
              )
            ],
          ),
        ),
      ),
    );
    throw UnimplementedError();
  }

}