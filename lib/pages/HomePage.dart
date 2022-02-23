import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:news/constanceValue.dart';
import 'dart:convert' as convert;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:news/pages/NewsDetailsPage.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> _categorys = [
    "Cryptocurrency",
    "Sports",
    "Travel",
    "Technology",
    "Business",
    "Finance",
    "Entertainment",
    "Lifestyle"
  ];

  var latestNews = [];

  @override
  void initState() {
    // TODO: implement initState
    getLatestNews();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title:Text("News Home")),
        body: ListView(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Top Category"),
            InkWell(
                onTap: () {
                  Navigator.pushNamed(context, "category-list");
                },
                child: Text("See All")),
          ],
        ),
        getCaterorys(),
        getLatestNewsWidget()
      ],
    ));
  }

  getCaterorys() {
    return GridView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: _categorys.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4,
          crossAxisSpacing: 3,
          mainAxisExtent: 40,
          mainAxisSpacing: 3),
      itemBuilder: (context, index) => Container(
        color: Colors.blue,
        child: Center(
            child: Text(
          _categorys[index],
          style: TextStyle(color: Colors.white),
        )),
      ),
    );
  }

  getLatestNewsWidget() {
    return ListView.builder(
      itemCount: latestNews.length,
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemBuilder: (context, index) {
        var news = latestNews[index];

        String thumbnail = news['urlToImage'] != null
            ? news['urlToImage'].toString()
            : "https://news.aut.ac.nz/__data/assets/image/0006/92328/placeholder-image10.jpg";
        print(thumbnail);
        return InkWell(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => NewsDetailsPage(
                    news: news,
                  ),
                ));
            // Navigator.pushNamed(context, "news-details");
          },
          child: Container(
              child:
                  Column(mainAxisAlignment: MainAxisAlignment.start, children: [
            CachedNetworkImage(
              imageUrl: thumbnail,
              progressIndicatorBuilder: (context, url, downloadProgress) =>
                  CircularProgressIndicator(value: downloadProgress.progress),
              errorWidget: (context, url, error) => Image.network(
                  "https://news.aut.ac.nz/__data/assets/image/0006/92328/placeholder-image10.jpg"),
            ),
            Text(latestNews[index]['title'])
          ])),
        );
      },
    );
  }

  getLatestNews() async {
    var response = await http.get(Uri.parse(homePageApi));
    print('Response body: ${response.body}');
    var jsonResponse =
        convert.jsonDecode(response.body) as Map<String, dynamic>;
    var articles = jsonResponse['articles'];
    setState(() {
      latestNews = articles;
    });
  }
}
