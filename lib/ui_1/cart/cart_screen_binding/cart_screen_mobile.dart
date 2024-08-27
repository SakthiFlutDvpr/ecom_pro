import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sel_org/utils/flutter_scaffold/flutter_scaffold.dart';

import '../../../state/application_state.dart';
import '../../../utils/flutter_appBar/flutter_app_bar.dart';
import '../cart_bloc.dart';

class CartScreenMob extends StatefulWidget {
  const CartScreenMob({super.key});

  @override
  State<CartScreenMob> createState() => _CartScreenMobState();
}

class _CartScreenMobState extends State<CartScreenMob> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CartBloc, BaseState>(
        builder: (context, state) {
          if (state is InitialState) {}
          return FlutterScaffold(
            isAppBar: true,
            greenBackground: false,
            backgroundVectorCurve: false,
            isScrollPhysics: true,
            toolBarIconEnum: IconEnum.back,
            toolBarTitleString: "Cart",
            isLoading: state is LoadingState,
            trailingIcon: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                    20,
                  ),
                  color: Colors.white),
              margin: const EdgeInsets.all(10),
              padding: const EdgeInsets.all(10),
              child: Center(
                child: Text(
                  "Add More",
                  style: Theme.of(context).textTheme.titleSmall,
                ),
              ),
            ),
            child: Padding(
              padding: EdgeInsets.all(16.w),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Onion(Organic)', style: TextStyle(fontSize: 16.sp)),
                      Row(
                        children: [
                          IconButton(
                            icon: const Icon(Icons.remove),
                            onPressed: () {},
                          ),
                          Text('2', style: TextStyle(fontSize: 16.sp)),
                          IconButton(
                            icon: const Icon(Icons.add),
                            onPressed: () {},
                          ),
                        ],
                      ),
                      Text('₹37', style: TextStyle(fontSize: 16.sp)),
                    ],
                  ),
                  SizedBox(height: 10.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Tomato(Organic)',
                          style: TextStyle(fontSize: 16.sp)),
                      Row(
                        children: [
                          IconButton(
                            icon: const Icon(Icons.remove),
                            onPressed: () {},
                          ),
                          Text('1', style: TextStyle(fontSize: 16.sp)),
                          IconButton(
                            icon: const Icon(Icons.add),
                            onPressed: () {},
                          ),
                        ],
                      ),
                      Text('₹70', style: TextStyle(fontSize: 16.sp)),
                    ],
                  ),
                  SizedBox(height: 20.h),
                  Text('Delivery Partner Tip',
                      style: TextStyle(fontSize: 16.sp)),
                  // Add more widgets here as needed, adapting their sizes using ScreenUtil
                ],
              ),
            ),
          );
        },
        listener: (context, state) {});
  }
}
