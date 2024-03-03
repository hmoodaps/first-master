import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled3/cubit/states.dart';
import 'package:untitled3/network/dio.dart';
import '../screens/business.dart';
import '../screens/entertainment.dart';
import '../screens/health.dart';
import '../screens/science.dart';
import '../screens/sports.dart';
import '../screens/technology.dart';
import 'package:dio/dio.dart';
// import 'package:webview_flutter/webview_flutter.dart';

class CubitClass extends Cubit<AppState> {
  static CubitClass get(context) => BlocProvider.of<CubitClass>(context);

  CubitClass() : super(InitialStat());
  IconData brightnessIconLight = Icons.brightness_2_outlined;
  IconData brightnessIconDark = Icons.brightness_2;
  IconData brightnessIcon = Icons.brightness_2_outlined;
  bool isBrightness = true;
  Color fontColor = Colors.black;
  bool? isSubmitted;

  ThemeMode modDark = ThemeMode.dark;
  ThemeMode modLight = ThemeMode.light;
  ThemeMode mod = ThemeMode.dark;

  changeBottomBar(int index) {
    currentIndex = index;
    emit(BottomBarState());
  }

  // changFlag(int index) {
  //   flagNum = index;
  //   emit(ChangeFlag());
  // }

  changeBrightnessIcon(IconData? brightnessIcon) {
    isBrightness
        ? brightnessIcon = brightnessIconDark
        : brightnessIcon = brightnessIconLight;
    emit(ChangeBrightnessIcon());
    return brightnessIcon;
  }
  // bool ? isPressed = false ;
  // IconData? chosedFlag = CupertinoIcons.circle;
  // IconData? chosedFlagSign(IconData? chosedFlag) {
  //    isPressed!
  //   ? chosedFlag = Icons.circle
  //       : chosedFlag = CupertinoIcons.circle;
  //   emit(ChangeBrightnessIcon());
  //   return chosedFlag;
  // }

  changeFontColor() {
    isBrightness ? fontColor = Colors.white : fontColor = Colors.black;
    emit(ChangeFontColor());
    return fontColor;
  }

  Color? iconColor;

  changeIconsColor() {
    isBrightness ? iconColor = Colors.black : iconColor = Colors.white;
    emit(ChangeIconsColor());
    return iconColor;
  }

  Color? fieldColor;

  changeFieldsColor() {
    isBrightness ? fieldColor = Colors.white : fieldColor = Colors.black;
    emit(ChangeFieldsColor());
    return fieldColor;
  }

  changeFieldsBorderAndColor() {
    isBrightness ? fieldColor = Colors.red : fieldColor = Colors.orange;
    emit(ChangeFieldsBorderAndColor());
    return fieldColor;
  }

  changeDarkAndLightMod() {
    isBrightness ? mod = modDark : mod = modLight;
    emit(ChangeBrightnessMod());
    return mod;
  }

  List<dynamic>? myBusiness = [];
  List<dynamic>? myScience = [];
  List<dynamic>? mySport = [];
  List<dynamic>? myHealth = [];
  List<dynamic>? myTechnology = [];
  List<dynamic>? myEntertainment = [];
  List<dynamic>? mySearch = [];

  late int currentIndex = 0;

  List screens = [
    const Business(),
    const Science(),
    const Sport(),
    const Health(),
    const Technology(),
    const Entertainment(),
  ];

