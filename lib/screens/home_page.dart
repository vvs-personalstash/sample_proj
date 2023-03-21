import 'package:flutter/material.dart';
import 'package:villain_x_hero/widgets/image.dart';
import 'search.dart';

class HomePage extends StatelessWidget {
  // Future<dynamic> getApiData(int index) async {
  //   Random random = new Random();
  //   int randomNumber = random.nextInt(1000);
  //   var data = await NetworkHelper(
  //           url:
  //               'https://superheroapi.com/api/283447910281540/${(randomNumber + index) % 700 + 1}')
  //       .getData();
  //   return data;
  // }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Villain x Hero',
                style: TextStyle(
                  color: Colors.red,
                  fontFamily: 'Kaushan',
                  fontSize: 30,
                ),
              ),
              GestureDetector(
                child: Icon(Icons.search),
                onTap: () {
                  showModalBottomSheet(
                      isScrollControlled: true,
                      backgroundColor: Colors.white.withOpacity(0.0),
                      context: context,
                      builder: (context) => SingleChildScrollView(
                            padding: EdgeInsets.only(
                                bottom:
                                    MediaQuery.of(context).viewInsets.bottom),
                            child: SearchSheet(),
                          ));
                },
              ),
            ],
          ),
          backgroundColor: Colors.black,
        ),
        body: Container(
          decoration: BoxDecoration(image: DecorationImage(image: AssetImage('images/bck2.jpg'),fit: BoxFit.fill)),
          child: GridView.builder(
            gridDelegate:
                SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
            padding: EdgeInsets.all(10),
            itemBuilder: (context, index) {
              print('ListView');
              return ImageWidget(index: index);
            },
          ),
        ),
      ),
    );
  }
}
