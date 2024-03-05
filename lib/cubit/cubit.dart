import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled3/cubit/states.dart';
import 'package:untitled3/network/dio.dart';
import 'package:untitled3/network/shared_preferencers.dart';
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

  bool isBrightness = false ;
  Color fontColor = Colors.black;

  ThemeMode modDark = ThemeMode.dark;
  ThemeMode modLight = ThemeMode.light;
  ThemeMode mod = ThemeMode.dark;
  apis(String api1,String api2,String api3,String api4,String api5,String api6,)async{
    await Save.setStringData('belgiumAPI', api1);
    await Save.setStringData('egyptAPI', api2);
    await Save.setStringData('germanyAPI', api3);
    await Save.setStringData('netherlandsAPI', api4);
    await Save.setStringData('usaAPI', api5);
    await Save.setStringData('defaultApiKey', api6);
  }
  printting(){
    print(countries());
    print(apiKeys());
  }

  changeBottomBar(int index) {
    currentIndex = index;
    emit(BottomBarState());
  }
Color ? flagBackgroundColor ;
  changeFlagsBackground(){
    if(Save.getBoolData('key') == null){
      isBrightness
          ? flagBackgroundColor = Colors.grey : flagBackgroundColor = Colors.white;
    }else{
      Save.getBoolData('key')!
           ? flagBackgroundColor = Colors.grey : flagBackgroundColor = Colors.white;
    }
    emit(ChangeFlagsBackground());
    return flagBackgroundColor;
  }
  changeBrightnessIcon(IconData? brightnessIcon) {
    if(Save.getBoolData('key') == null){
      isBrightness
          ? brightnessIcon = brightnessIconDark
        : brightnessIcon = brightnessIconLight;
    }else{
    Save.getBoolData('key')!
        ? brightnessIcon = brightnessIconDark
        : brightnessIcon = brightnessIconLight;
    }
    emit(ChangeBrightnessIcon());
    return brightnessIcon;
  }

  changeFontColor() {
    if(Save.getBoolData('key') == null){
      isBrightness
          ? fontColor = Colors.white : fontColor = Colors.black;
    }else{
      Save.getBoolData('key')! ? fontColor = Colors.white : fontColor = Colors.black;
    }
    emit(ChangeFontColor());
    return fontColor;
  }

  Color? iconColor;

  changeIconsColor() {
    if(Save.getBoolData('key') == null){
      isBrightness
      ? iconColor = Colors.black : iconColor = Colors.white;
    }else{ Save.getBoolData('key')! ? iconColor = Colors.black : iconColor = Colors.white;}
    emit(ChangeIconsColor());
    return iconColor;
  }

  Color? fieldColor;

  changeFieldsColor() {
    if(Save.getBoolData('key') == null){
      isBrightness
          ? fieldColor = Colors.white : fieldColor = Colors.black ;
    }else{
      Save.getBoolData('key')! ? fieldColor = Colors.white : fieldColor = Colors.black;
    }
    emit(ChangeFieldsColor());
    return fieldColor;
  }

  changeFieldsBorderAndColor() {
    if(Save.getBoolData('key') == null){
      isBrightness
          ? fieldColor = Colors.red : fieldColor = Colors.orange;
    }else{ Save.getBoolData('key')! ? fieldColor = Colors.red : fieldColor = Colors.orange;}
    emit(ChangeFieldsBorderAndColor());
    return fieldColor;
  }

  changeDarkAndLightMod() {
    if(Save.getBoolData('key') == null){
      isBrightness
          ? mod = modDark : mod = modLight;
    }else{ Save.getBoolData('key')! ? mod = modDark : mod = modLight;}
    emit(ChangeBrightnessMod());
    return mod;
  }
  CircleAvatar ? flag;
  changFlag(){
    flag = CircleAvatar(
      radius: 20,
      backgroundColor: Colors.transparent,
      child: CircleAvatar(
        radius: 20,
        backgroundImage: AssetImage (Save.getStringData('pathToImage') != null ? Save.getStringData('pathToImage')! : pathToImage ),
        backgroundColor: Colors.transparent,
      ),
    );
    emit(ChangFlag());
    return flag ;
  }

  // WebViewController controller(String url) {
  //   return WebViewController()..loadRequest(Uri.parse(url));
  // }

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
  String  pathToImage = Save.getStringData('pathToImage')!=null ? Save.getStringData('pathToImage')! : 'assets/netherlands.png';

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
  String? apiKey;

  // String defaultApiKey = Save.getStringData('pathToImage') == null ? '928a12e71c184dc8b8cfb085cb16e7ed' : Save.getStringData('defaultApikey')!;

  String apiKeys() {
    switch (Save.getStringData('pathToImage')) {
      case 'assets/belgium.png':
        apiKey = Save.getStringData('belgiumAPI');
        break;
      case 'assets/egypt.png':
        apiKey = Save.getStringData('egyptAPI');
        break;
      case 'assets/germany.png':
        apiKey = Save.getStringData('germanyAPI');
        break;
      case 'assets/netherlands.png':
        apiKey = Save.getStringData('netherlandsAPI');
        break;
      case 'assets/usa.png':
        apiKey = Save.getStringData('usaAPI');
        break;
      default:
        apiKey = Save.getStringData('defaultApikey');
        break;
    }
    emit(ChangApi());
    return apiKey!;
  }

  String ? country;
  String countries() {
    emit(ChangCountry());
    switch (pathToImage) {
      case 'assets/belgium.png':
        country = 'be';
        break;
      case 'assets/egypt.png':
        country = 'eg';
        break;
      case 'assets/germany.png':
        country = 'de';
        break;
      case 'assets/netherlands.png':
        country = 'nl';
        break;
      case 'assets/usa.png':
        country = 'usa';
        break;
      default:
        country = 'nl';
        break;
    }
    emit(ChangCountry());
    return country!;
  }


  Future<Response?> getNewsData(String category, AppState gettingData,
      AppState getData, AppState getDataError, List<dynamic>? list) async {
    try {
      emit(gettingData);
      return await DioHelper.getData('v2/top-headlines', {
        "country": countries(),
        "category": category,
        "apiKey": apiKeys,
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
