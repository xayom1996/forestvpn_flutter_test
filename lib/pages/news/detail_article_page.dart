import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:forestvpn_test/repositories/news/models/article.dart';
import 'package:forestvpn_test/theme/styles.dart';

class DetailArticlePage extends StatelessWidget {
  final Article article;
  const DetailArticlePage({Key? key, required this.article}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Material(
        child: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return [
              SliverAppBar(
                leading: IconButton(
                  icon: Icon(Icons.arrow_back_ios),
                  color: Colors.white,
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                expandedHeight: MediaQuery.of(context).size.height / 2,
                elevation: 0,
                backgroundColor: Colors.transparent,
                // pinned: true,
                // floating: true,

                flexibleSpace: FlexibleSpaceBar(
                    centerTitle: true,
                    titlePadding: EdgeInsets.all(20),
                    title: Text(
                        article.title,
                        style: title
                    ),
                    background: ClipRRect(
                      borderRadius: BorderRadius.only(bottomLeft: Radius.circular(12),
                          bottomRight: Radius.circular(12)),
                      child: Image.network(
                        article.imageUrl,
                        fit: BoxFit.cover,
                        color: Colors.black.withOpacity(0.7),
                        colorBlendMode: BlendMode.darken,
                      ),
                    ),
                ),
              ),
            ];
          }, body: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Container(
                child: Text(
                    article.description ?? '',
                    style: body,
                  ),
              ),
            ),
        ),
      ),
    );
  }

}

class MySliverAppBar extends SliverPersistentHeaderDelegate {
  final double expandedHeight;

  MySliverAppBar({required this.expandedHeight});

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Stack(
      fit: StackFit.expand,
      overflow: Overflow.visible,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(12),
              bottomRight: Radius.circular(12)),
          child: Image.network(
            "https://i.ibb.co/Jk8FMMp/unsplash-Oqtaf-YT5k-Tw.jpg",
            fit: BoxFit.cover,
            color: Colors.black.withOpacity(0.7),
            colorBlendMode: BlendMode.darken,
          ),
        ),
        Center(
          child: Opacity(
            opacity: shrinkOffset / expandedHeight,
            child: Text(
              "MySliverAppBar",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w700,
                fontSize: 23,
              ),
            ),
          ),
        ),
        Positioned(
            // top: 16,
            left: 16,
            child: IconButton(
              icon: Icon(Icons.arrow_back_ios),
              color: Colors.white,
              onPressed: () {
                Navigator.pop(context);
              },
            )
        )
      ],
    );
  }

  @override
  double get maxExtent => expandedHeight;

  @override
  double get minExtent => kToolbarHeight;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) => true;
}