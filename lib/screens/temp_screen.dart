import 'package:flutter/material.dart';
import 'package:villain_x_hero/widgets/image2.dart';

class TempPage extends StatelessWidget {
  final List<dynamic> data;
  TempPage({required this.data});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Villain x Hero',
          style: TextStyle(
            color: Colors.red,
            fontFamily: 'Kaushan',
            fontSize: 30,
          ),
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
            print(data);
            return ImageWidget(
              index: int.parse(data[index]['id'].toString()),
            );
          },
          itemCount: (data).length,
        ),
      ),
    );
  }
}
