
import 'package:bookly_app/features/home/presentation/widgets/details_page_bode.dart';

import 'package:flutter/material.dart';

class DetailsView extends StatelessWidget {
  const DetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: DetailsBody(width: width, height: height),
    );
  }
}


