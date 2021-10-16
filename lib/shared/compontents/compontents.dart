import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget buildArticlesItem(context, article)=>Padding(
  padding: const EdgeInsets.all(20.0),
  child: Row(
    children:
    [
      Container(
        height: 120.0,
        width: 120.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          image:  DecorationImage(
            image: NetworkImage('${article['urlToImage']}'),
            fit: BoxFit.cover,
          ),
        ),
      ),
      const SizedBox(
        width: 20.0,
      ),
      Expanded(
        child: SizedBox(
          height: 120.0,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children:
            [
              Expanded(
                child: Text(
                  '${article['title']}',
                  style: Theme.of(context).textTheme.bodyText1!.copyWith(
                    fontFamily: 'Jannah',
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                    fontSize: 18.0,
                  ),
                  maxLines: 4,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
               Text(
                  '${article['publishedAt']}',
              ),
            ],
          ),
        ),
      ),
    ],
  ),
);