import 'package:flutter/material.dart';
import 'package:untitled3/cubit/cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled3/cubit/states.dart';
import '../screens/flags_first.dart';
import '../screens/mod.dart';
import '../screens/search_screen.dart';

class HomeScreen extends StatelessWidget {
  final CubitClass ?  cub;
  const HomeScreen(this.cub ,{super.key});
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CubitClass, AppState>(
        listener: (context, state) {},
        builder: (context, state) {
          CubitClass cub = CubitClass.get(context);

          return Scaffold(
            appBar: AppBar(
              leading: const FlagMenu(),
              actions: [
                IconButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const Search(),
                          ));
                    },
                    icon: const Icon(
                      Icons.search,
                    )),
              const Mod(),
              ],
              title: const Text(
                'News App',
              ),
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
        });
  }
}
