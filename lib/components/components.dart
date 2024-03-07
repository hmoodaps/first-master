import 'package:flutter/material.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:untitled3/cubit/cubit.dart';
import 'package:untitled3/main.dart';
import 'package:untitled3/network/shared_preferencers.dart';
import 'package:url_launcher/url_launcher.dart';

import '../home/home_screen.dart';

Widget itemBuilder(context, int index, List<dynamic>? list) {
  CubitClass cub = CubitClass.get(context);
  String? title = list?[index]['title'];
  String? url = list?[index]['url'];
  String? desc = list?[index]['description'];
  int? descLines;
  int? titleLines;

  changeTitleLines() {
    if (desc == null) {
      titleLines = 2;
      descLines = 1;
    } else {
      titleLines = 1;
      descLines = 2;
    }
    return titleLines;
  }

  changeDescLines() {
    if (desc == null) {
      titleLines = 2;
      descLines = 1;
    } else {
      titleLines = 1;
      descLines = 2;
    }
    return descLines;
  }

  return MaterialButton(
    onPressed: () {
      launchUrl(Uri.parse(url!));

      // Navigator.push(
      //     context,
      //     MaterialPageRoute(
      //       builder: (context) =>  News(url!),
      //     ));
    },
    child: Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 120,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: 120,
                  height: 120,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.network(
                      list?[index]['urlToImage'] != null
                          ? '${list?[index]['urlToImage']}'
                          : pathToImage(context),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 15,
                ),
                Expanded(
                  child: Column(
                    children: [
                      titleAndDesc(
                          title, changeTitleLines(), FontWeight.w900, context),
                      titleAndDesc(
                          desc, changeDescLines(), FontWeight.w400, context),
                      const SizedBox(
                        height: 5,
                      ),
                      Expanded(
                        child: Align(
                            alignment: AlignmentDirectional.bottomEnd,
                            child: Text(
                              list?[index]['publishedAt'] != null
                                  ? '${list?[index]['publishedAt']}'
                                  : 'without date',
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                              style: TextStyle(color: cub.changeFontColor()),
                            )),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}

Widget conditionalItemBuilder(context, List<dynamic>? list) =>
    ConditionalBuilder(
      builder: (context) => ListView.separated(
        physics: const BouncingScrollPhysics(),
        itemBuilder: (context, index) => itemBuilder(context, index, list),
        separatorBuilder: (context, index) => const Divider(
          thickness: 1,
          color: Colors.black,
        ),
        itemCount: list.length,
      ),
      condition: list!.isNotEmpty,
      fallback: (context) => const Center(
        child: CircularProgressIndicator(),
      ),
    );

Widget conditionalSearchItemsBuilder(context, List<dynamic>? list) =>
    ConditionalBuilder(
        builder: (context) => ListView.separated(
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) =>
                  itemBuilder(context, index, list),
              separatorBuilder: (context, index) => const Divider(
                thickness: 1,
                color: Colors.black,
              ),
              itemCount: list.length,
            ),
        condition: list!.isNotEmpty,
        fallback: (context) => const Center());

Widget titleAndDesc(String? str, int? maxLine, FontWeight fontWeight, context) {
  CubitClass cub = CubitClass.get(context);
  return Text(
    str ?? '',
    overflow: TextOverflow.ellipsis,
    maxLines: maxLine,
    style: TextStyle(
      color: cub.changeFontColor(),
      fontSize: 18,
      fontWeight: fontWeight,
    ),
  );
}

Widget bodyBuilder(context) {
  return  Column(
    children: [
      const Text('==Select one =='),
      flagBuilder(context, 'assets/belgium.png', 'Belgium'),
      flagBuilder(context, 'assets/egypt.png', 'Egypt'),
      flagBuilder(context, 'assets/netherlands.png', 'Netherlands'),
      flagBuilder(context, 'assets/germany.png', 'Germany'),
      flagBuilder(context, 'assets/usa.png', 'USA'),
    ],
  );
}


Widget flagBuilder(context, String pathToImage, String countryName) {
  CubitClass cub = CubitClass.get(context);
  return Column(
    children: [
      GestureDetector(
        onTap: () {
          Save.setStringData('pathToImage', pathToImage);
          cub.pathToImage = Save.getStringData('pathToImage')!;
          Save.setStringData('countryName', countryName);

          Navigator.pop(context);
          if(cub.isFirstTime == false){
            null;
          }else{
            Navigator.pop(context);
            Navigator.push(context, MaterialPageRoute(builder: (context)=> HomeScreen(
              cub
              ..getNewsSportData()
              ..getNewsScienceData()
              ..getNewsHealthData()
              ..getNewsTechnologyData()
              ..getNewsEntertainmentData()
              ..getNewsBusinessData()
              ..apis('1915e6109adc4f3a8e4e7246b07dd028', '39c145edf6cb4a608c058a17afe26e60', 'b9269ed1c6d8495c9fe0b8c701b51c6b',
                  '928a12e71c184dc8b8cfb085cb16e7ed', 'ffdf74f7a67a456b8d32cb7f6c87a171', '5167789e4b1745ba9062ab58aa152104'),)));
          }
        },
        child: Row(
          children: [
            CircleAvatar(
              radius: 15,
              backgroundColor: Colors.transparent,
              child: CircleAvatar(
                radius: 15,
                backgroundImage: AssetImage(pathToImage),
                backgroundColor: Colors.transparent,
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            SizedBox(
                width: 157,
                child: Text(
                  countryName,
                  style: const TextStyle(fontSize: 18),
                ))
          ],
        ),
      ),
      const SizedBox(
        height: 7,
      ),
      const Divider(
        height: 1,
        thickness: 1,
        color: Colors.black,
      ),
      const SizedBox(
        height: 7,
      ),
    ],
  );
}


String pathToImage(context) {
  CubitClass cub = CubitClass.get(context);
  String? pathTOImage;
  switch (Save.getStringData("countryName")) {
    case 'Belgium':
      pathTOImage =
          'https://www.annaharar.com/ContentFiles/186984Image1-1180x677_d.jpg?version=3976437';
      break;
    case 'Egypt':
      pathTOImage =
          'https://cdn.alweb.com/thumbs/egyptencyclopedia/article/fit710x532/%D8%A7%D8%B9%D8%B1%D9%81-%D8%A3%D9%83%D8%AB%D8%B1-%D8%B9%D9%86-%D8%AC%D9%85%D9%87%D9%88%D8%B1%D9%8A%D8%A9-%D9%85%D8%B5%D8%B1-%D8%A7%D9%84%D8%B9%D8%B1%D8%A8%D9%8A%D8%A9.jpg';
      break;
    case 'Germany':
      pathTOImage =
          'https://images.pexels.com/photos/109629/pexels-photo-109629.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1';
      break;
    case 'Netherlands':
      pathTOImage =
          'https://i.pinimg.com/originals/76/27/af/7627af55c627e7f6b60880f1a684cd77.jpg';
      break;
    case 'USA':
      pathTOImage =
          'https://media.gemini.media/img/original/2019/8/6/2019_8_6_11_32_15_497.jpg';
      break;
    default:
      pathTOImage =
          'https://i.pinimg.com/originals/76/27/af/7627af55c627e7f6b60880f1a684cd77.jpg';
      break;
  }
  return pathTOImage;
}
