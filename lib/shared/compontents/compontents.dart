import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:news_apis/modules/search/search.dart';
import 'package:news_apis/modules/web_view/web_view.dart';

Widget buildArticlesItem(context, article,{isSearch = false})=>InkWell(
  onTap: ()
  {
    Navigator.push(context, MaterialPageRoute(builder: (context) =>  WebViewScreen(article['url'])));
  },
  child:   Padding(

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

                    style: Theme.of(context).textTheme.bodyText1,

                    maxLines: 3,

                    overflow: TextOverflow.ellipsis,

                  ),

                ),

                 Text(

                    '${article['publishedAt']}',

                   style: const TextStyle(

                     color: Colors.grey,

                   ),

                ),

              ],

            ),

          ),

        ),

      ],

    ),

  ),
);

//------------------------------------------------------------------

Widget buildFormField({
  required TextEditingController controller,
  required TextInputType type,
  required FormFieldValidator validator,
  required IconData prefix,
  required String label,
  ValueChanged? onChange,
  bool isUpperCase = true,
})=>TextFormField(
  controller: controller,
  keyboardType: type,
  validator: validator,
  onChanged: onChange,
  decoration:  InputDecoration(
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10.0),
    ),
    prefixIcon: Icon(
      prefix
    ),
    label: Text(
      isUpperCase? label.toUpperCase() : label,
      style: const TextStyle(
        fontWeight: FontWeight.bold,
        fontFamily: 'Jannah',
        fontSize: 18.0,
      ),
    ) ,
  ),
);