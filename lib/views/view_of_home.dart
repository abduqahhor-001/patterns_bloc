
import 'package:flutter/material.dart';
import 'package:patterns_bloc/model/contact_model.dart';

import 'item_of_post.dart';


Widget viewOfHome(List<Contact> items, bool isLoading) {
  return Stack(
    children: [
      ListView.builder(
        itemCount: items.length,
        itemBuilder: (ctx, index) {
          return itemOfPost(ctx, items[index]);
        },
      ),
      isLoading
          ? Center(
        child: CircularProgressIndicator(),
      )
          : SizedBox.shrink(),
    ],
  );
}