  // bool? isBelgiumSub = false;
  //
  // bool? isGermanySub = false;
  // bool? isNetherlandsSub = false;
  //
  // bool? isUsaSub = false;
  //
  // bool? isEgyptSub = false;
  //
  // isBelgiumSubmitted() {
  //   isBelgiumSub = true;
  //   isGermanySub = false;
  //   isNetherlandsSub = false;
  //   isUsaSub = false;
  //   isEgyptSub = false;
  //   emit(IsBelgiumSubmitted());
  //   print('isBelgiumSub: $isBelgiumSub');
  //   print('isGermanySub: $isGermanySub');
  //   print('isNetherlandsSub: $isNetherlandsSub');
  //   print('isUsaSub: $isUsaSub');
  //   print('isEgyptSub: $isEgyptSub');
  // }
  //
  // isGermanySubmitted() {
  //   isBelgiumSub = false;
  //   isGermanySub = true;
  //   isNetherlandsSub = false;
  //   isUsaSub = false;
  //   isEgyptSub = false;
  //   emit(IsGermanySubmitted());
  // }
  //
  // isNetherlandsSubmitted() {
  //   isBelgiumSub = false;
  //   isGermanySub = false;
  //   isNetherlandsSub = true;
  //   isUsaSub = false;
  //   isEgyptSub = false;
  //   emit(IsNetherlandsSubmitted());
  // }
  //
  // isUsaSubmitted() {
  //   isBelgiumSub = false;
  //   emit(IsBelgiumSubmitted());
  //   isGermanySub = false;
  //   emit(IsGermanySubmitted());
  //   isNetherlandsSub = false;
  //   emit(IsNetherlandsSubmitted());
  //   isUsaSub = true;
  //   emit(IsUSASubmitted());
  //   isEgyptSub = false;
  //   emit(IsEgyptSubmitted());
  // }
  //
  // isEgyptSubmitted() {
  //   isBelgiumSub = false;
  //   isGermanySub = false;
  //   isNetherlandsSub = false;
  //   isUsaSub = false;
  //   isEgyptSub = true;
  //   emit(IsEgyptSubmitted());
  // }
  //
  // Color isFlagChosen(bool isChosen) {
  //   Color backgroundColor = isChosen ? Colors.blue : Colors.grey;
  //   emit(IsFlagChosen());
  //   return backgroundColor;
  //
  // }

  List<BottomNavigationBarItem> items = [
    const BottomNavigationBarItem(
      icon: Icon(Icons.business_center),
      label: 'Business',
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.science),
      label: 'Science',
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.sports),
      label: 'Sports',
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.local_hospital),
      label: 'Health',
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.computer),
      label: 'Technology',
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.theater_comedy),
      label: 'Entertainment',
    ),
  ];

  Future<Response?> getNewsData(String category, AppState gettingData,
      AppState getData, AppState getDataError, List<dynamic>? list) async {
    try {
      emit(gettingData);
      return await DioHelper.getData('v2/top-headlines', {
        "country": "nl",
        "category": category,
        "apiKey": 'b9e87f4480504523ba978cbe75f016e1',
      }).then((value) {
        if (value != null) {
          list?.clear();
          list?.addAll(value.data['articles']);
          emit(getData);
        } else {
          emit(getDataError);
        }
      }).catchError((e) {
        if (kDebugMode) {
          print(e.toString());
        }
        emit(getDataError);
      });
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
    }
    return null;
  }

  Future<Response?> getNewsBusinessData() async {
    return await getNewsData('business', GettingBusinessData(),
        GetBusinessData(), GetDataBusinessError(), myBusiness);
  }

  Future<Response?> getNewsScienceData() async {
    return await getNewsData('science', GettingScienceData(), GetScienceData(),
        GetDataScienceError(), myScience);
  }

  Future<Response?> getNewsSportData() async {
    return await getNewsData('sport', GettingSportData(), GetSportData(),
        GetDataSportError(), mySport);
  }

  Future<Response?> getNewsHealthData() async {
    return await getNewsData('health', GettingHealthData(), GetHealthData(),
        GetDataHealthError(), myHealth);
  }

  Future<Response?> getNewsTechnologyData() async {
    return await getNewsData('technology', GettingTechnologyData(),
        GetTechnologyData(), GetDataTechnologyError(), myTechnology);
  }

  Future<Response?> getNewsEntertainmentData() async {
    return await getNewsData('entertainment', GettingEntertainmentData(),
        GetEntertainmentData(), GetDataEntertainmentError(), myEntertainment);
  }

  Future<Response?> getSearchData(
    AppState gettingData,
    AppState getData,
    AppState getDataError,
    List<dynamic>? list,
    String q,
  ) async {
    try {
      list?.clear();
      emit(gettingData);
      return await DioHelper.getData('v2/top-headlines', {
        "country": "nl",
        "q": q,
        "apiKey": 'b9e87f4480504523ba978cbe75f016e1',
      }).then((value) {
        if (value != null) {
          list?.clear();
          list?.addAll(value.data['articles']);
          emit(getData);
        } else {
          emit(getDataError);
        }
      }).catchError((e) {
        if (kDebugMode) {
          print(e.toString());
        }
        emit(getDataError);
      });
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
    }
    list?.clear();
    return null;
  }

  late String _searchWord;

  Future<Response?> getSearch(String searchWord) async {
    _searchWord = searchWord;
    mySearch;
    emit(OnChangeField());
    return await getSearchData(
      GettingSearchData(),
      GetSearchData(),
      GetDataSearchError(),
      mySearch,
      searchWord,
    );
  }
}
