import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled3/cubit/cubit.dart';
import '../components/components.dart';
import '../cubit/states.dart';

class Search extends StatelessWidget {
  const Search({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CubitClass, AppState>(
        listener: (context, state) {},
        builder: (context, state) {
          CubitClass cubitClass = CubitClass.get(context);
          List<dynamic>? list = cubitClass.mySearch;
          return Scaffold(
            appBar: AppBar(
              title: Text('Search a news'),
              leading: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(Icons.home),
              ),
            ),
            body: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                children: [
                  TextFormField(
                    maxLines: 1,
                    onChanged: (searchWord
                        ) {
                      cubitClass.getSearch(searchWord);
                      cubitClass.mySearch?.clear();

                    },
                    keyboardType: TextInputType.text,
                    maxLength: 50,
                    style: TextStyle(color:cubitClass.changeIconsColor(),),
                    onFieldSubmitted: (searchWord){
                      cubitClass.getSearch(searchWord);
                      cubitClass.mySearch?.clear();

                    },

                    decoration: InputDecoration(
                      hintText: 'Search',
                      prefixIcon: const Icon(Icons.search),
                      fillColor: cubitClass.changeFieldsColor(),
                      filled: true,
                      focusColor: cubitClass.changeFieldsColor(),
                      prefixIconColor: cubitClass.changeFieldsBorderAndColor(),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: cubitClass.changeFieldsBorderAndColor(),),
                          borderRadius: BorderRadius.circular(10)
                      ),
                      counterText: '',
                      labelText: 'Search',
                      labelStyle: const TextStyle(color: Colors.red),

                    ),
                  ),
                  const SizedBox(height: 15,),
                  Expanded(child:
                  cubitClass.mySearch!.isEmpty
                      ? const Text('Nothing here')
                      : conditionalSearchItemsBuilder(context, list)),
                ],
              ),
            ),
          );
        });
  }
}
