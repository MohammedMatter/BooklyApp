import 'package:bookly_app/core/utils/app_router.dart';
import 'package:bookly_app/core/utils/assets.dart';
import 'package:bookly_app/core/utils/styles.dart';
import 'package:bookly_app/features/home/data/repositories_impl/book_repository_impl.dart';
import 'package:bookly_app/features/home/presentation/view_models/book_view_model.dart';
import 'package:bookly_app/features/home/presentation/widgets/book_image_container.dart';
import 'package:bookly_app/features/home/presentation/widgets/book_rating.dart';
import 'package:bookly_app/features/home/presentation/widgets/home_page_body.dart';
import 'package:bookly_app/features/search/presentation/view_models/search_view_model.dart';
import 'package:bookly_app/features/search/presentation/views/search_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

// ignore: must_be_immutable
class CustomSearchTextField extends StatelessWidget {
  BookViewModel book = Get.put(
    BookViewModel(BookRepositoryImpl()),
    permanent: true,
  );
  final SearchViewModel searchVM = Get.put(SearchViewModel());
  TextEditingController controllerSearch = TextEditingController();

  CustomSearchTextField({super.key});

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextField(
          controller: controllerSearch,
          onChanged: searchVM.serarchBook,
          decoration: InputDecoration(
            suffixIcon: Opacity(
              opacity: 0.8,
              child: Image.asset(AssestData.icSearch),
            ),
            focusedBorder: buildOutlinedInputBorder(),
            enabledBorder: buildOutlinedInputBorder(),
            hintText: 'Search',
          ),
        ),
        SizedBox(height: height * 0.02),
        GetX<SearchViewModel>(
          builder:
              (controller) => Text(
                searchVM.searchValue.isEmpty
                    ? 'Start typing to search for a book 📚...'
                    : 'Search Result',
                style: Styles.textStyle16,
              ),
        ),

        SizedBox(height: height * 0.06),
        GetX<SearchViewModel>(
          builder:
              (controller) => Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children:
                    controller.filterdList.isNotEmpty
                        ? controller.filterdList
                            .map(
                              (element) => GestureDetector(
                                onTap: () {
                                  GoRouter.of(context).pushNamed(
                                    AppRouter.kDetailsPage,
                                    extra: element,
                                  );
                                },
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding:  EdgeInsets.only(
                                        bottom: height*0.05,
                                      ),
                                      child: BookImageContainer(
                                        image:
                                            element
                                                .volumeInfo
                                                .imageLinks!
                                                .smallThumbnail!,
                                        width: width * 0.25,
                                        height: height * 0.2,
                                      ),
                                    ),

                                    Expanded(
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          SizedBox(
                                            width: width * 0.45,
                                            child: Text(
                                              element.volumeInfo.title,
                                              maxLines: 2,
                                              style: Styles.textStyle20
                                                  .copyWith(
                                                    fontFamily: 'GT font',
                                                  ),
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ),
                                          SizedBox(height: height * 0.01),

                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children:
                                                element.volumeInfo.authors!
                                                    .map(
                                                      (e) => Text(
                                                        e,
                                                        style: TextStyle(
                                                          color: Color(
                                                            0xff707070,
                                                          ),
                                                        ),
                                                      ),
                                                    )
                                                    .toList(),
                                          ),

                                          SizedBox(height: height * 0.01),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                element.saleInfo.saleability ==
                                                        "NOT_FOR_SALE"
                                                    ? 'Not For Sale'
                                                    : 'Free',
                                                style: Styles.textStyle18,
                                              ),
                                              Spacer(),
                                              BookRating(
                                                widget: HomePageBody(
                                                  height: height,
                                                  width: width,
                                                ),
                                                rating: 4.2,
                                                book: element,
                                              ),
                                              SizedBox(width: width * 0.001),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            )
                            .toList()
                        : [
                          Center(
                            child: Text(
                              'No result !',
                              style: Styles.textStyle20,
                            ),
                          ),
                        ],
              ),
        ),
      ],
    );
  }

  OutlineInputBorder buildOutlinedInputBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: BorderSide(color: Colors.white),
    );
  }
}
