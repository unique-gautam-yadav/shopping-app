import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shopping_app/data/cart_provider.dart';
import 'package:shopping_app/screens/home_screen.dart';
import 'package:shopping_app/utils/colors.dart';
import 'package:provider/provider.dart';

/// Instagram - @flutter.demon
/// GitHub - unique-gautam-yadav

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => CartProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    var faimly = GoogleFonts.nunito().fontFamily;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Groceries Shopping',
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          scrolledUnderElevation: 0,
          elevation: 0,
          backgroundColor: AppColors.creamColor,
        ),
        colorScheme: ColorScheme.fromSeed(
          seedColor: AppColors.primaryColor,
          background: AppColors.creamColor,
          surface: AppColors.primaryColor,
          onSurface: AppColors.creamColor,
        ),
        useMaterial3: true,
        textTheme: const TextTheme().copyWith(
          bodySmall: TextStyle(color: AppColors.darkColor, fontFamily: faimly),
          bodyMedium: TextStyle(color: AppColors.darkColor, fontFamily: faimly),
          bodyLarge: TextStyle(color: AppColors.darkColor, fontFamily: faimly),
          labelSmall: TextStyle(color: AppColors.darkColor, fontFamily: faimly),
          labelMedium:
              TextStyle(color: AppColors.darkColor, fontFamily: faimly),
          labelLarge: TextStyle(color: AppColors.darkColor, fontFamily: faimly),
          displaySmall:
              TextStyle(color: AppColors.darkColor, fontFamily: faimly),
          displayMedium:
              TextStyle(color: AppColors.darkColor, fontFamily: faimly),
          displayLarge:
              TextStyle(color: AppColors.darkColor, fontFamily: faimly),
        ),
      ),
      home: const HomeScreen(),
    );
  }
}
