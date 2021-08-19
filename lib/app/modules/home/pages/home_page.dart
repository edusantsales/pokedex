import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:pokedex/app/app.dart';
import 'package:pokedex/app/modules/home/components/home_components.dart';
import 'package:pokedex/app/modules/home/home_view_model.dart';
import 'package:pokedex/app/shared/components/components.dart';
import 'package:rx_notifier/rx_notifier.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _viewmodel = Modular.get<HomeViewModel>();
  final _scrollController = ScrollController();

  @override
  void initState() {
    _viewmodel.getPokemons();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels >=
          _scrollController.position.maxScrollExtent) {
        _viewmodel.nextPage();
      }
    });
    rxObserver(
      () => _viewmodel.error.value.map(
        (e) => _viewmodel.showSnackBar(context, e),
      ),
    );
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: LayoutBuilder(
        builder: (context, constraints) {
          return SafeArea(
            child: Stack(
              alignment: Alignment.topCenter,
              clipBehavior: Clip.none,
              children: [
                PokeHomeAppBar(),
                Column(
                  children: [
                    SizedBox(height: constraints.maxHeight * 0.3),
                    Expanded(
                      flex: 1,
                      child: RxBuilder(
                        builder: (context) {
                          _viewmodel.loading();
                          return (_viewmodel.pokemons.isEmpty)
                              ? _viewmodel.loadingWidget.value
                              : AnimationLimiter(
                                  child: GridView.builder(
                                    controller: _scrollController,
                                    gridDelegate:
                                        SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 2,
                                    ),
                                    itemCount: _viewmodel.pokemons.length,
                                    itemBuilder: (context, index) {
                                      var pokemon = _viewmodel.pokemons[index];
                                      return AnimationConfiguration
                                          .staggeredGrid(
                                        columnCount: 2,
                                        duration: Duration(milliseconds: 400),
                                        position: index,
                                        child: ScaleAnimation(
                                          child: GestureDetector(
                                            onTap: _viewmodel.loadDetailPage(
                                              index,
                                              pokemon,
                                            ),
                                            child: PokeItem(pokemon: pokemon),
                                          ),
                                        ),
                                      );
                                    },
                                    padding: const EdgeInsets.all(8),
                                  ),
                                );
                        },
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
