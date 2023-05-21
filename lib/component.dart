import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:news_app/cubit.dart';
import 'package:webview_flutter/webview_flutter.dart';

Widget buildarticle(article , context)=> InkWell(

       onTap: (){
         buildWeb(article);
         navigateTo(context, buildWeb(article));
       },

       child:Padding(
          padding: const EdgeInsets.all(10.0),
          child: Container(
            child:
            Row(
              children: [
                if('${article['urlToImage']}' == 'null')...[
                  Expanded(
                    child: Image(
                      image: NetworkImage('https://t3.ftcdn.net/jpg/04/34/72/82/360_F_434728286_OWQQvAFoXZLdGHlObozsolNeuSxhpr84.jpg'),
                    ),
                  ),

                 ]

                 else...[

                 Expanded(
                    child: Image(
                      image: NetworkImage('${article['urlToImage']}'),
                    ),
                  ),

                ],
                SizedBox(
                  width: 10,
                ),

                Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('${article['title']}'),
                      SizedBox(
                        height: 5,
                      ),
                      Text('${article['publishedAt']}',
                        style: TextStyle(
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
);



Widget articalBuilder(lists, context)=>ConditionalBuilder(
    condition: lists.length > 0,
    builder : (context)=>ListView.separated(
        itemBuilder: (context , index){
          print(lists);
          return buildarticle(lists[index] , context);
        },
        separatorBuilder: (context , index)=> myDivider(),
        itemCount: 20,
    ),
  fallback: (context)=> Center(child: CircularProgressIndicator()),
);


Widget buildWeb(article)=>SafeArea(
  child: WebViewWidget(
  
      controller: WebViewController()..loadRequest((Uri.parse('${article['url']}'))),
  
  
  
  ),
);



Widget myDivider() => Padding(
  padding: const EdgeInsetsDirectional.only(
    start: 20.0,
  ),
  child: Container(
    width: double.infinity,
    height: 1.0,
    color: Colors.grey[300],
  ),
);


void navigateTo(context, widget) => Navigator.push(
  context,
  MaterialPageRoute(
    builder: (context) => widget,
  ),
);