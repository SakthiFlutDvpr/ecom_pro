// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sel_org/constants/constants.dart';
import 'package:sel_org/state/application_state.dart';
import 'package:sel_org/utils/flutter_scaffold/flutter_scaffold.dart';
import 'package:sel_org/utils/reusable_widgets/product_pack/product.dart';
import 'package:sel_org/utils/reusable_widgets/product_pack/product_entity/product_model.dart';

import '../search_bloc.dart';
import '../search_entity/search_model.dart';
import '../search_entity/searchproduct.dart';
import '../search_event.dart';

class SearchMob extends StatefulWidget {
  const SearchMob({Key? key}) : super(key: key);

  @override
  State<SearchMob> createState() => _SearchMobState();
}

class _SearchMobState extends State<SearchMob> {
  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    //double height = MediaQuery.of(context).size.height;

    return BlocProvider(
      create: (c) => SearchBloc(),
      child: BlocConsumer<SearchBloc, BaseState>(
        listener: (context, state) {
          if (state is ErrorState) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.errorMessage),
                backgroundColor: Colors.red,
              ),
            );
          }
        },
        builder: (context, state) {
          return FlutterScaffold(
              isAppBar: false,
              greenBackground: false,
              backgroundVectorCurve: false,
              isScrollPhysics: true,
              isLoading: false,
              child: Container(
                padding: EdgeInsets.symmetric(
                    vertical: 20.h, horizontal: width * 0.04),
                child: Column(
                  children: [
                    TextField(
                      controller: _searchController,
                      onChanged: (query) {
                        if (query.isNotEmpty) {
                          context
                              .read<SearchBloc>()
                              .add(SearchQueryEvent(query));
                        }
                      },
                      decoration: InputDecoration(
                        hintText: "Search the items...",
                        hintStyle: GoogleFonts.poppins(
                          fontSize: 10.0.sp,
                        ),
                        prefixIcon: const Icon(Icons.search),
                        border: OutlineInputBorder(
                          borderRadius:
                              BorderRadius.all(const Radius.circular(8.0).r),
                        ),
                      ),
                    ),
                    //height(16.h),
                    _buildResults(state),
                  ],
                ),
              ));
        },
      ),
    );
  }

  Widget _buildResults(BaseState state) {
    if (state is LoadingState) {
      return const Center(child: CircularProgressIndicator());
    } else if (state is SuccessState) {
      final products = state.successResponse["data"] as List;
      return AspectRatio(
        aspectRatio: 1.4,
        child: GridView.builder(
          shrinkWrap: true,
          primary: true,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 0.7,
          ),
          itemCount: products.length,
          itemBuilder: (context, index) {
            final product = products[index];
            debugPrint(
                '===================================================$products');
            return ProductWidget(
                productModel: ProductModel(
                    skuCode: product["skuCode"],
                    imageUrl: "assets/png/product_0.png",
                    title: product["skuName"],
                    size: product["size"],
                    price: product["salePrice"],
                    mrp: product["mrp"],
                    offer: '25% Off',
                    varients: [
                      Varient(
                        skuCode: 'SKU001',
                        imageUrl: 'assets/png/product_1.png',
                        title: 'Product 1',
                        size: "500g",
                        price: '10.00',
                        mrp: '12.00',
                        offer: '10%',
                        quantity: 0,
                        clicked: false,
                      ),
                      Varient(
                        skuCode: 'SKU002',
                        imageUrl: 'assets/png/product_1.png',
                        title: 'Product 2',
                        size: "100g",
                        price: '20.00',
                        mrp: '24.00',
                        offer: '10%',
                        quantity: 0,
                        clicked: false,
                      )
                    ],
                    isStocked: product["isStocked"]));
          },
        ),
      );
    } else {
      return const Center(child: Text('No results found'));
    }
  }
}
