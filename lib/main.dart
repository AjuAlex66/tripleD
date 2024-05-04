import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:tripled/bloc/mainbloc.dart';
import 'package:tripled/tripledhome.dart';
import 'package:tripled/utils/changerclass.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<Changer>(
          create: (context) => Changer(),
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider.value(value: MainBloc()),
        ],
        child: MaterialApp(
          navigatorKey: NavigationService.navigatorKey,
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              fontFamily: 'Sedan',
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
              useMaterial3: true,
            ),
            home: const TripleDHome()),
      ),
    );
  }
}

class NavigationService {
  static GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
}