import 'package:flutter/material.dart';

import './indicatorPageview.dart';
import './Content.dart';
import './models/newsApi.dart';
import './models/sources.dart';
import './services/Services.dart';
import './WebviewNews.dart';

class Homepage extends StatefulWidget {
  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  int currpage;
  News news;
  String content = "ESPN";
  String contentId;
  @override
  void initState() {
    super.initState();
    contentId = "techcrunch";
    getNews();
    currpage = 0;
  }

  void getNews() async {
    print("onceAgain");
    print(contentId);
    await Services.getdata("https://newsapi.org/v2/top-headlines?sources=" +
            contentId +
            "&apiKey=1df753f91a8046a9b27850755f7de19a")
        .then((onValue) {
      setState(() {
        news = onValue;
        //print(onValue);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          "News App",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Color.fromRGBO(33, 150, 243, 1),
      ),
      body: Column(
        children: [
          customTabbar(size),
          Expanded(
            child: Container(
                //color: Colors.red,
                padding: EdgeInsets.only(bottom: 0, left: 15, right: 15),
                child: LayoutBuilder(
                  builder: (context, constraints) {
                    //print(news);
                    return news == null
                        ? Center(child: CircularProgressIndicator())
                        : news.status != "ok"
                            ? Container(
                                child: Center(child: Text(news.status)),
                              )
                            : ListView.builder(
                                itemCount: news.totalResults,
                                itemBuilder: (context, index) {
                                  return GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => WebViewNews(
                                              newsurl: news.articles[index].url,
                                            ),
                                          ));
                                    },
                                    child: Content(
                                      constraints: constraints,
                                      headline: news.articles[index].title,
                                      imageUrl: news.articles[index].urlToImage,
                                    ),
                                  );
                                },
                              );
                  },
                )),
          )
        ],
      ),
    );
  }

  Widget tabbutton(currpage, text, id) {
    return GestureDetector(
      onTap: () {
        setState(() {
          currpage = currpage;

          contentId = id;
          news = null;
        });
        getNews();
      },
      child: IndicatorPageView(
        mybool: currpage == currpage,
        text: text,
      ),
    );
  }

  Widget customTabbar(size) {
    return Container(
      height: size.height * 0.08,
      //color: Colors.blue,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          GestureDetector(
            onTap: () {
              print("Back to espn");
              setState(() {
                currpage = 0;

                contentId = "techcrunch";
                news = null;
              });
              getNews();
            },
            child: IndicatorPageView(
              mybool: currpage == 0,
              text: "TechCrunch",
            ),
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                currpage = 1;
                content = "Buzfeed";
                contentId = "buzzfeed";
                news = null;
              });
              getNews();
              //print(contentId);
            },
            child: IndicatorPageView(
              mybool: currpage == 1,
              text: "Buzfeed",
            ),
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                currpage = 2;

                contentId = "google-news";
                news = null;
              });
              getNews();
            },
            child: IndicatorPageView(
              mybool: currpage == 2,
              text: "Google News",
            ),
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                currpage = 3;

                contentId = "abc-news";
                news = null;
              });
              getNews();
            },
            child: IndicatorPageView(
              mybool: currpage == 3,
              text: "ABC News",
            ),
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                currpage = 4;

                contentId = "wired";
                news = null;
              });
              getNews();
            },
            child: IndicatorPageView(
              mybool: currpage == 4,
              text: "Wired",
            ),
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                currpage = 5;
                contentId = "fox-news";
                news = null;
              });
              getNews();
            },
            child: IndicatorPageView(
              mybool: currpage == 5,
              text: "Fox News",
            ),
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                currpage = 6;
                contentId = "the-verge";
                news = null;
              });
              getNews();
            },
            child: IndicatorPageView(
              mybool: currpage == 6,
              text: "The Verge",
            ),
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                currpage = 7;
                contentId = "Mashable";
                news = null;
              });
              getNews();
            },
            child: IndicatorPageView(
              mybool: currpage == 7,
              text: "Mashable",
            ),
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                currpage = 8;

                contentId = "the-wall-street-journal";
                news = null;
              });
              getNews();
            },
            child: IndicatorPageView(
              mybool: currpage == 8,
              text: "The Wall Street Journal",
            ),
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                currpage = 9;
                contentId = "nbc-news";
                news = null;
              });
              getNews();
            },
            child: IndicatorPageView(
              mybool: currpage == 9,
              text: "NBC News",
            ),
          ),
        ],
      ),
    );
  }
}
