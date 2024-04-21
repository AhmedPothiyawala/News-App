import 'package:flutter_mvvm_template/App_Controllers/StorageController.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../Remote/Api/api_endpoints.dart';
import '../Remote/Model/News_Model.dart';

class ApiController extends GetxController {
  var articles = <Article>[].obs;
  final article = RxList<Article>([]);
  List<Article> get allArticles => article.toList();

  @override
  void onInit() {
    fetchArticles();
    loadTasks();
    super.onInit();
  }

  void fetchArticles() async {
    try {
      var url = Uri.parse(ApiEndPoints().getData);
      var response = await http.get(url);

      if (response.statusCode == 200) {
        var jsonData = json.decode(response.body);
        var articleList = <Article>[];

        for (var article in jsonData['articles']) {
          articleList.add(Article(
            author: article['author'],
            title: article['title'],
            description: article['description'],
            url: article['url'],
            urlToImage: article['urlToImage'],
            publishedAt: article['publishedAt'],
            content: article['content'],
            is_favourite: false,
          ));
        }

        articles.value = articleList;
        update();
      }
    } catch (e) {}
  }

  void addTask(Article articledata) {
    var newTask = Article(
      author: articledata.author,
      title: articledata.title,
      description: articledata.description,
      url: articledata.url,
      urlToImage: articledata.urlToImage,
      publishedAt: articledata.publishedAt,
      content: articledata.content,
      is_favourite: articledata.is_favourite,
    );
    article.add(newTask);
    Storage.saveTasks(article.toList());
    update();
  }

  void remove_favourite(Article articledata) {
    final newTask = Article(
      author: articledata.author,
      title: articledata.title,
      description: articledata.description,
      url: articledata.url,
      urlToImage: articledata.urlToImage,
      publishedAt: articledata.publishedAt,
      content: articledata.content,
      is_favourite: articledata.is_favourite,
    );
    article.remove(newTask);
    article.removeWhere(
        (articlejndjnd) => articlejndjnd.title == articledata.title);

    Storage.saveTasks(article.toList());
    update();
  }

  Future<void> loadTasks() async {
    article.value = await Storage.loadTasks();
  }
}
