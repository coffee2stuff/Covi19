import 'package:covi_19/api/models/summary-global.model.dart';
import 'package:covi_19/utils/constants/colors.const.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: COLOR_ACCENT,
      ),
    );
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: COLOR_PRIMARY,
        accentColor: COLOR_ACCENT,
        scaffoldBackgroundColor: COLOR_PRIMARY,
      ),
      home: MainScreen(),
    );
  }
}

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  SummaryGlobalModel _global = SummaryGlobalModel.from(
    100282,
    1162857,
    5658,
    63263,
    15405,
    230845,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Covi19 Coronavirus Tracker'),
      ),
      body: SafeArea(
        minimum: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            ListTile(
              title: Text('Global stats'),
              subtitle: Text('Data by Coronavirus COVID19 API'),
            ),
            Card(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 0.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        RichText(
                          text: TextSpan(
                            text: 'Confirmed cases\n',
                            style: _cardStyle(true),
                            children: [
                              TextSpan(
                                text: 'Newly confirmed: ',
                                style: _cardStyle(
                                  false,
                                ),
                              ),
                              TextSpan(
                                text: '${_global.newConfirmed}\n',
                                style: _cardStyle(
                                  false,
                                  fontColor: COLOR_TEXT_SECONDARY,
                                ),
                              ),
                              TextSpan(
                                text: 'Total confirmed: ',
                                style: _cardStyle(
                                  false,
                                ),
                              ),
                              TextSpan(
                                text: '${_global.totalConfirmed}\n\n',
                                style: _cardStyle(
                                  false,
                                  fontColor: COLOR_TEXT_SECONDARY,
                                ),
                              ),
                              TextSpan(
                                text: 'Deaths data\n',
                                style: _cardStyle(true),
                                children: [
                                  TextSpan(
                                    text: 'New deaths: ',
                                    style: _cardStyle(
                                      false,
                                    ),
                                  ),
                                  TextSpan(
                                    text: '${_global.newDeaths}\n',
                                    style: _cardStyle(
                                      false,
                                      fontColor: COLOR_TEXT_SECONDARY,
                                    ),
                                  ),
                                  TextSpan(
                                    text: 'All deaths: ',
                                    style: _cardStyle(
                                      false,
                                    ),
                                  ),
                                  TextSpan(
                                    text: '${_global.totalDeaths}\n\n',
                                    style: _cardStyle(
                                      false,
                                      fontColor: COLOR_TEXT_SECONDARY,
                                    ),
                                  ),
                                ],
                              ),
                              TextSpan(
                                text: 'Recovered data\n',
                                style: _cardStyle(true),
                                children: [
                                  TextSpan(
                                    text: 'Newly recovered: ',
                                    style: _cardStyle(
                                      false,
                                    ),
                                  ),
                                  TextSpan(
                                    text: '${_global.newRecovered}\n',
                                    style: _cardStyle(
                                      false,
                                      fontColor: COLOR_TEXT_SECONDARY,
                                    ),
                                  ),
                                  TextSpan(
                                    text: 'All recovered: ',
                                    style: _cardStyle(
                                      false,
                                    ),
                                  ),
                                  TextSpan(
                                    text: '${_global.newRecovered}',
                                    style: _cardStyle(
                                      false,
                                      fontColor: COLOR_TEXT_SECONDARY,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  ButtonBar(
                    children: [
                      FlatButton(
                        child: const Text('More info'),
                        onPressed: () {},
                      )
                    ],
                  ),
                ],
              ),
            ),
            ListTile(
              title: Text('Data by country'),
              subtitle: Text('Showing summary data for every country'),
            ),
          ],
        ),
      ),
    );
  }

  TextStyle _cardStyle(bool isBold, {Color fontColor = COLOR_TEXT_PRIMARY}) {
    return TextStyle(
      color: fontColor,
      fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
      fontSize: isBold ? 16.0 : 14.0,
    );
  }
}
