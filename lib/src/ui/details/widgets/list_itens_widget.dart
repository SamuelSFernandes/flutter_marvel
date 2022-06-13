import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../../data/models/comic_model.dart';

class ListItensWidget extends StatelessWidget {
  final double width;
  final List<ComicModel> comics;
  const ListItensWidget({
    Key? key,
    required this.width,
    required this.comics,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: comics.length,
      itemBuilder: (_, index) {
        final item = comics[index];
        return Padding(
          padding: const EdgeInsets.only(right: 40),
          child: SizedBox(
            width: width,
            child: Column(
              children: [
                CachedNetworkImage(
                  imageUrl: item.thumbnail.imageUrl,
                  fit: BoxFit.cover,
                  height: 200,
                ),
                const SizedBox(height: 5),
                Text(
                  item.title,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
