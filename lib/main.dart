import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:lili/bloc/localize_bloc.dart';
import 'package:lili/generated/l10n.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => LocalizeBloc(),
        )
      ],
      child: BlocBuilder<LocalizeBloc, LocalizeState>(
        builder: (context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            locale: state is SuccessChangeLanguage
                ? Locale(state.language)
                : Locale(context.read<LocalizeBloc>().language),
            localizationsDelegates: const [
              S.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: S.delegate.supportedLocales,
            theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
              useMaterial3: true,
            ),
            home: Localization(),
          );
        },
      ),
    );
  }
}

class Localization extends StatelessWidget {
  Localization({super.key});
  var items = ['ar', 'en', 'es', 'fr', 'hi', 'zh', 'pt', 'UAH'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text(S.of(context).appBar),
        centerTitle: true,
        actions: [
          BlocBuilder<LocalizeBloc, LocalizeState>(
            builder: (context, state) {
              return DropdownButton(
                  icon: const Icon(
                    Icons.arrow_drop_down_circle_outlined,
                    color: Colors.white,
                  ),
                  dropdownColor: Colors.lightBlue,
                  iconEnabledColor: Colors.black,
                  style: TextStyle(color: Colors.white),
                  value: context.read<LocalizeBloc>().language,
                  items: items.map((String items) {
                    return DropdownMenuItem(
                      value: items,
                      child: Text(items),
                    );
                  }).toList(),
                  onChanged: (value) {
                    context
                        .read<LocalizeBloc>()
                        .add(ChangeLanguageEvent(value!));
                  });
            },
          )
        ],
      ),
      body: Center(
        child: Text(
          S.of(context).title,
          style: const TextStyle(
              fontWeight: FontWeight.normal, fontSize: 20, color: Colors.black),
        ),
      ),
    );
  }
}
