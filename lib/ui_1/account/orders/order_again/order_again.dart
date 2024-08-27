import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sel_org/constants/constants.dart';

import '../../../../utils/flutter_appBar/flutter_app_bar.dart';
import '../../../../utils/flutter_scaffold/flutter_scaffold.dart';
import '../orders_entity/order_model.dart';

class OrderAgainPage extends StatefulWidget {
  final Orderlist order;

  const OrderAgainPage({Key? key, required this.order}) : super(key: key);

  @override
  State<OrderAgainPage> createState() => _OrderAgainPageState();
}

class _OrderAgainPageState extends State<OrderAgainPage> {
  @override
  Widget build(BuildContext context) {
    return FlutterScaffold(
      //  isLoading: state is LoadingState,
      isAppBar: true,
      toolBarTitleString: "Cart Dummy screen",
      isScrollPhysics: true,
      greenBackground: false,
      backgroundVectorCurve: false,
      backgroundVectorWave: false,
      toolBarIconEnum: IconEnum.back,
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Order Status: ${widget.order.status}'),
            Text('Order Details: ${widget.order.orderdetails}'),
            Text('Order Date: ${widget.order.date}'),
            Text('Order Time: ${widget.order.time}'),
            Text('Order Amount: ${widget.order.amount}'),
            height(10.h),
            const Text('Order Images:'),
            for (var imageUrl in widget.order.imageUrls)
              Image.asset(imageUrl, width: 100, height: 100),
          ],
        ),
      ),
    );
  }
}
