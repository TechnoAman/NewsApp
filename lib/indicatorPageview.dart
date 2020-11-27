import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class IndicatorPageView extends StatefulWidget {
  final bool mybool;
  final String text ;
  IndicatorPageView({this.mybool,this.text});
  @override
  _IndicatorPageViewState createState() => _IndicatorPageViewState();
}

class _IndicatorPageViewState extends State<IndicatorPageView> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.08 * 0.9,
      width: size.width * 0.3,
      //color: Colors.black,
      child: Column(
        children: [
          Container(
            height: size.height * 0.08 * 0.75,
            
            color: Colors.white,
            child: FittedBox(
              fit: BoxFit.scaleDown,
                child: Text(
              widget.text,
              style: GoogleFonts.lato(
                  color: widget.mybool
                      ? Color.fromRGBO(22, 59, 133, 1)
                      : Color.fromRGBO(148, 150, 158, 1),
                  fontWeight: FontWeight.bold),
            )),
          ),
          if (widget.mybool)
            Container(
              height: size.height * 0.08 * 0.1,
              width: size.width * 0.3 * 0.35,
              decoration: BoxDecoration(
                  color: Color.fromRGBO(22, 59, 133, 1),
                  borderRadius:
                      BorderRadius.circular(size.height * 0.08 * 0.1 * 0.7)),
            )
        ],
      ),
    );
  }
}
