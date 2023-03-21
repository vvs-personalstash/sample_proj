import 'package:flutter/material.dart';
import 'package:villain_x_hero/services/networking.dart';
import 'dart:math';
import 'package:villain_x_hero/screens/character_page.dart';

// List<int> broken = [
//   51,
//   54,
//   74,
//   101,
//   113,
//   117,
//   124,
//   131,
//   133,
//   134,
//   143,
//   164,
//   205,
//   244,
//   283,
//   290,
//   291,
//   292,
//   377,
//   447,
//   453,
//   465,
//   511,
//   512,
//   552,
//   553,
//   603,
//   629,
//   662,
//   694,
//   698,
// ];

class ImageWidget extends StatefulWidget {
  final int index;
  ImageWidget({required this.index});

  @override
  _ImageWidgetState createState() => _ImageWidgetState();
}

class _ImageWidgetState extends State<ImageWidget> {
  Future getImage(void Function() load) async {
    Random random = new Random();
    late int finalIndex;
    var data;
    do {
      int randomNumber = random.nextInt(1000);
      print('random = $randomNumber');
      finalIndex = (randomNumber) % 733;
      finalIndex++;
      data = await NetworkHelper(
          url: 'https://akabab.github.io/superhero-api/api/id/$finalIndex.json')
          .getData();
    } while (data==null);

    url = data['images']['lg'];
    id = data['id'].toString();
    name = data['name'];
    characterData = data;
    load();
    print('done');
  }

  String url = '';
  bool gotImage = false;
  late String id;
  late String name;
  late dynamic characterData;
  @override
  void initState() {
    // TODO: implement initState
    getImage(() {
      setState(() {
        gotImage = true;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (gotImage && url.isNotEmpty)
      return GestureDetector(
        onTap: () {
          if (gotImage)
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => CharacterPage(data: characterData)));
        },
        child: Hero(
          tag: 'HeroImage$id',
          child: Container(
            padding: EdgeInsets.all(10),
            child: Stack(
              fit: StackFit.expand,
              children: [
                Card(
                  color: Colors.black45.withOpacity(0),
                  elevation: 10,
                  shadowColor: Colors.black,
                  child: Image(
                    image: NetworkImage(url),
                  ),
                ),
                Positioned(
                  child: Container(
                    color: Colors.black54,
                    padding: EdgeInsets.all(5),
                    child: Text(
                      name,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Barlow',
                      ),
                    ),
                  ),
                  bottom: 5,
                ),
              ],
              alignment: Alignment.center,
              clipBehavior: Clip.none,
            ),
          ),
        ),
      );
    return Align(
      alignment: Alignment.center,
      child: CircularProgressIndicator(),
    );
  }
}
