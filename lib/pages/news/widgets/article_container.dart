import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:forestvpn_test/repositories/news/models/article.dart';
import 'package:forestvpn_test/theme/styles.dart';
import 'package:jiffy/jiffy.dart';

class ArticleContainer extends StatelessWidget {
  final Article article;
  final String type;
  const ArticleContainer({Key? key, required this.article, required this.type}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return type == 'featured'
        ? Container(
            height: 300,
            decoration: BoxDecoration(
              image: DecorationImage(
                colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.7), BlendMode.darken),
                image: NetworkImage(article.imageUrl),
                fit: BoxFit.fill,
              ),
              borderRadius: const BorderRadius.all(Radius.circular(12)),
            ),
            child: Align(
              alignment: Alignment.bottomLeft,
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 40, horizontal: 20),
                child: Text(
                  article.title,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: title,
                ),
              ),
            ),
          )
        : Container(
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: const BorderRadius.all(Radius.circular(9)),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 4,
                  offset: Offset(4, 4), // changes position of shadow
                ),
              ],
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 60,
                  width: 90,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(article.imageUrl),
                      fit: BoxFit.fill,
                    ),
                    borderRadius: const BorderRadius.all(Radius.circular(12)),
                  ),
                ),
                // ClipRRect(
                //   borderRadius: BorderRadius.circular(12.0),
                //   child: Image.network(
                //     article.imageUrl,
                //     height: 60,
                //     width: 90,
                //   ),
                // ),
                SizedBox(
                  width: 23,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        article.title,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: body,
                      ),
                      SizedBox(
                        height: 11,
                      ),
                      Text(
                        Jiffy(article.publicationDate).fromNow(),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: caption,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
  }

}