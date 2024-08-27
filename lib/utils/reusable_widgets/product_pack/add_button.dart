import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:sel_org/resources/colors/app_colors.dart';
import 'package:sel_org/state/application_state.dart';
import 'package:sel_org/utils/reusable_widgets/product_pack/product_bloc.dart';
import 'package:sel_org/utils/reusable_widgets/product_pack/product_entity/product_model.dart';
import 'package:sel_org/utils/reusable_widgets/product_pack/product_event.dart';

class ProductAddButton extends StatelessWidget {
  const ProductAddButton(
      {super.key, required this.bloc, required this.varient});

  final ProductBloc bloc;
  final Varient varient;

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return BlocBuilder<ProductBloc, BaseState>(
        bloc: bloc,
        builder: (context, state) {
          return OutlinedButton(
            onPressed: () {
              bloc.add(VarientChangeEvent(varient));
              if (bloc.varient.skuCode == varient.skuCode) {
                bloc.add(ProductClickedEvent());
              }
              context.pop();
            },
            style: OutlinedButton.styleFrom(
                backgroundColor: varient.clicked
                    ? AppColors().primaryDarkGreen
                    : Colors.transparent,
                side: BorderSide(color: AppColors().primaryDarkGreen),
                padding: const EdgeInsets.symmetric(),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(width <= 650
                        ? const Radius.circular(15).r
                        : const Radius.circular(20).r))),
            child: Text(varient.clicked ? "Added" : "Add",
                style: TextStyle(
                    fontFamily: "Poppins",
                    fontSize: width <= 650
                        ? 10.sp
                        : width >= 650 && width <= 1100
                            ? 6.sp
                            : 3.sp,
                    fontWeight: FontWeight.bold,
                    color: varient.clicked
                        ? Colors.white
                        : AppColors().primaryDarkGreen)),
          );
        });
  }
}
