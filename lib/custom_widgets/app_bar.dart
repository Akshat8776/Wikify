import 'package:freo_task/custom_widgets/theme_toggle.dart';
import 'package:flutter/material.dart';
import 'language_toggle.dart';

class Appbar extends StatelessWidget {
  const Appbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 50.0, left: 40, right: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.max,
        children: [
          // const SizedBox(),
          Text(
            "Wikify",
            style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                fontWeight: FontWeight.bold,
                fontSize: 40,
                color: Colors.purple),
          ),
          const Row(
            children: [ThemeToggle(), LanguageToggle()],
          ),
        ],
      ),
    );
  }
}
