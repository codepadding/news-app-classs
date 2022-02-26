import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:news/constanceValue.dart';
import 'dart:convert' as convert;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:news/pages/NewsDetailsPage.dart';
import 'package:carousel_slider/carousel_slider.dart';

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

  final List<String> imgList = [
    'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
    'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
    'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80',
    'https://images.unsplash.com/photo-1523205771623-e0faa4d2813d?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=89719a0d55dd05e2deae4120227e6efc&auto=format&fit=crop&w=1953&q=80',
    'https://images.unsplash.com/photo-1508704019882-f9cf40e475b4?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=8c6e5e3aba713b17aa1fe71ab4f0ae5b&auto=format&fit=crop&w=1352&q=80',
    'https://images.unsplash.com/photo-1519985176271-adb1088fa94c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=a0c8d632e977f94e5d312d9893258f59&auto=format&fit=crop&w=1355&q=80'
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
        appBar: AppBar(
          title: Text("News Home"),
          bottom: PreferredSize(
              preferredSize: Size.fromHeight(kToolbarHeight),
              child: InkWell(
                onTap: () {
                  Navigator.pushNamed(context, "news-search");
                },
                child: Container(
                    //  padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.grey[300],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Material(
                        color: Colors.grey[300],
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Icon(Icons.search, color: Colors.grey),
                            Expanded(child: Text("Search news")),
                            InkWell(
                              child: Icon(
                                Icons.mic,
                                color: Colors.grey,
                              ),
                              onTap: () {},
                            )
                          ],
                        ),
                      ),
                    )),
              )),
        ),
        body: ListView(
          children: [
            CarouselSlider(
              options: CarouselOptions(height: 200.0),
              items: [1,2,3,4,5].map((i) {
                return Builder(
                  builder: (BuildContext context) {
                    return Container(
                        width: MediaQuery.of(context).size.width,

                        margin: EdgeInsets.symmetric(horizontal: 5.0),
                        decoration: BoxDecoration(
                            color: Colors.amber
                        ),
                        child: Text('text $i', style: TextStyle(fontSize: 16.0),)
                    );
                  },
                );
              }).toList(),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
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
