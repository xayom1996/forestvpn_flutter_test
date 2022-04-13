import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forestvpn_test/blocs/news/news_bloc.dart';
import 'package:forestvpn_test/pages/news/detail_article_page.dart';
import 'package:forestvpn_test/pages/news/widgets/article_container.dart';
import 'package:forestvpn_test/repositories/news/models/article.dart';
import 'package:forestvpn_test/theme/styles.dart';
import 'package:provider/src/provider.dart';

class ListNewsPage extends StatelessWidget {
  ListNewsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Material(
        child: Scaffold(
            appBar: AppBar(
              elevation: 0,
              titleSpacing: 0,
              backgroundColor: Colors.transparent,
              leading: IconButton(
                icon: Icon(Icons.arrow_back_ios),
                color: Colors.black,
                onPressed: () {
                  // Navigator.pop(context);
                },
              ),
              title: Text(
                'Notifications',
                style: body,
              ),
              actions: [
                GestureDetector(
                  onTap: () {

                  },
                  child: Center(
                    child: TextButton(
                      onPressed: () {
                        context.read<NewsBloc>().add(MarkAllReadEvent());
                      },
                      child: Text(
                        'Mark all read',
                        style: body,
                      ),
                    ),
                  ),
                ),
              ],
              centerTitle: true,
            ),
            body: BlocConsumer<NewsBloc, NewsState>(
              listener: (context, state){

              },
              builder: (context, state) {
                return state.status == NewsStatus.loading
                    ? Center(
                        child: CircularProgressIndicator(),
                      )
                    : SingleChildScrollView(
                        child: Padding(
                          padding: const EdgeInsets.all(28.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Featured',
                                style: title1,
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              CarouselSlider(
                                // options: CarouselOptions(height: 400.0),
                                options: CarouselOptions(
                                    autoPlay: false,
                                    enlargeCenterPage: true,
                                    viewportFraction: 1.0,
                                    height: 300
                                ),
                                items: state.articles.map((article) {
                                  return Builder(
                                    builder: (BuildContext context) {
                                      return GestureDetector(
                                        onTap: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(builder: (context) =>
                                                DetailArticlePage(
                                                  article: article,
                                                )),
                                          );
                                        },
                                        child: ArticleContainer(
                                          article: article,
                                          type: 'featured',
                                        ),
                                      );
                                    },
                                  );
                                }).toList(),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Text(
                                'Latest news',
                                style: title1,
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              for (var article in state.articles)
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 20),
                                  child: GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(builder: (context) =>
                                            DetailArticlePage(
                                              article: article,
                                            )),
                                      );
                                    },
                                    child: ArticleContainer(
                                      article: article,
                                      type: 'latest',
                                    ),
                                  ),
                                ),
                            ],
                          ),
                        ),
                      );
              },
            )
        ),
      ),
    );
  }

}