import 'package:freo_task/enums/states_enum.dart';
import 'package:freo_task/provider/result_provider.dart';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:freo_task/global/global.dart';

class LoadingStates extends StatelessWidget {
  final ResultProvider resultProvider;

  const LoadingStates({super.key, required this.resultProvider});
  @override
  Widget build(BuildContext context) {
    return resultProvider.state == Current_State.SEARCHING
        ? Padding(
            padding: const EdgeInsets.only(top: 0.0),
            child: Align(
                // alignment: Alignment.center,
                child: LoadingAnimationWidget.discreteCircle(
              color: Colors.grey,
              size: 50,
            )),
          )
        : resultProvider.state == Current_State.NO_ITEM
            ? Padding(
                padding: const EdgeInsets.only(top: 0.0),
                child: Align(
                    // alignment: Alignment.center,
                    child: Text("No results found.",
                        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                              fontSize: 20,
                              color: textColor,
                            ))),
              )
            : resultProvider.state == Current_State.NO_INTERNET
                ? Align(
                    alignment: Alignment.center,
                    child: Text("No internet connection detected...",
                        style: Theme.of(context)
                            .textTheme
                            .bodyLarge!
                            .copyWith(color: textColor, fontSize: 15)))
                : Align(
                    // alignment: Alignment.center,
                    child: Text(
                      "Type what you are looking for...",
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            fontSize: 18,
                            color: textColor,
                          ),
                    ),
                  );
  }
}
