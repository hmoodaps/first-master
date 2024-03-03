import 'package:flutter/material.dart';
import 'package:untitled3/components/components.dart';
import 'package:untitled3/cubit/cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled3/cubit/states.dart';
import 'package:untitled3/screens/drawer.dart';

import '../screens/search_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CubitClass, AppState>(
      listener: (context, state) {},
      builder: (context, state) {
        CubitClass cub = CubitClass.get(context);
        // bool isBelgium = cub.isBelgiumSub!;
        // bool isNetherlands = cub.isNetherlandsSub!;
        // bool isGermany = cub.isGermanySub!;
        // bool isUSA = cub.isUsaSub!;
        // bool isEgypt = cub.isEgyptSub!;
        // List<Widget> flags = [
        //   Column(
        //     children: [
        //       SizedBox(
        //         height: 60,
        //         child: ElevatedButton(
        //           onPressed: () {
        //             cub.isBelgiumSubmitted();
        //             cub.isPressed = !cub.isPressed!;
        //           },
        //           child: Row(
        //             children: [
        //               CircleAvatar(
        //                 backgroundColor: Colors.transparent,
        //                 radius: 20,
        //                 backgroundImage: AssetImage('assets/belgium.png'),
        //                 child: CircleAvatar(
        //                   backgroundColor: Colors.transparent,
        //                 ),
        //               ),
        //               SizedBox(
        //                 width: 10,
        //               ),
        //               Text(
        //                 'Belgium',
        //                 style: TextStyle(fontSize: 18),
        //               ),
        //               Spacer(),
        //               // CircleAvatar(backgroundColor: cub.isFlagChosen(isBelgium),radius: 10,),
        //               Icon(cub.chosedFlagSign(cub.chosedFlag)),
        //             ],
        //           ),
        //         ),
        //       ),
        //       const SizedBox(
        //         height: 10,
        //       ),
        //       const Divider(
        //         height: 1,
        //         thickness: 1,
        //         color: Colors.grey,
        //       ),
        //       SizedBox(
        //         height: 60,
        //         child: ElevatedButton(
        //           onPressed: () {
        //             cub.isNetherlandsSubmitted();
        //             cub.isPressed = !cub.isPressed!;
        //           },
        //           child:  Row(
        //             children: [
        //               const CircleAvatar(
        //                 backgroundColor: Colors.transparent,
        //                 radius: 20,
        //                 backgroundImage: AssetImage('assets/netherlands.png'),
        //                 child: CircleAvatar(
        //                   backgroundColor: Colors.transparent,
        //                 ),
        //               ),
        //               const SizedBox(
        //                 width: 10,
        //               ),
        //               const Text(
        //                 'Netherlands',
        //                 style: TextStyle(fontSize: 18),
        //               ),
        //               const Spacer(),
        //               Icon(cub.chosedFlagSign(cub.chosedFlag)),
        //             ],
        //           ),
        //         ),
        //       ),
        //       const SizedBox(
        //         height: 10,
        //       ),
        //       const Divider(
        //         height: 1,
        //         thickness: 1,
        //         color: Colors.grey,
        //       ),
        //       SizedBox(
        //         height: 60,
        //         child: ElevatedButton(
        //           onPressed: () {
        //             cub.isGermanySubmitted();
        //             cub.isPressed = !cub.isPressed!;
        //           },
        //           child:  Row(
        //             children: [
        //               CircleAvatar(
        //                 backgroundColor: Colors.transparent,
        //                 radius: 20,
        //                 backgroundImage: AssetImage('assets/germany.png'),
        //                 child: CircleAvatar(
        //                   backgroundColor: Colors.transparent,
        //                 ),
        //               ),
        //               SizedBox(
        //                 width: 10,
        //               ),
        //               Text(
        //                 'Germany',
        //                 style: TextStyle(fontSize: 18),
        //               ),
        //               Spacer(),
        //               Icon(cub.chosedFlagSign(cub.chosedFlag)),
        //             ],
        //           ),
        //         ),
        //       ),
        //       const SizedBox(
        //         height: 10,
        //       ),
        //       const Divider(
        //         height: 1,
        //         thickness: 1,
        //         color: Colors.grey,
        //       ),
        //       SizedBox(
        //         height: 60,
        //         child: ElevatedButton(
        //           onPressed: () {
        //             cub.isUsaSubmitted();
        //             cub.isPressed = !cub.isPressed!;
        //           },
        //           child:  Row(
        //             children: [
        //               CircleAvatar(
        //                 backgroundColor: Colors.transparent,
        //                 radius: 20,
        //                 backgroundImage: AssetImage('assets/usa.png'),
        //                 child: CircleAvatar(
        //                   backgroundColor: Colors.transparent,
        //                 ),
        //               ),
        //               SizedBox(
        //                 width: 10,
        //               ),
        //               Text(
        //                 'USA',
        //                 style: TextStyle(fontSize: 18),
        //               ),
        //               Spacer(),
        //
        //               Icon(cub.chosedFlagSign(cub.chosedFlag)),
        //             ],
        //           ),
        //         ),
        //       ),
        //       const SizedBox(
        //         height: 10,
        //       ),
        //       const Divider(
        //         height: 1,
        //         thickness: 1,
        //         color: Colors.grey,
        //       ),
        //       SizedBox(
        //         height: 60,
        //         child: ElevatedButton(
        //           onPressed: () {
        //             cub.isEgyptSubmitted();
        //             cub.isPressed = !cub.isPressed!;
        //           },
        //           child:  Row(
        //             children: [
        //               CircleAvatar(
        //                 backgroundColor: Colors.transparent,
        //                 radius: 20,
        //                 backgroundImage: AssetImage('assets/egypt.png'),
        //                 child: CircleAvatar(
        //                   backgroundColor: Colors.transparent,
        //                 ),
        //               ),
        //               SizedBox(
        //                 width: 10,
        //               ),
        //               Text(
        //                 'Egypt',
        //                 style: TextStyle(fontSize: 18),
        //               ),
        //               Spacer(),
        //
        //               Icon(cub.chosedFlagSign(cub.chosedFlag)),
        //             ],
        //           ),
        //         ),
        //       ),
        //       const SizedBox(
        //         height: 10,
        //       ),
        //       const Divider(
        //         height: 1,
        //         thickness: 1,
        //         color: Colors.grey,
        //       ),
        //     ],
        //   ),
        // ];

        return Scaffold(
          appBar: AppBar(
            // leading: IconButton(
            //   icon: const Icon(Icons.menu),
            //   onPressed: () {
            //     showDialog(
            //       context: context,
            //       builder: (BuildContext context) {
            //         return AlertDialog(
            //           actions: [
            //             ButtonBar(
            //                 alignment: MainAxisAlignment.center,
            //                 children: [
            //                   ElevatedButton(
            //                     onPressed: () {
            //                       Navigator.pop(context);
            //                     },
            //                     style: ButtonStyle(
            //                       backgroundColor:
            //                           MaterialStateProperty.all<Color>(
            //                               Colors.red),
            //                     ),
            //                     child: const Text(
            //                       'Cancle',
            //                     ),
            //                   ),
            //                   const Spacer(),
            //                   ElevatedButton(
            //                     onPressed: () {},
            //                     style: ButtonStyle(
            //                       backgroundColor:
            //                           MaterialStateProperty.all<Color>(
            //                               Colors.green),
            //                     ),
            //                     child: const Text(
            //                       'Exactly',
            //                     ),
            //                   ),
            //                 ]),
            //           ],
            //           title: const Text('Choose a flag'),
            //           content: SizedBox(
            //             height: 60 * 6,
            //             child: Column(
            //               children: flags,
            //             ),
            //           ),
            //         );
            //       },
            //     );
            //   },
            // ),

            actions: [
              IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const Search(),
                    ),
                  );
                },
                icon: const Icon(Icons.search),
              ),
              IconButton(
                onPressed: () {
                  cub.isBrightness = !cub.isBrightness;
                },
                icon: Icon(cub.changeBrightnessIcon(cub.brightnessIcon)),
              )
            ],
            title: const Text('News App'),
          ),
          bottomNavigationBar: BottomNavigationBar(
            items: cub.items,
            onTap: (value) {
              cub.changeBottomBar(value);
            },
            currentIndex: cub.currentIndex,
          ),
          body: cub.screens[cub.currentIndex],
        );
      },
    );
  }
}
