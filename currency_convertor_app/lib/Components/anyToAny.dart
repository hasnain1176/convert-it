import 'package:currency_convertor_app/Commen/app_colors.dart';
import 'package:currency_convertor_app/Commen/app_textfield.dart';
import 'package:currency_convertor_app/Functions/fetchrates.dart';
import 'package:currency_convertor_app/Model/ratemodel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class AnyToAny extends StatefulWidget {

  const AnyToAny({Key? key, required this.ratesdata, required this.currencies})
      : super(key: key);
      
  final RatesModel ratesdata;
  final Map currencies;
  @override
  _AnyToAnyState createState() => _AnyToAnyState();
}

class _AnyToAnyState extends State<AnyToAny> {
  TextEditingController amountController = TextEditingController();

  String dropdownValue1 = 'USD';
  String dropdownValue2 = 'PKR';
  String answer = 'Converted Currency will be shown here :)';

  @override
  Widget build(BuildContext context) {
    // var w = MediaQuery.of(context).size.width;
    //  var h = MediaQuery.of(context).size.height;

    return Center(
      child: Card(
      
        color: Color.fromARGB(255, 248, 245, 245),
        child: Container(
          height: 350,
          //           width: w / 11,
          // height: h / 4,
          padding: EdgeInsets.all(25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Center(
                child: Text(
                  'Convert Any Currency',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                      color: AppColors.blackText),
                ),
              ),
              SizedBox(height: 20),
      
              //TextFields for Entering USD
              AppTextFromField(
                  hintText: "Enter Amount",
                  lableText: "Enter Amount",
                  keyboardType: TextInputType.number,
                  controller: amountController),
              SizedBox(height: 18),
              Padding(
                padding: EdgeInsets.fromLTRB(40, 0, 40, 0),
                child: Row(
                  children: [
                    Expanded(
                      child: DropdownButton<String>(
                        dropdownColor: AppColors.secondaryColor,
                        value: dropdownValue1,
                        icon: const Icon(
                          Icons.arrow_drop_down,
                          color: AppColors.primaryColor,
                        ),
                        iconSize: 29,
                        elevation: 16,
                        isExpanded: true,
                        underline: Container(
                         
                          height: 2,
                          color: AppColors.primaryColor,
                        ),
                        onChanged: (String? newValue) {
                          setState(() {
                            dropdownValue1 = newValue!;
                          });
                        },
                        items: widget.currencies.keys
                            .toSet()
                            .toList()
                            .map<DropdownMenuItem<String>>((value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),
                    ),
                    Container(
                        margin: EdgeInsets.symmetric(horizontal: 20),
                        child: Text(
                          'To',
                          style: TextStyle(color: AppColors.blackText),
                        )),
                    Expanded(
                      child: DropdownButton<String>(
                        value: dropdownValue2,
                        icon: const Icon(
                          Icons.arrow_drop_down,
                          color: AppColors.primaryColor,
                        ),
                        iconSize: 29,
                        elevation: 16,
                        isExpanded: true,
                        underline: Container(
                          height: 2,
                          color: AppColors.primaryColor,
                        ),
                        onChanged: (String? newValue) {
                          setState(() {
                            dropdownValue2 = newValue!;
                          });
                        },
                        items: widget.currencies.keys
                            .toSet()
                            .toList()
                            .map<DropdownMenuItem<String>>((value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),
                    ),
                  ],
                ),
              ),
      
              SizedBox(
                height: 20,
              ),
              Container(
                child: ElevatedButton(
                  onPressed: () {
                    // print(amountController.text);
                    setState(() {
                      answer = amountController.text +
                          ' ' +
                          dropdownValue1 +
                          ' ' +
                          convertany(widget.ratesdata.rates, amountController.text,
                              dropdownValue1, dropdownValue2) +
                          ' ' +
                          dropdownValue2;
                    });
                  },
                  child: Center(
                      child: Text(
                    'Convert',
                    style: TextStyle(color: AppColors.blackText),
                  )),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                        Theme.of(context).primaryColor),
                  ),
                ),
              ),
              SizedBox(
                width: 10,
              ),
              SizedBox(height: 30),
              Container(
                  child: Center(
                      child: Text(
                answer,
                style: TextStyle(color: AppColors.blackText),
              )))
            ],
          ),
        ),
      ),
    );
  }
}
