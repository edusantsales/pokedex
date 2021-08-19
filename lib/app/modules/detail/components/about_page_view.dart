import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:pokedex/app/app.dart';
import 'package:pokedex/app/modules/detail/detail_view_model.dart';
import 'package:rx_notifier/rx_notifier.dart';

class AboutPageView extends StatelessWidget {
  final _viewmodel = Modular.get<DetailViewModel>();

  AboutPageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RxBuilder(
      builder: (context) {
        return Container(
          margin: const EdgeInsets.all(8),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          child: _viewmodel.specie.value.description.isEmpty
              ? Container(
                  alignment: Alignment.topCenter,
                  transform: Transform.translate(
                    offset: Offset(0, 60),
                  ).transform,
                  child: CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation(_viewmodel.pokemon.value.getColorType()),
                  ),
                )
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Description",
                          style: AppTextStyles.textSemiBlack(16),
                        ),
                        SizedBox(height: 8),
                        Container(
                          child: Text(
                            "${_viewmodel.specie.value.description}",
                            style: AppTextStyles.textBlack(14),
                            textAlign: TextAlign.justify,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 12),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Generation",
                          style: AppTextStyles.textSemiBlack(16),
                        ),
                        Container(
                          child: Text(
                            "${_viewmodel.specie.value.generation.toUpperCase()}",
                            style: AppTextStyles.textBlack(14),
                            textAlign: TextAlign.justify,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 12),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Abilities",
                          style: AppTextStyles.textSemiBlack(16),
                        ),
                        SizedBox(height: 8),
                        Container(
                          child: Builder(
                            builder: (context) {
                              return Text.rich(
                                TextSpan(
                                  style: AppTextStyles.textBlack(14),
                                  text: "${_viewmodel.pokemon.value.getFormattedList(_viewmodel.pokemon.value.abilites)}",
                                ),
                                textAlign: TextAlign.justify,
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 12),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Informations",
                          style: AppTextStyles.textSemiBlack(16),
                        ),
                        SizedBox(height: 8),
                        Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Habitat",
                                  style: AppTextStyles.textBlack(14),
                                ),
                                Text(
                                  "${_viewmodel.getFormattedString(_viewmodel.specie.value.habitat)}",
                                  style: AppTextStyles.textSemiBlack(14),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Growth Rate",
                                  style: AppTextStyles.textBlack(14),
                                ),
                                Text(
                                  "${_viewmodel.getFormattedString(_viewmodel.specie.value.growthRate)}",
                                  style: AppTextStyles.textSemiBlack(14),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Height",
                                  style: AppTextStyles.textBlack(14),
                                ),
                                Text(
                                  "${_viewmodel.pokemon.value.getFormattedHeightWeight(_viewmodel.pokemon.value.height)}0 m",
                                  style: AppTextStyles.textSemiBlack(14),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Weight",
                                  style: AppTextStyles.textBlack(14),
                                ),
                                Text(
                                  "${_viewmodel.pokemon.value.getFormattedHeightWeight(_viewmodel.pokemon.value.weight)} kg",
                                  style: AppTextStyles.textSemiBlack(14),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
        );
      },
    );
  }
}
