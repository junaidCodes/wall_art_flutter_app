import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wall_art/ui/views/tab_bars/category_tab_bar.dart';
import 'package:wall_art/ui/views/tab_bars/home_tab_bar.dart';
import 'package:wall_art/utils/image_path.dart';
import 'package:wall_art/utils/tab_bar.dart';

class ExampleW extends StatefulWidget {
  const ExampleW({super.key});

  @override
  State<ExampleW> createState() => _ExampleWState();
}

class _ExampleWState extends State<ExampleW> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blueGrey,
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              flexibleSpace: Container(
                child: Image.asset(
                  PathToImage.background,
                  fit: BoxFit.cover,
                ),
              ),
              actions: [
                IconButton(
                  onPressed: () {
                    showSearch(
                        context: context, delegate: CustomSearchDelegate());
                  },
                  icon: const Icon(Icons.search),
                ),
                const SizedBox(
                  width: 20,
                )
              ],
              pinned: true,
              title: Text(
                "wallArt",
                style: GoogleFonts.aboreto(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.w600),
              ),
              backgroundColor: Colors.amber,
              expandedHeight: 200,
            ),
            SliverToBoxAdapter(
              child: Column(
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 2,
                    child: CustomTabBar(tabTitles: const [
                      'Home',
                      'Category'
                    ], pages: const [
                      HomeTabBar(),
                      CategoryTabBar(),
                    ]),
                  ),
                ],
              ),
            ),
            // SliverList(
            //   delegate: SliverChildBuilderDelegate(
            //     (BuildContext context, int index) {
            //       return ListTile(
            //         title: Text('Item $index'),
            //       );
            //     },
            //     childCount: 50,
            //   ),
            // ),
          ],
        ));
  }
}

class CustomSearchDelegate extends SearchDelegate {
  List<String> items = ['apple', 'mango', 'banana'];
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            query = '';
          },
          icon: const Icon(Icons.clear))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          close(context, null);
        },
        icon: const Icon(Icons.arrow_back));
  }

  @override
  Widget buildResults(BuildContext context) {
    List<String> match = [];
    // for (var fruit in items) {
    //   if (fruit.toLowerCase().contains(query.toLowerCase())) {
    //     match.add(fruit);
    //   }
    // }
    // return Container(
    //   color: Colors.green,
    // );
    // return ListView.builder(itemBuilder: (context, index) {
    //   var result = match[index];
    //   return ListTile(
    //     title: Text(result),
    //   );
    // });
    return Container();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<String> match = [];
    for (var fruit in items) {
      if (fruit.toLowerCase().contains(query.toLowerCase())) {
        match.add(fruit);
      }
    }
    // return ListView.builder(
    //     itemCount: match.length,
    //     itemBuilder: (context, index) {
    //       var result = match[index];
    //       return ListTile(
    //         title: Text(result[index]),
    //       );
    //     });
    return Container();
  }
}
