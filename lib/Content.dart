import 'package:flutter/material.dart';

class Content extends StatelessWidget {
  final BoxConstraints constraints;
  final String imageUrl;
  final String headline;

  Content({this.constraints, this.headline, this.imageUrl});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      color: Color.fromRGBO(181, 181, 181, 1),
      padding: EdgeInsets.all(constraints.maxWidth * 0.04),
      height: constraints.maxHeight * 0.6,
      width: constraints.maxWidth * 0.95,
      child: LayoutBuilder(
        builder: (context, constraints) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: constraints.maxHeight * 0.5,
                width: constraints.maxWidth,
                color: Colors.red,
                child:
                    FittedBox(fit: BoxFit.fill, child: Image.network(imageUrl)),
              ),
              //Spacer(),
              Container(
                height: constraints.maxHeight * 0.35,
                padding: EdgeInsets.only(top: constraints.maxHeight * 0.005),
                //color: Colors.white,
                width: constraints.maxWidth,
                child: Text(
                  headline,
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
                  maxLines: 4,
                  overflow: TextOverflow.fade,
                ),
              ),

              Expanded(
                child: Container(
                  //height: constraints.maxHeight * 0.10,
                  width: constraints.maxWidth * 0.4,
                  //color: Colors.yellow,
                  child: Column(
                    children: [
                      Expanded(
                        flex: 1,
                        child: Container(
                          width: constraints.maxWidth * 0.4,
                          //color: Colors.purple,
                          child: Text(
                            "Time: 10:22",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Color.fromRGBO(85, 85, 85, 1)),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Container(
                          width: constraints.maxWidth * 0.4,
                          //color: Colors.pink,
                          child: Text(
                            "Date: 10/02/20",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Color.fromRGBO(85, 85, 85, 1)),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
