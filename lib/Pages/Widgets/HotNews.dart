import 'dart:math';

import 'package:flutter/material.dart';

class Hotnews extends StatelessWidget {
  final String imageUrl;
  final String tag;
  final String title;
  final String time;
  final String author;
  final VoidCallback ontap;

  const Hotnews(
      {super.key,
      required this.imageUrl,
      required this.tag,
      required this.title,
      required this.time,
      required this.author,
      required this.ontap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: Container(
        margin: EdgeInsets.only(right: 12),
        width: 280,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Theme.of(context).colorScheme.primaryContainer),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Container(
                height: 200,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Theme.of(context).colorScheme.background,
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.network(
                    imageUrl,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(
                height: 12,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "$tag",
                    style: Theme.of(context).textTheme.labelMedium,
                  ),
                  Text(
                    "$time",
                    style: Theme.of(context).textTheme.labelMedium,
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    child: Text(
                      "$title",
                      maxLines: 2,
                      style: TextStyle(fontSize: 24),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 5,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CircleAvatar(
                    radius: 18,
                    backgroundImage: NetworkImage(
                        "https://waveplusweb.com/myweb/avatar.png"),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    "${author.substring(0, min(15, author.length))}",
                    style: Theme.of(context).textTheme.titleMedium,
                  )
                  // Text(
                  //   "$author",
                  //   style: Theme.of(context).textTheme.titleMedium,
                  // )
                ],
              ),
              SizedBox(
                height: 5,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
