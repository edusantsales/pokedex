import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:pokedex/app/app.dart';
import 'package:pokedex/app/modules/favorite/favorite_view_model.dart';

class PokeFavoriteAppBar extends StatelessWidget {
  final _viewmodel = Modular.get<FavoriteViewModel>();

  PokeFavoriteAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Stack(
          alignment: Alignment.topCenter,
          clipBehavior: Clip.none,
          children: [
            Positioned(
              top: -(constraints.maxHeight / 4),
              right: constraints.maxWidth * 0.55,
              child: Opacity(
                opacity: 0.1,
                child: Image.asset(
                  AppImages.blackPokeball,
                  height: constraints.maxHeight * 0.65,
                  width: constraints.maxWidth * 0.65,
                ),
              ),
            ),
            Container(
              height: constraints.maxHeight * 0.25,
              child: Column(
                children: [
                  Container(
                    color: Colors.transparent,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 20, left: 20),
                          child: IconButton(
                            icon: Icon(Icons.arrow_back, size: 30),
                            onPressed: _viewmodel.loadHomePage(),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 20),
                        child: Text(
                          "Favorites",
                          style: AppTextStyles.textBlack(28),
                        ),
                      ),
                    ],
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
