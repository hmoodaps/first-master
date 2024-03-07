import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:untitled3/network/dio.dart';
import 'package:untitled3/home/home_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled3/network/shared_preferencers.dart';
import 'package:untitled3/screens/first_page.dart';
import 'cubit/cubit.dart';
import 'cubit/states.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  DioHelper.init();
  await Save.init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => CubitClass()
          ..getNewsSportData()
          ..getNewsScienceData()
          ..getNewsHealthData()
          ..getNewsTechnologyData()
          ..getNewsEntertainmentData()
          ..getNewsBusinessData(),
        // ..apis('1915e6109adc4f3a8e4e7246b07dd028','426e01c5d1034007aebc8dc30834f142',
        //     '426e01c5d1034007aebc8dc30834f142','426e01c5d1034007aebc8dc30834f142',
        //     '426e01c5d1034007aebc8dc30834f142','426e01c5d1034007aebc8dc30834f142'),
        // {
        //   CubitClass cubit = CubitClass();
        //   cubit.getNewsSportData();
        //   cubit.getNewsHealthData();
        //   cubit.getNewsEntertainmentData();
        //   cubit.getNewsScienceData();
        //   cubit.getNewsBusinessData();
        //   cubit.getNewsTechnologyData();
        //   return cubit;
        // },
        child: BlocConsumer<CubitClass, AppState>(
            listener: (context, state) {},
            builder: (context, state) {
              CubitClass cub = CubitClass.get(context);
              // cub.getTechnology();
              // cub.getSport();
              // cub.getScience();
              // cub.getHealth();
              // cub.getEntertainment();
              // cub.getBusinessData();
              //  cub.getNewsBusinessData();
              return MaterialApp(
                debugShowCheckedModeBanner: false,
                theme: ThemeData(
                  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
                    selectedItemColor: Colors.deepOrange,
                    type: BottomNavigationBarType.fixed,
                    elevation: 0.9999,
                    unselectedItemColor: Colors.grey,
                    selectedIconTheme: IconThemeData(color: Colors.deepOrange),
                  ),
                  backgroundColor: Colors.white,
                  shadowColor: Colors.black,
                  appBarTheme: const AppBarTheme(
                    systemOverlayStyle: SystemUiOverlayStyle(
                        statusBarBrightness: Brightness.dark,
                        statusBarIconBrightness: Brightness.dark,
                        statusBarColor: Colors.white,
                        systemStatusBarContrastEnforced: true),
                    backgroundColor: Colors.white,
                    centerTitle: true,
                    iconTheme: IconThemeData(color: Colors.black),
                    titleTextStyle: TextStyle(
                      color: Colors.black,
                      fontSize: 28,
                    ),
                  ),
                ),
                darkTheme: ThemeData(
                  bottomNavigationBarTheme: const BottomNavigationBarThemeData(
                    selectedItemColor: Colors.white,
                    type: BottomNavigationBarType.fixed,
                    elevation: 0.9999,
                    unselectedItemColor: Colors.white38,
                    selectedIconTheme: IconThemeData(color: Colors.white),
                    backgroundColor: Colors.black,
                  ),
                  backgroundColor: Colors.white54,
                  shadowColor: Colors.white,
                  appBarTheme: const AppBarTheme(
                    systemOverlayStyle: SystemUiOverlayStyle(
                      statusBarBrightness: Brightness.light,
                      statusBarIconBrightness: Brightness.light,
                      statusBarColor: Colors.black,
                    ),
                    shadowColor: Colors.white,
                    backgroundColor: Colors.black,
                    centerTitle: true,
                    iconTheme: IconThemeData(color: Colors.white),
                    titleTextStyle: TextStyle(
                      color: Colors.white,
                      fontSize: 28,
                    ),
                  ),
                  scaffoldBackgroundColor: Colors.white54,
                  textTheme: const TextTheme(
                    bodyLarge: TextStyle(color: Colors.white),
                  ),
                ),
                themeMode: cub.changeDarkAndLightMod(),
                home: cub.isFirstTime == true ?   HomeScreen(
                    cub ..getNewsSportData()
                       ..getNewsScienceData()
                      ..getNewsHealthData()
                      ..getNewsTechnologyData()
                      ..getNewsEntertainmentData()
                      ..getNewsBusinessData()
                      ..apis('1915e6109adc4f3a8e4e7246b07dd028', '39c145edf6cb4a608c058a17afe26e60', 'b9269ed1c6d8495c9fe0b8c701b51c6b',
                          '928a12e71c184dc8b8cfb085cb16e7ed', 'ffdf74f7a67a456b8d32cb7f6c87a171', '5167789e4b1745ba9062ab58aa152104'),
                ) : const FirstPage()
              );
            }));
  }
}
