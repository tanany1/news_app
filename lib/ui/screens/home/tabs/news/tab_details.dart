import 'package:flutter/material.dart';
import 'package:news_app/data/api_manager.dart';
import 'package:news_app/model/article.dart';
import 'package:news_app/ui/widgets/app_error.dart';
import 'package:news_app/ui/widgets/app_loader.dart';

class TabDetails extends StatelessWidget {
  final String sourceId;

  const TabDetails({super.key, required this.sourceId});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: ApiManager.loadArticlesList(sourceId),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return AppError(error: snapshot.error.toString());
          } else if (snapshot.hasData) {
            return articlesList(snapshot.data!.articles!);
          } else {
            return const AppLoader();
          }
        });
  }

  Widget articlesList(List<Article?> articles) {
    return ListView.builder(
        itemCount: articles.length,
        itemBuilder: (context, index) {
          return articleWidget(articles[index]!, context);
        });
  }

  Widget articleWidget(Article article, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(20) , border: Border.all(width: 2)),
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            // CachedNetworkImage(
            //   imageUrl: article.urlToImage!,
            //   height: MediaQuery.of(context).size.height*0.25,
            //   placeholder: (_,__)=>const Center(child: CircularProgressIndicator(),),
            //   errorWidget:  (_,__,___)=>const Center(child:Icon(Icons.error),),),
            Image.network(article.urlToImage!),
            Text(
              article.source?.name ?? "",
              textAlign: TextAlign.start,
            ),
            Text(
              article.title ?? "",
              textAlign: TextAlign.start,
            ),
            Text(article.publishedAt ?? "", textAlign: TextAlign.end)
          ],
        ),
      ),
    );
  }
}
