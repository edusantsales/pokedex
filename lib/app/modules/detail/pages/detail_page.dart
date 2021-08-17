import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:pokedex/app/app.dart';
import 'package:pokedex/app/modules/detail/detail_view_model.dart';
import 'package:pokedex/app/shared/entities/entities.dart';
import 'package:rx_notifier/rx_notifier.dart';
import 'package:sliding_sheet/sliding_sheet.dart';

class DetailPage extends StatefulWidget {
  final Map<String, Object> pokemap;

  const DetailPage({Key? key, required this.pokemap}) : super(key: key);

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> with TickerProviderStateMixin {
  final _viewmodel = Modular.get<DetailViewModel>();

  late PageController _pageController;
  late AnimationController _spinPokeball;
  late AnimationController _growUpPokemon;

  var _progress = 0.0;
  var _multiple = 1.0;
  var _opacity = 1.0;
  var _opacityTitle = 0.0;

  @override
  void initState() {
    _viewmodel.pokemonIndex = widget.pokemap["index"] as int;
    _viewmodel.pokemon.value = widget.pokemap["pokemon"] as Pokemon;
    _viewmodel.pokemons = widget.pokemap["pokemons"] as RxList<Pokemon>;
    _pageController = PageController(
      initialPage: _viewmodel.pokemonIndex,
      viewportFraction: 0.5,
    );
    _initSpinPokeballAnimation();
    _initGrowUpAnimation();
    super.initState();
  }

  void _initSpinPokeballAnimation() {
    _spinPokeball = AnimationController(
      duration: Duration(seconds: 5),
      vsync: this,
    );
    _spinPokeball.repeat();
  }

  void _initGrowUpAnimation() {
    _growUpPokemon = AnimationController(
      duration: Duration(milliseconds: 500),
      vsync: this,
    );
    _growUpPokemon.forward();
  }

  @override
  void dispose() {
    _spinPokeball.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RxBuilder(builder: (context) {
      return Scaffold(
        backgroundColor: _viewmodel.pokemon.value.getColorType(),
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(132),
          child: Column(
            children: [
              AppBar(
                actions: [
                  Align(
                    alignment: Alignment.centerRight,
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        RotationTransition(
                          turns: Tween(begin: 0.0, end: 1.0)
                              .animate(_spinPokeball),
                          child: Opacity(
                            opacity: _opacityTitle >= 0.2 ? 0.2 : 0.0,
                            child: Image.asset(
                              AppImages.whitePokeball,
                              height: 50,
                              width: 50,
                            ),
                          ),
                        ),
                        IconButton(
                          icon: Icon(Icons.favorite_border,
                              color: AppColors.white),
                          onPressed: () {},
                        ),
                      ],
                    ),
                  ),
                ],
                backgroundColor: _viewmodel.pokemon.value.getColorType(),
                elevation: 0,
                leading: IconButton(
                  icon: Icon(Icons.arrow_back, color: AppColors.white),
                  onPressed: _viewmodel.loadHomePage(),
                ),
              ),
              Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.only(left: 20),
                transform: Transform.translate(
                  offset: Offset(0, -16),
                ).transform,
                child: Text(
                  _viewmodel.pokemon.value.getFormattedName(
                    _viewmodel.pokemon.value.name,
                  ),
                  style: AppTextStyles.textSemiWhite(22),
                ),
              ),
              Container(
                padding: const EdgeInsets.only(left: 20, top: 15, right: 20),
                transform: Transform.translate(
                  offset: Offset(0, -16),
                ).transform,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    showPokemonTypes(),
                    Text(
                      "#0${_viewmodel.pokemon.value.id}",
                      style: AppTextStyles.textSemiWhite(22),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        body: LayoutBuilder(
          builder: (context, constraints) => Stack(
            children: [
              Container(
                height: constraints.maxHeight * 0.4,
              ),
              SlidingSheet(
                cornerRadius: 30,
                elevation: 0,
                listener: (state) {
                  setState(() {
                    _progress = state.progress;
                    _multiple = 1 - _viewmodel.interval(0.0, 0.8, _progress);
                    _opacity = _multiple;
                    _opacityTitle =
                        _multiple = _viewmodel.interval(0.7, 1, _progress);
                  });
                },
                snapSpec: const SnapSpec(
                  snap: true,
                  snappings: [0.7, 1.0],
                  positioning: SnapPositioning.relativeToAvailableSpace,
                ),
                builder: (context, state) {
                  return Container(
                    height: constraints.maxHeight,
                  );
                },
              ),
              Opacity(
                opacity: _opacity,
                child: Container(
                  height: constraints.maxHeight * 0.4,
                  transform: Transform.translate(
                          offset: Offset(0, (0 - (_progress * 50))))
                      .transform,
                  child: PageView.builder(
                    controller: _pageController,
                    itemCount: _viewmodel.pokemons.length,
                    itemBuilder: (context, index) {
                      return Stack(
                        alignment: Alignment.center,
                        children: [
                          index == _viewmodel.pokemonIndex
                              ? RotationTransition(
                                  turns: Tween(begin: 0.0, end: 1.0)
                                      .animate(_spinPokeball),
                                  child: Hero(
                                    tag: index == _viewmodel.pokemonIndex
                                        ? _viewmodel.pokemon.value.name +
                                            "-pokeball"
                                        : "pokeball-$index",
                                    child: Opacity(
                                      opacity: 0.2,
                                      child: Image.asset(
                                        AppImages.whitePokeball,
                                        height: constraints.maxHeight,
                                        width: constraints.maxWidth,
                                      ),
                                    ),
                                  ),
                                )
                              : Container(),
                          AnimatedPadding(
                            curve: Curves.bounceInOut,
                            duration: Duration(milliseconds: 500),
                            padding: EdgeInsets.all(
                                index == _viewmodel.pokemonIndex ? 0 : 60),
                            child: Hero(
                              tag: index == _viewmodel.pokemonIndex
                                  ? _viewmodel.pokemon.value.name
                                  : "pokemon-$index",
                              child: Image.network(
                                _viewmodel.pokemons[index].imageUrl,
                                color: index == _viewmodel.pokemonIndex
                                    ? null
                                    : Colors.black.withOpacity(0.5),
                              ),
                            ),
                          ),
                        ],
                      );
                    },
                    onPageChanged: (index) {
                      _viewmodel.pokemonIndex = index;
                      _viewmodel.pokemon.value = _viewmodel.pokemons[index];
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    });
  }

  Widget showPokemonTypes() {
    List<Widget> widgets = [];
    _viewmodel.pokemon.value.types.forEach((element) {
      var typeName = _viewmodel.pokemon.value.getFormattedName(element);
      widgets.add(
        Row(
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
            SizedBox(width: 8)
          ],
        ),
      );
    });
    return Row(
      children: widgets,
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisAlignment: MainAxisAlignment.start,
    );
  }
}
