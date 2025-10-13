import 'package:bookly_app/core/utils/assets.dart';
import 'package:bookly_app/features/home/presentation/widgets/home_page_body.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        titleSpacing: 0,
        actionsPadding: EdgeInsets.only(right: width * 0.05),
        actions: [Icon(Icons.search, color: Colors.white)],
        title: Container(
          margin: EdgeInsets.only(left: 16),
          width: width * 0.2,
          height: height * 0.05,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(AssestData.logo),
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: HomePageBody(height: height, width: width),
      ),
    );
  }
}
