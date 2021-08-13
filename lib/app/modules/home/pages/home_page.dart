import 'package:flutter/material.dart';
import 'package:pokedex/app/app.dart';
import 'package:pokedex/app/shared/components/components.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: LayoutBuilder(builder: (context, constraints) {
        return SafeArea(
          child: Stack(
            alignment: Alignment.topCenter,
            clipBehavior: Clip.none,
            children: [
              Positioned(
                top: -(constraints.maxHeight / 5),
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
              AppBarHome(),
              Container(
                child: Column(
                  children: [
                    Container(height: constraints.maxHeight * 0.35),
                    Expanded(
                      flex: 1,
                      child: Container(
                        child: ListView(
                          children: [
                            ListTile(
                              title: Text("Pokemon"),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}
