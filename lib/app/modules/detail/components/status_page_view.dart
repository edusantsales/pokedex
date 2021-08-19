import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:pokedex/app/app.dart';
import 'package:pokedex/app/modules/detail/components/poke_status_bar.dart';
import 'package:pokedex/app/modules/detail/detail_view_model.dart';

class StatusPageView extends StatelessWidget {
  final _viewmodel = Modular.get<DetailViewModel>();

  StatusPageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Stack(
          children: [
            Container(
              margin: const EdgeInsets.all(8),
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              child: Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "HP",
                          style: AppTextStyles.textBlack(16),
                        ),
                        Text(
                          "Attack",
                          style: AppTextStyles.textBlack(16),
                        ),
                        Text(
                          "Defense",
                          style: AppTextStyles.textBlack(16),
                        ),
                        Text(
                          "Sp. Attack",
                          style: AppTextStyles.textBlack(16),
                        ),
                        Text(
                          "Sp. Defense",
                          style: AppTextStyles.textBlack(16),
                        ),
                        Text(
                          "Speed",
                          style: AppTextStyles.textBlack(16),
                        ),
                        Text(
                          "Total",
                          style: AppTextStyles.textBlack(16),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Column(
                      children: [
                        Text(
                          "${_viewmodel.pokemon.value.stats[0].toString()}",
                          style: AppTextStyles.textSemiBlack(16),
                        ),
                        Text(
                          "${_viewmodel.pokemon.value.stats[1].toString()}",
                          style: AppTextStyles.textSemiBlack(16),
                        ),
                        Text(
                          "${_viewmodel.pokemon.value.stats[2].toString()}",
                          style: AppTextStyles.textSemiBlack(16),
                        ),
                        Text(
                          "${_viewmodel.pokemon.value.stats[3].toString()}",
                          style: AppTextStyles.textSemiBlack(16),
                        ),
                        Text(
                          "${_viewmodel.pokemon.value.stats[4].toString()}",
                          style: AppTextStyles.textSemiBlack(16),
                        ),
                        Text(
                          "${_viewmodel.pokemon.value.stats[5].toString()}",
                          style: AppTextStyles.textSemiBlack(16),
                        ),
                        Text(
                          "${_viewmodel.getPokemonTotalStatus(_viewmodel.pokemon.value.stats).toString()}",
                          style: AppTextStyles.textSemiBlack(16),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 4,
                    child: Column(
                      children: [
                        PokeStatusBar(widthFactor: _viewmodel.pokemon.value.stats[0] / 160),
                        PokeStatusBar(widthFactor: _viewmodel.pokemon.value.stats[1] / 160),
                        PokeStatusBar(widthFactor: _viewmodel.pokemon.value.stats[2] / 160),
                        PokeStatusBar(widthFactor: _viewmodel.pokemon.value.stats[3] / 160),
                        PokeStatusBar(widthFactor: _viewmodel.pokemon.value.stats[4] / 160),
                        PokeStatusBar(widthFactor: _viewmodel.pokemon.value.stats[5] / 160),
                        PokeStatusBar(
                            widthFactor:
                                _viewmodel.getPokemonTotalStatus(_viewmodel.pokemon.value.stats) / 960),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
