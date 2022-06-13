import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_marvel/src/ui/details/details_viewmodel.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../../data/models/characters_model.dart';
import '../skeleton/details_sekeleton.dart';
import 'widgets/list_itens_widget.dart';

class DetailsPage extends StatefulWidget {
  static String routeName = '/details';

  const DetailsPage({Key? key}) : super(key: key);

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  final viewmodel = DetailsViewModel();

  @override
  void initState() {
    viewmodel.initialize();
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    viewmodel.character =
        ModalRoute.of(context)?.settings.arguments as CharactersModel;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(viewmodel.character!.name),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Hero(
              tag: 'hero-${viewmodel.character!.id}',
              child: CachedNetworkImage(
                imageUrl: viewmodel.character!.thumbnail!.imageUrl,
                fit: BoxFit.cover,
                width: double.infinity,
                height: 300,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 10,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 10),
                  Text(
                    viewmodel.character?.name ?? '',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const SizedBox(height: 10),
                  Text(
                    viewmodel.character?.description ?? '',
                    style: Theme.of(context).textTheme.headline3,
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'Comics',
                    style: TextStyle(fontSize: 24),
                  ),
                  const SizedBox(height: 10),
                  SizedBox(
                    height: 300,
                    width: MediaQuery.of(context).size.width,
                    child: LayoutBuilder(
                      builder: (context, constraints) {
                        return Observer(
                          builder: (_) {
                            if (viewmodel.isLoading) {
                              return SkeletonDetailsWidget(
                                width: constraints.maxWidth * 0.35,
                              );
                            }
                            return ListItensWidget(
                              comics: viewmodel.comics,
                              width: constraints.maxWidth * 0.35,
                            );
                          },
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
