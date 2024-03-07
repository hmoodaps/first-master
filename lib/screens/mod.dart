import 'package:flutter/material.dart';
import '../cubit/cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubit/states.dart';
import '../network/shared_preferencers.dart';

class Mod extends StatelessWidget {
  const Mod({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CubitClass, AppState>(
      listener: (context, state) {},
      builder: (context, state) {
        CubitClass cub = CubitClass.get(context);
        return IconButton(
          onPressed: () async {
            await Save.setBoolData('key', !cub.isBrightness);
            if (Save.getBoolData('key') != null) {
              cub.isBrightness = !cub.isBrightness;
            } else {
              cub.isBrightness = Save.getBoolData('key')!;
            }
          },
          icon: Icon(cub.changeBrightnessIcon(cub.brightnessIcon)),
        );
      },
    );
  }
}
