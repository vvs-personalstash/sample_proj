import 'package:flutter/material.dart';

class Scorecard extends StatefulWidget {
  Scorecard({required this.value, required this.title});

  late String value;
  final String title;

  @override
  _ScorecardState createState() => _ScorecardState();
}

class _ScorecardState extends State<Scorecard>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation animation;
  double displayedValue = 0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    animationController =
        AnimationController(vsync: this, duration: Duration(seconds: 2));
    if (widget.value == 'null') widget.value = '0';
    double Value = double.parse(widget.value);
    animation =
        CurvedAnimation(parent: animationController, curve: Curves.decelerate);
    animationController.forward();
    animationController.addListener(() {
      setState(() {
        displayedValue = Value * animationController.value;
      });
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    MediaQueryData mediaQueryData = MediaQuery.of(context);
    return Material(
      elevation: 12,
      shadowColor: Colors.white70,
      borderRadius: BorderRadius.circular(10),
      color: Colors.lightBlueAccent.withOpacity(0.4),
      child: Container(
        //total widget
        width: mediaQueryData.size.width * 0.27,
        height: mediaQueryData.size.height * 0.12,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(),
            Container(
              child: Center(
                child: Text(
                  displayedValue.toInt().toString(),
                  style: TextStyle(
                      fontSize: 50,
                      fontFamily: 'Akronim',
                      color: Colors.black87),
                ),
              ),
            ),
            Material(
              borderRadius: BorderRadius.circular(8),
              child: Container(
                width: double.infinity,
                color: Colors.blueAccent,
                child: Center(
                  child: Text(
                    widget.title,
                    style: TextStyle(fontSize: 22, fontFamily: 'Barlow'),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
