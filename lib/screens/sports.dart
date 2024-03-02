import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled3/cubit/cubit.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';

import '../components/components.dart';
import '../cubit/states.dart';

class Sport extends StatelessWidget {
  const Sport({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CubitClass, AppState>(
      listener: (context, state) {},
      builder: (context, state) {
        CubitClass cubitClass =CubitClass.get(context);
        List<dynamic>? list = cubitClass.mySport;
        return conditionalItemBuilder(context, list);
      },
    );
  }
}
