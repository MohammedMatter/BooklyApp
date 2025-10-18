import 'package:bookly_app/core/utils/app_router.dart';
import 'package:bookly_app/core/utils/assets.dart';
import 'package:bookly_app/features/home/data/repositories_impl/book_repository_impl.dart';
import 'package:bookly_app/features/home/presentation/view_models/book_view_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
   CustomAppBar({super.key, required this.width, required this.height});

  final double width;
  final double height;
BookViewModel bookVm = Get.put(BookViewModel(BookRepositoryImpl())) ; 
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(height: 20, child: Image.asset(AssestData.logo)),
            SizedBox(
              height: 20,
              width: 20,
              child: GestureDetector(
                onTap:
                    () {
                bookVm.error.isEmpty?      GoRouter.of(context).pushNamed(AppRouter.kSearchView ,):null;
                    },

                child: Image.asset(AssestData.icSearch, fit: BoxFit.fill),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
