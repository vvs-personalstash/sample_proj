import 'package:flutter/material.dart';
import 'temp_screen.dart';
import 'package:villain_x_hero/services/networking.dart';
import 'package:villain_x_hero/services/search_hero.dart';

class SearchSheet extends StatefulWidget {
  @override
  State<SearchSheet> createState() => _SearchSheetState();
}

class _SearchSheetState extends State<SearchSheet> {
  String name = '';

  bool loading = false;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
          ),
          padding: EdgeInsets.all(30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'Search Name',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 30,
                  fontFamily: 'Barlow',
                ),
              ),
              TextField(
                decoration: InputDecoration(
                  fillColor: Colors.black,
                  hoverColor: Colors.white,
                  focusColor: Colors.black,
                ),
                style: TextStyle(fontSize: 20),
                autofocus: true,
                textAlign: TextAlign.center,
                onChanged: (value) {
                  name = value;
                },
              ),
              SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () async {
                  setState(() {
                    loading = true;
                  });
                  dynamic data = await NetworkHelper(
                          url:
                              'https://akabab.github.io/superhero-api/api/all.json')
                      .getData();
                  print(data);
                  print(data.runtimeType);
                  var result = searchHero(data, name);
                  print(result);
                  if (result.isNotEmpty)
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => TempPage(data: result)));
                  setState(() {
                    loading = false;
                  });
                },
                child: Text(
                  'Search',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontFamily: 'Kaushan',
                  ),
                ),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.black54),
                ),
              )
            ],
          ),
        ),
        loading
            ? Align(
                child: CircularProgressIndicator(),
                alignment: AlignmentDirectional.topCenter,
              )
            : Container(),
      ],
    );
  }
}
