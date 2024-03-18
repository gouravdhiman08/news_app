import 'dart:math';

import 'package:flutter/material.dart';

class NewsForYou extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String time;
  final String author;
  final VoidCallback ontapp;
  final String tag;

  const NewsForYou(
      {super.key,
      required this.imageUrl,
      required this.title,
      required this.time,
      required this.author,
      required this.ontapp,
      required this.tag});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontapp,
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(10),
            height: 200,
            decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primaryContainer,
                borderRadius: BorderRadius.circular(20)),
            child: Row(
              children: [
                Container(
                  width: 150,
                  height: 180,
                  decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(20)),
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image.network(
                        "$imageUrl",
                        fit: BoxFit.cover,
                      )),
                ),
                SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: Column(
                    children: [
                      Text(
                        "$title",
                        maxLines: 3,
                        style: TextStyle(fontSize: 20),

                        // style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        alignment: Alignment.bottomRight,
                        child: Text(
                          "$time",
                          style: Theme.of(context).textTheme.labelLarge,
                          // textAlign: TextAlign.start,
                        ),
                      ),
                      SizedBox(
                        height: 14,
                      ),
                      Row(
                        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CircleAvatar(
                            radius: 18,
                            backgroundImage:
                                AssetImage('assets/images/image.png'),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            "${author.substring(0, min(13, author.length))}",
                            style: Theme.of(context).textTheme.titleMedium,
                          )
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}
