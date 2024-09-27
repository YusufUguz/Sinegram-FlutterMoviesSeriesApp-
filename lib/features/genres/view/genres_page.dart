import 'package:flutter/material.dart';
import 'package:movies_and_series_app/core/constants/constants.dart';
import 'package:movies_and_series_app/features/genres/view/widgets/movie_genres_page.dart';
import 'package:movies_and_series_app/features/genres/view/widgets/series_genres_page.dart';

class GenresPage extends StatefulWidget {
  const GenresPage({super.key});

  @override
  State<GenresPage> createState() => _GenresPageState();
}

class _GenresPageState extends State<GenresPage>
    with SingleTickerProviderStateMixin {
  TabController? tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: 40,
            decoration: const BoxDecoration(
              color: Color(0xff24292F),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: TabBar(
                controller: tabController,
                indicator: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                    25,
                  ),
                  color: Constants.appsLighterMainColor,
                ),
                indicatorSize: TabBarIndicatorSize.tab,
                labelColor: Colors.black,
                unselectedLabelColor: Colors.white,
                tabs: const [
                  Tab(
                    text: 'FİLMLER',
                  ),
                  Tab(
                    text: 'DİZİLER',
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: TabBarView(
              controller: tabController,
              children: const [MovieGenresPage(), SeriesGenresPage()],
            ),
          ),
        ],
      ),
    );
  }
}
