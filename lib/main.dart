import 'package:covi_19/api/blocs/api-event.dart';
import 'package:covi_19/api/blocs/api.bloc.dart';
import 'package:covi_19/api/models/summary-global.model.dart';
import 'package:covi_19/utils/constants/colors.const.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'api/blocs/api-state.dart';
import 'dart:io' show Platform, exit;

void main() {
  runApp(BlocProvider<ApiBloc>(
    create: (context) => ApiBloc()..add(AppStartedEvent()),
    child: App(),
  ));
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
      home: BlocBuilder<ApiBloc, ApiState>(
        builder: (context, state) {
          if (state is LoadingState) {
            return LoadingScreen();
          } else if (state is HasDataState || state is NoDataState) {
            return MainScreen();
          } else {
            return ErrorScreen();
          }
        },
      ),
    );
  }
}

class LoadingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Covi19',
              style: TextStyle(
                fontSize: 26.0,
                color: COLOR_TEXT_PRIMARY,
              ),
            ),
            SizedBox(
              height: 8.0,
            ),
            Text(
              'Loading, please wait',
              style: TextStyle(color: COLOR_TEXT_SECONDARY),
            ),
            SizedBox(
              height: 48.0,
            ),
            CircularProgressIndicator(),
          ],
        ),
      ),
    );
  }
}

class ErrorScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.clear),
          onPressed: () {
            if (Platform.isAndroid) {
              SystemNavigator.pop();
            } else if (Platform.isIOS) {
              exit(0);
            }
          },
        ),
        title: Text('Error'),
      ),
      body: SafeArea(
        minimum: const EdgeInsets.all(32.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Unknown error',
              style: TextStyle(
                fontSize: 28.0,
                fontWeight: FontWeight.bold,
                color: COLOR_ERROR,
              ),
            ),
            Text(
              'We were unable to fetch data from the API.',
            ),
            SizedBox(
              height: 8.0,
            ),
            Text(
              'Please check if you have an active internet connection. If you believe that the reason is elsewhere, contact the developer.',
            ),
            SizedBox(
              height: 8.0,
            ),
          ],
        ),
      ),
    );
  }
}

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Covi19 Coronavirus Tracker'),
      ),
      body: BlocBuilder(
        builder: (context, state) {
          context.bloc<ApiBloc>().add(RequestSummaryEvent());
          if (state is HasDataState) {
            SummaryGlobalModel _global = state.data;
            return Scaffold(
              body: SafeArea(
                minimum: const EdgeInsets.all(16.0),
                child: RefreshIndicator(
                  onRefresh: () {
                    context.bloc<ApiBloc>().add(RequestSummaryEvent());
                  },
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
          } else {
            return Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );
          }
        },
      ),
    );
  }
}
