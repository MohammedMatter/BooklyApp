import 'package:bookly_app/core/utils/app_router.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CustomAppBarDetails extends StatelessWidget {
  const CustomAppBarDetails({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              icon: Icon(Icons.close, color: Colors.white),
              onPressed: () {
               GoRouter.of(context).pop(); 
              },
            ),
            IconButton(
              icon: Icon(Icons.shopping_cart_outlined, color: Colors.white),
              onPressed: () {     
              },
            ),
          ],
        ),
      ),
    );
  }
}
