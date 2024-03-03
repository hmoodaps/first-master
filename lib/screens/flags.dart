import 'package:flutter/material.dart';
import 'package:popover/popover.dart';

import '../components/components.dart';
import '../cubit/cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubit/states.dart';

class FlagMenu extends StatelessWidget {
  const FlagMenu({Key? key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CubitClass, AppState>(
      listener: (context, state) {},
      builder: (context, state) {
        CubitClass cub = CubitClass.get(context);
        return GestureDetector(
          child: cub.changFlag(),
          onTap: () async {
            // Show popover
            await showPopover(
              context: context,
              bodyBuilder: (context) => bodyBuilder(context),
              backgroundColor: cub.isBrightness ? Colors.grey : Colors.white,
              width: 200,
              height: 260,
            );

            // Close the popover
          },
        );
      },
    );
  }
}