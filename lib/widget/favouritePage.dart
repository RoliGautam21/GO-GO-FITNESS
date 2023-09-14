import 'package:flutter/material.dart';

import '../constant/colors.dart';

class FavouritePage extends StatelessWidget {
  const FavouritePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(color: white),
        title: Text(
          'Favourite Excercise',
          style: const TextStyle(
              color: white,
              fontSize: 20,
              fontWeight: FontWeight.w900,
              fontStyle: FontStyle.italic),
        ),
      ),
    );
  }
}
