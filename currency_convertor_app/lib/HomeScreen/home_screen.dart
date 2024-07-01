
import 'package:currency_convertor_app/Components/anytoany.dart';

import 'package:currency_convertor_app/Functions/fetchrates.dart';
import 'package:currency_convertor_app/Model/ratemodel.dart';

import 'package:flutter/material.dart';

import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  //Initial Variables

  late Future<RatesModel> result;
  late Future<Map> allcurrencies;
  final formkey = GlobalKey<FormState>();

  //Getting RatesModel and All Currencies
  @override
  void initState() {
    super.initState();
    setState(() {
      result = fetchrates();
      allcurrencies = fetchcurrencies();
    });
  }

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        child: Stack(
          children: [
            ClipPath(
              clipper: WaveClipperTwo(),
              child: Container(
                height: 190,
                color: Colors.orange,
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(0, 620, 0, 0),
              child: ClipPath(
                clipper: OvalTopBorderClipper(),
                child: Container(
                  height: 180,
                  color: Colors.orange,
                ),
              ),
            ),
            Form(
              key: formkey,
              child: FutureBuilder<RatesModel>(
                future: result,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                  }
                  return Center(
                    child: FutureBuilder<Map>(
                        future: allcurrencies,
                        builder: (context, currSnapshot) {
                          if (currSnapshot.connectionState ==
                              ConnectionState.waiting) {
                            return Center(child: CircularProgressIndicator());
                          }
                          return Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              AnyToAny(
                                currencies: currSnapshot.data!,
                                ratesdata: snapshot.data!,
                              ),
                            ],
                          );
                        }),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
