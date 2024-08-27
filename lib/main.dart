import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sel_org/constants/themes/dark_theme.dart';
import 'package:sel_org/constants/themes/light_theme.dart';
import 'package:sel_org/routes/route_generator.dart';
import 'package:sel_org/utils/theme_bloc.dart';

import 'multilingual/app_localizations_delegate.dart';
import 'utils/login_testing_sample/login_testing_values.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await LoadConstantValues().getInitialLoginValues();

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();

  static void setLocale(BuildContext context, Locale newLocale) {
    var state = context.findAncestorStateOfType<_MyAppState>();
    state?.setLocale(newLocale);
  }
}

class _MyAppState extends State<MyApp> {
  late Locale localeLanguage;

  @override
  void initState() {
    super.initState();
  }

  void setLocale(Locale locale) {
    setState(() {
      localeLanguage = locale;
    });
  }

  @override
  void didChangeDependencies() {
    setState(() {
      localeLanguage = const Locale("en");
    });
    super.didChangeDependencies();
  }

  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  // final AppRouter appRouter = AppRouter.instance;
  // To prevent app refresh on theme changes,
  // creating a single instance of app router

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => ThemeBloc(),
          ),
        ],
        child: BlocBuilder<ThemeBloc, ThemeState>(
          builder: (context, state) {
            return ScreenUtilInit(
                minTextAdapt: true,
                splitScreenMode: true,
                designSize: const Size(360, 1024),
                builder: (_, child) {
                  return MaterialApp.router(
                    debugShowCheckedModeBanner: false,
                    theme: state is LightThemeState
                        ? ThemeData().myDarkTheme
                        : ThemeData().myLightTheme,

                    // routerConfig:appRouter.router,
                    routerConfig: AppRouter().router,
                    locale: localeLanguage,
                    supportedLocales: const [
                      Locale("en"),
                      Locale("hi"),
                    ],
                    localizationsDelegates: const [
                      AppLocalizationsDelegate(),
                      GlobalMaterialLocalizations.delegate,
                      GlobalWidgetsLocalizations.delegate,
                      GlobalCupertinoLocalizations.delegate,
                      DefaultMaterialLocalizations.delegate,
                      DefaultWidgetsLocalizations.delegate
                    ],
                    localeResolutionCallback: (locale, supportedLocales) {
                      for (var supportedLocal in supportedLocales) {
                        if (supportedLocal.languageCode ==
                                locale?.languageCode &&
                            supportedLocal.countryCode == locale?.countryCode) {
                          return supportedLocal;
                        }
                      }

                      return supportedLocales.first;
                    },
                  );
                });
          },
          // listener: (BuildContext context, ThemeState state) {},
        ));
  }
}
