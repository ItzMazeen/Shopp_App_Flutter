import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop/provider/dark_theme_provider.dart';
import 'consts/theme_data.dart';
import 'onboarding_page.dart';
import 'package:get/get.dart';
import 'dart:async';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  DarkThemeProvider themeCahngeProvider = DarkThemeProvider();
  void getCurrentTheme() async {
    themeCahngeProvider.darkTheme =
        await themeCahngeProvider.darkThemePref.getTheme();
  }

  @override
  void initState() {
    getCurrentTheme();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) {
            return themeCahngeProvider;
          })
        ],
        child:
            Consumer<DarkThemeProvider>(builder: (context, themeData, child) {
          return GetMaterialApp(
            title: 'MyShop',
            theme: Styles.themeData(themeCahngeProvider.darkTheme, context),
            debugShowCheckedModeBanner: false,
            home: SplashScreen(),
          );
        }));
  }
}

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // ignore: todo
    // TODO: implement initState
    super.initState();
    Timer(Duration(seconds: 7), () {
      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (_) => Onboarding()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[700],
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // logo here
            Image.asset(
              'assets/logo.png',
              height: 120,
            ),
            SizedBox(
              height: 20,
            ),
            CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
            )
          ],
        ),
      ),
    );
  }
}
