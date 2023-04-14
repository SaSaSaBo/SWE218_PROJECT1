import 'package:flutter/material.dart';
import 'package:flutter_fb_notes/style/app_style.dart';
import '../style/app_style.dart';

Widget noteCard(Function()? onTap, QueryDocumentSnapshot doc) {
  return InkWell( 
    onTap: onTap,
    child: Container(
      padding: const EdgeInsets.all(8.0),
      margin: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: AppStyle.cardsColor[doc('color_id')],
        borderRadius: BorderRadius.circular(8.0),
      ),
      child:Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            doc["note_title"],
              style: AppStyle.mainTitle,
              ), //Text 
              const SizedBox(
                height: 4.0,
              ), //SizedBox
          Text(
            doc["creation_date"],
              style: AppStyle.dateTitle,
              ), //Text
              const SizedBox(
                height: 8.0,
              ),  //SizedBox
          Text(
            doc["note_content"],
            style: AppStyle.mainContent, 
             overflow: TextOverflow.ellipsis,
             ), //Text
        ],
      ), // Column
}

class QueryDocumentSnapshot {
}