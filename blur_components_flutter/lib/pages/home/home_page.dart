import 'package:blur_components_flutter/blur_widget.dart';
import 'package:blur_components_flutter/main.dart';
import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("DM's Blur Gallery"),
        actions: [
          IconButton(
            onPressed: () {
              themeModeNotifier.value =
                  themeModeNotifier.value == ThemeMode.light
                  ? ThemeMode.dark
                  : ThemeMode.light;
            },
            icon: HugeIcon(
              icon: HugeIcons.strokeRoundedMoon02,
              color: themeData.colorScheme.onSurface,
            ),
          ),
        ],
        flexibleSpace: BlurWidget(child: SizedBox.expand()),
      ),
      extendBodyBehindAppBar: true,
      body: ListView(
        children: [
          Image.asset("images/1.jpg"),
          Image.asset("images/2.jpg"),
          Image.asset("images/3.jpg"),
          Image.asset("images/4.jpg"),
          Image.asset("images/3.jpg"),
          Image.asset("images/2.jpg"),
          Image.asset("images/1.jpg"),
          Padding(
            padding: const EdgeInsets.all(20),
            child: FilledButton(onPressed: () {}, child: Text("FilledButton")),
          ),
        ],
      ),
    );
  }
}
