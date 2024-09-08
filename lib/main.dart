import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:spots/pages/home_page.dart';
import 'package:spots/pages/item_page.dart';
import 'package:spots/pages/maps_page.dart';
import 'package:spots/pages/profile_page.dart';
import 'package:spots/pages/search_page.dart';
import 'package:spots/pages/splash_page.dart';
import 'package:spots/theme/theme_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setSystemUIChangeCallback((systemOverlaysAreVisible) async {
    await Future.delayed(const Duration(seconds: 1));
    SystemChrome.restoreSystemUIOverlays();
  });

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ThemeProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    SystemChrome.setEnabledSystemUIMode(
      SystemUiMode.manual,
      overlays: [
        SystemUiOverlay.top, // Shows Status bar and hides Navigation bar
      ],
    );

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Spots',
      home: SplashPage(),
      theme: Provider.of<ThemeProvider>(context).themeData,
      routes: {
        '/homepage': (context) => const HomePage(),
        '/mapspage': (context) => const MapsPage(),
        '/profilepage': (context) => const ProfilePage(),
        '/searchpage': (context) => const SearchPage(),
        // '/itempage': (context) => const ItemPage(),

        // '/currentschedulepage': (context) => const CurrentSchedulePage(),
        // '/allschedulespage': (context) => const AllSchedulesPage(),
        // '/alarmpage': (context) => const AlarmPage(),
        // '/howitworkspage': (context) => const HowItWorksPage(),
        // '/soundspage': (context) => const SoundsPage(),
        // '/sleepqualitypage': (context) => const SleepQualityPage(),
        // '/reminderspage': (context) => const RemindersPage(),
        // '/settingspage': (context) => const SettingsPage(),
        // '/logopage': (context) => const LogoPage(),
        // '/quotepage': (context) => const QuotePage(),
        // '/editschedule': (context) => const EditSchedule(),
        // // '/setuppage': (context) => const SetupPage(),
        // '/soundplaybackpage': (context) => const SoundPlaybackPage()
      },
    );
  }
}
