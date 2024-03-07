import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled3/cubit/cubit.dart';

import '../components/components.dart';
import '../cubit/states.dart';

class Health extends StatelessWidget {
  const Health({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CubitClass, AppState>(
      listener: (context, state) {},
      builder: (context, state) {
        CubitClass cubitClass = CubitClass.get(context);
        List<dynamic>? list = cubitClass.myHealth;
        return conditionalItemBuilder(context, list);
      },
    );
  }
}
