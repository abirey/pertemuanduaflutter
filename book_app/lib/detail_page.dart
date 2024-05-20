import 'dart:ui';

import 'package:book_app/book.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class DetailPage extends StatelessWidget {
  final Book book;
  const DetailPage({super.key, required this.book});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(book.name),
      ),
      body: ListView(
        children: [
          Container(
            width: double.infinity,
            height: MediaQuery.of(context).size.height / 3,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(book.image), fit: BoxFit.cover),
            ),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 100, sigmaY: 5),
              child: Center(
                child: Image.asset(book.image, width: 120),
              ),
            ),
          ),

          Center(
            child: Padding(padding: const EdgeInsets.symmetric(vertical: 20),
            child: Text(book.name,
            style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold)),
          )),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              bookInfo(book.rate.toString(), "Rating",),
              bookInfo(book.page.toString(), "Page"),
              bookInfo(book.language, "Language"),
            ],
          ),

          const Padding(padding: EdgeInsets.all(8.0),
          child: 
            Text(
          "Description",style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800)
        ),
          ),
          Padding(padding: const EdgeInsets.all(8.0),
          child: bookDesc(book.description,),),
        ],
      ),
    );
  }
  Widget bookDesc(String description){
return Column(
  children: [Text(description, style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),)],
);
  }
  Widget bookInfo(String value, String info){
    return Column(
      children: [
        Text(
          value,style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold)
        ),
        Text(
          info,style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold)
        )
      ],
    );
  }

}
