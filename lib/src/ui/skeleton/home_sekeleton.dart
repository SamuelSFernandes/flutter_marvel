import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class SkeletonHomeWidget extends StatelessWidget {
  const SkeletonHomeWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 5.0,
        mainAxisSpacing: 5.0,
        childAspectRatio: 0.9,
      ),
      itemCount: 10,
      itemBuilder: (_, index) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Expanded(
                flex: 2,
                child: Shimmer.fromColors(
                  baseColor: Colors.grey,
                  highlightColor: Colors.grey.withAlpha(70),
                  child: ColoredBox(
                    color: Colors.grey.withAlpha(50),
                    child: const Center(
                      child: SizedBox(
                        height: 10,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Expanded(
                flex: 1,
                child: Shimmer.fromColors(
                  baseColor: Colors.grey,
                  highlightColor: Colors.grey.withAlpha(70),
                  child: ColoredBox(
                    color: Colors.grey.withAlpha(50),
                    child: const Center(
                      child: SizedBox(
                        height: 10,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
