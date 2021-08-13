import 'package:flutter/material.dart';
import 'package:pokedex/app/app.dart';

class AppBarHome extends StatelessWidget {
  const AppBarHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Container(
          height: constraints.maxHeight * 0.3,
          child: Column(
            children: [
              Container(
                color: Colors.transparent,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 50, right: 21),
                      child: IconButton(
                        icon: Icon(Icons.menu),
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
        );
      },
    );
  }
}
