import 'package:flutter/material.dart';
import 'package:pokedex/app/app_images.dart';
import 'package:pokedex/app/app_text_styles.dart';
import 'package:pokedex/app/shared/entities/pokemon.dart';

class PokeItem extends StatelessWidget {
  final Pokemon pokemon;

  const PokeItem({Key? key, required this.pokemon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) => Padding(
        padding: const EdgeInsets.all(8),
        child: Container(
          padding: const EdgeInsets.all(4),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(20)),
            color: this.pokemon.getColorType()!,
          ),
          child: Stack(
            children: [
              Container(
                alignment: Alignment.bottomRight,
                child: Hero(
                  tag: pokemon.name + "-pokeball",
                  child: Opacity(
                    opacity: 0.2,
                    child: Image.asset(
                      AppImages.whitePokeball,
                      height: constraints.maxHeight * 0.5,
                      width: constraints.maxWidth * 0.5,
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: Container(
                  height: constraints.maxHeight * 0.5,
                  width: constraints.maxWidth * 0.5,
                  child: Hero(
                    tag: pokemon.name,
                    child: Image.network(this.pokemon.imageUrl),
                  ),
                ),
              ),
              Container(
                alignment: Alignment.topLeft,
                padding: const EdgeInsets.all(8),
                child: Text(
                  this.pokemon.getFormattedName(this.pokemon.name),
                  style: AppTextStyles.textWhite(16),
                ),
              ),
              Container(
                padding: const EdgeInsets.only(left: 8, top: 35),
                child: showPokemonTypes(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget showPokemonTypes() {
    List<Widget> widgets = [];
    this.pokemon.types.forEach((element) {
      var typeName = this.pokemon.getFormattedName(element);
      widgets.add(
        Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.zero,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white30,
              ),
              child: Padding(
                padding: const EdgeInsets.all(6),
                child: Text(
                  typeName.trim(),
                  style: AppTextStyles.textWhite(12),
                ),
              ),
            ),
            SizedBox(height: 6)
          ],
        ),
      );
    });
    return Column(
      children: widgets,
      crossAxisAlignment: CrossAxisAlignment.start,
    );
  }
}
