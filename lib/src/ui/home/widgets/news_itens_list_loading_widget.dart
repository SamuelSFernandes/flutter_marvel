import 'package:flutter/material.dart';

class NewItensListLoadingWidget extends StatelessWidget {
  const NewItensListLoadingWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 24,
      child: Container(
        margin: const EdgeInsets.all(8.0),
        padding: const EdgeInsets.all(8.0),
        decoration: const BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
        ),
        child: const CircularProgressIndicator(),
      ),
    );
  }
}
