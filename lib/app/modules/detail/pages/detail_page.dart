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

class _DetailPageState extends State<DetailPage> {
  final _viewmodel = Modular.get<DetailViewModel>();

  late PageController _pageController;

  @override
  void initState() {
    _viewmodel.index = widget.pokemap["index"] as int;
    _viewmodel.pokemon.value = widget.pokemap["pokemon"] as Pokemon;
    _viewmodel.pokemons = widget.pokemap["pokemons"] as RxList<Pokemon>;
    _pageController = PageController(initialPage: _viewmodel.index);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return RxBuilder(builder: (context) {
      return Scaffold(
        backgroundColor: _viewmodel.pokemon.value.getColorType(),
        appBar: AppBar(
          actions: [
            IconButton(
              icon: Icon(Icons.favorite_border, color: AppColors.white),
              onPressed: () {},
            ),
          ],
          backgroundColor: _viewmodel.pokemon.value.getColorType(),
          elevation: 0,
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: AppColors.white),
            onPressed: () {
              Modular.to.pop();
            },
          ),
          title: Center(
            child: Opacity(
              opacity: 0.0,
              child: Text(
                _viewmodel.pokemon.value
                    .getFormattedName(_viewmodel.pokemon.value.name),
                style: AppTextStyles.textSemiWhite(21),
              ),
            ),
          ),
        ),
        body: LayoutBuilder(
          builder: (context, constraints) => Stack(
            children: [
              Container(
                height: constraints.maxHeight * 0.4,
              ),
              SlidingSheet(
                elevation: 0,
                cornerRadius: 16,
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
              Container(
                height: constraints.maxHeight * 0.3,
                transform: Transform.translate(offset: Offset(0, 30)).transform,
                child: PageView.builder(
                  controller: _pageController,
                  itemCount: _viewmodel.pokemons.length,
                  itemBuilder: (context, index) {
                    return _viewmodel.pokemons[index].image;
                  },
                  onPageChanged: (index) {
                    _viewmodel.pokemon.value = _viewmodel.pokemons[index];
                  },
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
