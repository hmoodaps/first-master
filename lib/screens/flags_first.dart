import 'package:flutter/material.dart';
import 'package:popover/popover.dart';

import '../components/components.dart';
import '../cubit/cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubit/states.dart';
import '../network/shared_preferencers.dart';

class FlagMenu extends StatelessWidget {
  const FlagMenu({super.key});


  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CubitClass, AppState>(
      listener: (context, state) {},
      builder: (context, state) {
        CubitClass cub = CubitClass.get(context);
        return GestureDetector(
          child: cub.pathToImage ==null ? const Icon(Icons.arrow_drop_down_circle):cub.changFlag(),
          onTap: () async {
            await showPopover(
              context: context,
              bodyBuilder: (context) => bodyBuilder(context),
              backgroundColor: cub.changeFlagsBackground(),
              width: 200,
              height: 247,
            );
          },
        );
      },
    );
  }
}
