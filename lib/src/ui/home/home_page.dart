import 'package:flutter/material.dart';
import 'package:flutter_marvel/src/ui/home/widgets/news_itens_list_loading_widget.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../skeleton/home_sekeleton.dart';
import 'home_viewmodel.dart';
import 'widgets/list_item_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final viewModel = HomeViewModel();

  @override
  void initState() {
    viewModel.initialize();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    viewModel.scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset(
          'assets/logo.png',
          height: 40,
        ),
      ),
      body: Observer(
        builder: (_) {
          if (viewModel.isLoadingAllItens) {
            return const SkeletonHomeWidget();
          }
          if (viewModel.characters.isEmpty) {
            return Center(
              child: Text(
                'Nenhum personagem foi encontrado :(',
                style: Theme.of(context).textTheme.titleLarge,
              ),
            );
          }
          return Stack(
            alignment: Alignment.bottomCenter,
            children: [
              GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 5.0,
                  mainAxisSpacing: 5.0,
                  childAspectRatio: 0.9,
                ),
                controller: viewModel.scrollController,
                itemCount: viewModel.characters.length,
                itemBuilder: (_, index) {
                  final item = viewModel.characters[index];
                  return ListItemWidget(item: item);
                },
              ),
              if (viewModel.isLoadingNewItens)
                const NewItensListLoadingWidget(),
            ],
          );
        },
      ),
    );
  }
}
