import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_api_calling/home/home.dart';
import 'package:flutter_bloc_api_calling/home/services/connectivityService.dart';
import 'package:flutter_bloc_api_calling/home/services/picsumPhotosService.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Bloc',
        theme: ThemeData(primarySwatch: Colors.blue),
        home: MultiRepositoryProvider(
          providers: [
            RepositoryProvider(create: (context) => PicsumPhotosService()),
            RepositoryProvider(create: (context) => ConnectivityService())
          ],
          child: HomePage(),
        ));
  }
}
