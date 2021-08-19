import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:pokedex/app/app.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _spinPokeball;

  @override
  void initState() {
    _initSpinPokeballAnimation();
    Future.delayed(Duration(seconds: 6)).then(
      (_) => Modular.to.pushReplacementNamed("/home"),
    );
    super.initState();
  }

  void _initSpinPokeballAnimation() {
    _spinPokeball = AnimationController(
      duration: Duration(seconds: 5),
      vsync: this,
    );
    _spinPokeball.repeat();
  }

  @override
  void dispose() {
    _spinPokeball.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: LayoutBuilder(
        builder: (context, constraints) {
          return Container(
            alignment: Alignment.center,
            margin: const EdgeInsets.all(8),
            height: constraints.maxHeight,
            width: constraints.maxWidth,
            child: RotationTransition(
              turns: Tween(begin: 0.0, end: 1.0).animate(_spinPokeball),
              child: Opacity(
                opacity: 0.2,
                child: Image.asset(
                  AppImages.blackPokeball,
                  height: constraints.maxHeight * 0.5,
                  width: constraints.maxWidth * 0.5,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
