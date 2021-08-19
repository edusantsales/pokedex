import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:pokedex/app/app.dart';
import 'package:pokedex/app/modules/detail/components/about_page_view.dart';
import 'package:pokedex/app/modules/detail/components/status_page_view.dart';
import 'package:pokedex/app/modules/detail/detail_view_model.dart';
import 'package:rx_notifier/rx_notifier.dart';

class InformationPage extends StatefulWidget {
  const InformationPage({Key? key}) : super(key: key);

  @override
  _InformationPageState createState() => _InformationPageState();
}

class _InformationPageState extends State<InformationPage>
    with SingleTickerProviderStateMixin {
  final _viewmodel = Modular.get<DetailViewModel>();

  late TabController _tabController;
  late PageController _pageController;

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    _pageController = PageController(initialPage: 0);
    _viewmodel.getPokemonSpecieInfo(
      _viewmodel.pokemon.value.id.toString(),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return RxBuilder(
      builder: (context) {
        return Scaffold(
          backgroundColor: AppColors.white,
          appBar: AppBar(
            backgroundColor: AppColors.white,
            bottom: PreferredSize(
              preferredSize: Size.fromHeight(32),
              child: TabBar(
                controller: _tabController,
                labelStyle: AppTextStyles.textSemiBlack(16),
                indicatorColor: _viewmodel.pokemon.value.getColorType(),
                indicatorSize: TabBarIndicatorSize.tab,
                labelColor: _viewmodel.pokemon.value.getColorType(),
                unselectedLabelColor: AppColors.black,
                isScrollable: true,
                tabs: <Widget>[
                  Tab(text: "About"),
                  Tab(text: "Status"),
                ],
                onTap: (index) {
                  _pageController.animateToPage(
                    index,
                    duration: Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                  );
                },
              ),
            ),
            elevation: 0,
            leading: Container(),
          ),
          body: LayoutBuilder(
            builder: (context, constraints) {
              return PageView(
                controller: _pageController,
                onPageChanged: (index) {
                  _tabController.animateTo(
                    index,
                    duration: Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                  );
                },
                children: [
                  AboutPageView(),
                  StatusPageView(),
                ],
              );
            },
          ),
        );
      },
    );
  }
}
