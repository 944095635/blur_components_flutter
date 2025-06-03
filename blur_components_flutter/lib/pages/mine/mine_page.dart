import 'package:blur_components_flutter/blur_widget.dart';
import 'package:flutter/material.dart';

class MinePage extends StatelessWidget {
  const MinePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 0,
        flexibleSpace: BlurWidget(child: SizedBox.expand()),
      ),
      extendBodyBehindAppBar: true,
      body: SingleChildScrollView(
        child: SizedBox(
          height: 1500,
          child: Align(
            alignment: Alignment.topCenter,
            child: SafeArea(bottom: false, child: Image.asset("images/4.jpg")),
          ),
        ),
      ),
    );
  }
}
