import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sel_org/core/core_widget/core_widgets.dart';
import 'package:sel_org/resources/colors/app_colors.dart';
import 'package:sel_org/state/application_state.dart';
import 'package:sel_org/ui_1/category_entity/category_models.dart';
import 'package:sel_org/ui_1/dashboard/category/category_bloc.dart';
import 'package:sel_org/ui_1/dashboard/category/category_event.dart';
import 'package:sel_org/utils/flutter_appBar/flutter_app_bar.dart';
import 'package:sel_org/utils/flutter_scaffold/flutter_scaffold.dart';

class CategoryScreenTab extends CoreWidgets {
  const CategoryScreenTab({super.key});

  @override
  CoreWidgetsState<CategoryScreenTab> createState() =>
      _CategoryScreenTabState();
}

class _CategoryScreenTabState extends CoreWidgetsState<CategoryScreenTab> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CategoryBloc, BaseState>(
      builder: (context, state) {
        if (state is InitialState) {
          context
              .read<CategoryBloc>()
              .add(CategoryPageContent(context: context));
        } else if (state is LoadingState) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is SuccessState) {
          final List<Datum> categories = state.successResponse;
          return FlutterScaffold(
            isAppBar: true,
            greenBackground: false,
            backgroundVectorCurve: false,
            isScrollPhysics: true,
            toolBarIconEnum: IconEnum.back,
            toolBarTitleString: "All Categories",
            bottomNavBarEnabled: true,
            toolBarActionMenuIconEnum: MenuIconEnum.search,
            navBarIcon: BottomNavBarIcon.categories,
            isLoading: state is LoadingState,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
              child: Column(
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Expanded(
                        child: GestureDetector(
                          onTap: () {},
                          child: SizedBox(
                            child: Card(
                              color: AppColors().productCardColor,
                              elevation: 5,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.r),
                              ),
                              child: Padding(
                                padding: EdgeInsets.all(8.w),
                                child: SingleChildScrollView(
                                  // Added this widget
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        categories[0].categoryDesc,
                                        maxLines: 2,
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontSize: 8.sp,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                      SizedBox(height: 8.h),
                                      Image.network(
                                        categories[0].image,
                                        height: 90.h,
                                        width: 90.w,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),

                      SizedBox(width: 5.w), // Added space between cards
                      Expanded(
                        child: GestureDetector(
                          onTap: () {},
                          child: SizedBox(
                            child: Card(
                              color: AppColors().productCardColor,
                              elevation: 5,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.r),
                              ),
                              child: Padding(
                                padding: EdgeInsets.all(8.w),
                                child: SingleChildScrollView(
                                  // Added this widget
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        categories[1].categoryDesc,
                                        maxLines: 2,
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontSize: 8.sp,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                      SizedBox(height: 8.h),
                                      Image.network(
                                        categories[1].image,
                                        height: 90.h,
                                        width: 90.w,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  GestureDetector(
                    onTap: () {},
                    child: AspectRatio(
                      aspectRatio: 0.2,
                      child: GridView.builder(
                        padding: EdgeInsets.zero,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 4,
                          crossAxisSpacing: 5.w,
                          mainAxisSpacing: 5.h,
                          childAspectRatio: 0.7,
                        ),
                        itemCount: categories.length -
                            2, // Adjusted to exclude first two items
                        itemBuilder: (context, int index) {
                          final category = categories[index +
                              2]; // Adjusted index to skip first two items
                          return Card(
                            color: AppColors().productCardColor,
                            elevation: 5,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.r),
                            ),
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical: 8.h, horizontal: 4.w),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Text(category.categoryDesc,
                                      maxLines: 2,
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontSize: 8.sp,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black,
                                          overflow: TextOverflow.ellipsis)),
                                  Flexible(
                                    child: Image.network(
                                      category.image,
                                      loadingBuilder: (BuildContext context,
                                          Widget child,
                                          ImageChunkEvent? loadingProgress) {
                                        if (loadingProgress == null) {
                                          return child;
                                        }
                                        return Center(
                                          child: CircularProgressIndicator(
                                            value: loadingProgress
                                                        .expectedTotalBytes !=
                                                    null
                                                ? loadingProgress
                                                        .cumulativeBytesLoaded /
                                                    loadingProgress
                                                        .expectedTotalBytes!
                                                : null,
                                          ),
                                        );
                                      },
                                      errorBuilder: (BuildContext context,
                                          Object exception,
                                          StackTrace? stackTrace) {
                                        return Text('Failed to load image',
                                            style: TextStyle(fontSize: 8.sp));
                                      },
                                      cacheWidth: 500,
                                      cacheHeight: 500,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        }
        return Container();
      },
      listener: (context, state) {},
    );
  }
}
