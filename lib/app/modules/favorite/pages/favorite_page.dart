import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:pokedex/app/app.dart';
import 'package:pokedex/app/modules/favorite/components/poke_favorite_app_bar.dart';
import 'package:pokedex/app/modules/favorite/favorite_view_model.dart';
import 'package:pokedex/app/shared/components/components.dart';
import 'package:rx_notifier/rx_notifier.dart';

class FavoritePage extends StatefulWidget {
  const FavoritePage({Key? key}) : super(key: key);

  @override
  _FavoritePageState createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  final _viewmodel = Modular.get<FavoriteViewModel>();
  final _scrollController = ScrollController();

  @override
  void initState() {
    _viewmodel.getFavoritesPokemon();
    super.initState();
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
                PokeFavoriteAppBar(),
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
