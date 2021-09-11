import 'package:flutter/material.dart';
import 'package:quiz_app_ii_example/data/categories.dart';
import 'package:quiz_app_ii_example/data/user.dart';
import 'package:quiz_app_ii_example/page/category_page.dart';
import 'package:quiz_app_ii_example/widget/appBar.widget.dart';
import 'package:quiz_app_ii_example/widget/category_detail_widget.dart';
import 'package:quiz_app_ii_example/widget/category_header_widget.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: MyAppBar(username: username),
        body: ListView(
          physics: BouncingScrollPhysics(),
          padding: const EdgeInsets.all(16),
          children: [
            SizedBox(height: 8),
            buildCategories(),
          ],
        ),
      );

  Widget buildCategories() => Container(
        height: 555,
        child: GridView(
          primary: false,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 4 / 3,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
          ),
          children: categories
              .map((category) => CategoryHeaderWidget(category: category))
              .toList(),
        ),
      );


}
