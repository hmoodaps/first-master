import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:untitled3/network/dio.dart';
import 'package:untitled3/home/home_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'cubit/cubit.dart';
import 'cubit/states.dart';

void main() {
  DioHelper.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) =>
        CubitClass()
          ..getNewsSportData()
          ..getNewsScienceData()
          ..getNewsHealthData()
          ..getNewsTechnologyData()
          ..getNewsEntertainmentData()
          ..getNewsBusinessData(),
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
                        systemStatusBarContrastEnforced: true
                      ),
                      backgroundColor: Colors.white,
                      centerTitle: true,
                      iconTheme: IconThemeData(color: Colors.black),
                    titleTextStyle: TextStyle(color:Colors.black,
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
                      titleTextStyle: TextStyle(color:Colors.white,
                        fontSize: 28,
                    ),

                  ),
                  scaffoldBackgroundColor: Colors.white54,
                  textTheme: const TextTheme(
                    bodyLarge: TextStyle(color: Colors.white),
                  ),
                ),
                themeMode: cub.changeDarkAndLightMod(),
                home: const HomeScreen(),
              );
            }));
  }
}
