import 'package:flutter/material.dart';

class NewsSearch extends StatefulWidget {
  const NewsSearch({Key? key}) : super(key: key);

  @override
  _NewsSearchState createState() => _NewsSearchState();
}

class _NewsSearchState extends State<NewsSearch> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
        title: Text("Search",style: TextStyle(color: Colors.black),),
        centerTitle: true,
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(kToolbarHeight),
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
                      Icon(Icons.search,color: Colors.grey),
                      Expanded(
                        child: TextField(
                          // textAlign: TextAlign.center,
                          decoration: InputDecoration.collapsed(
                            hintText: ' Search by name or address',
                          ),
                          onChanged: (value) {

                          },
                        ),
                      ),
                      InkWell(
                        child: Icon(Icons.mic,color: Colors.grey,),
                        onTap: () {

                        },
                      )
                    ],
                  ),
                ),
              )
          ) ,
        ),

      ),

    );
  }
}
