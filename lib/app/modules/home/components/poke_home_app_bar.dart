import 'package:flutter/material.dart';
import 'package:pokedex/app/app.dart';

class PokeHomeAppBar extends StatelessWidget {
  const PokeHomeAppBar({Key? key}) : super(key: key);

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
              left: constraints.maxWidth * 0.55,
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
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 20, right: 21),
                          child: IconButton(
                            icon: Icon(Icons.arrow_forward, size: 30),
                            onPressed: () {},
                          ),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: Text(
                          "Pokedex",
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
