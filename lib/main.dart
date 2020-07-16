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
        appBarTheme: AppBarTheme(
          elevation: 0.0,
        ),
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
  SummaryGlobalModel _global = SummaryGlobalModel();

  @override
  void initState() {
    super.initState();
    _refreshData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Covi19 Coronavirus Tracker'),
      ),
      body: SafeArea(
        minimum: const EdgeInsets.all(16.0),
        child: RefreshIndicator(
          onRefresh: _refreshData,
          child: ListView(
            children: [
              Card(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    ListTile(
                      leading: Icon(
                        Icons.language,
                        size: 32.0,
                      ),
                      title: Text('Global stats'),
                      subtitle: Text('Data provided by COVID19 API'),
                    ),
                    Divider(),
                    ListTile(
                      title: Text('Confirmed cases'),
                      subtitle: Text(
                        'Newly confirmed: ${_global.newConfirmed}\nTotal confirmed: ${_global.totalConfirmed}',
                      ),
                    ),
                    ListTile(
                      title: Text('Deaths data'),
                      subtitle: Text(
                        'New deaths: ${_global.newDeaths}\nAll deaths: ${_global.totalDeaths}',
                      ),
                    ),
                    ListTile(
                      title: Text('Recovered data'),
                      subtitle: Text(
                        'Newly recovered: ${_global.newRecovered}\nAll recovered: ${_global.totalRecovered}',
                      ),
                    ),
                    SizedBox(
                      height: 8.0,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 16.0,
              ),
              Card(
                child: ListTile(
                  trailing: Icon(
                    Icons.chevron_right,
                  ),
                  title: Text('Data by country'),
                  subtitle: Text('Showing live data for every country'),
                ),
              ),
              SizedBox(
                height: 16.0,
              ),
              Card(
                child: ListTile(
                  trailing: Icon(
                    Icons.chevron_right,
                  ),
                  title: Text('General info'),
                  subtitle: Text(
                    'Info about the app, health guidances',
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _refreshData() async {}
}
