import 'package:flutter/material.dart';
import 'package:pokedex/app/app.dart';

class PokeStatusBar extends StatelessWidget {
  final double widthFactor;

  PokeStatusBar({Key? key, required this.widthFactor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 12),
          child: Container(
            alignment: Alignment.centerLeft,
            decoration: ShapeDecoration(
              shape: StadiumBorder(),
              color: AppColors.grey,
            ),
            height: 10,
            transform: Transform.translate(offset: Offset(0, 6)).transform,
            width: constraints.maxWidth * 0.9,
            child: FractionallySizedBox(
              heightFactor: 1.0,
              widthFactor: widthFactor,
              child: Container(
                decoration: ShapeDecoration(
                  shape: StadiumBorder(),
                  color: widthFactor < 0.3
                      ? Colors.red
                      : widthFactor < 0.5
                          ? Colors.yellow[600]
                          : Colors.green,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
