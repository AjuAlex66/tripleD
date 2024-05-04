import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:tripled/bloc/mainbloc.dart';
import 'package:tripled/main.dart';
import 'package:tripled/tripledhome.dart';
import 'package:tripled/utils/changerclass.dart';

void main() {
  testWidgets('Widgets testing', (WidgetTester tester) async {
    await tester.pumpWidget(MultiProvider(
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
          home: const TripleDHome(),
        ),
      ),
    ));
  });
}
