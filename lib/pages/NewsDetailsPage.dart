import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class NewsDetailsPage extends StatefulWidget {
  NewsDetailsPage({Key? key, required this.news}) : super(key: key);

  var news;

  @override
  _NewsDetailsPageState createState() => _NewsDetailsPageState();
}

class _NewsDetailsPageState extends State<NewsDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Details Page"),),
      body: ListView(
        children: [
          CachedNetworkImage(
            imageUrl: widget.news['urlToImage'],
            progressIndicatorBuilder: (context, url, downloadProgress) =>
                CircularProgressIndicator(value: downloadProgress.progress),
            errorWidget: (context, url, error) => Image.network(
                "https://news.aut.ac.nz/__data/assets/image/0006/92328/placeholder-image10.jpg"),
          ),
          Text(widget.news['title']),
          Text(widget.news['description']),
          Text(widget.news['content']),
        ],
      ),
    );
  }
}
