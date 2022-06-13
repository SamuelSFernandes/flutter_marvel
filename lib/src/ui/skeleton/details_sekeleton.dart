import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class SkeletonDetailsWidget extends StatelessWidget {
  final double width;
  const SkeletonDetailsWidget({required this.width, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      scrollDirection: Axis.horizontal,
      children: List.generate(
        3,
        (index) {
          return Padding(
            padding: const EdgeInsets.only(right: 40),
            child: SizedBox(
              height: 300,
              width: width,
              child: Column(
                children: [
                  Shimmer.fromColors(
                    baseColor: Colors.grey,
                    highlightColor: Colors.grey.withAlpha(70),
                    child: ColoredBox(
                      color: Colors.grey.withAlpha(50),
                      child: SizedBox(
                        height: 200,
                        width: width,
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Shimmer.fromColors(
                    baseColor: Colors.grey,
                    highlightColor: Colors.grey.withAlpha(70),
                    child: ColoredBox(
                      color: Colors.grey.withAlpha(50),
                      child: SizedBox(
                        height: 20,
                        width: width,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
