import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sel_org/state/application_state.dart';
import 'package:sel_org/utils/reusable_widgets/product_pack/additional_menu_item.dart';
import 'package:sel_org/utils/reusable_widgets/product_pack/product_bloc.dart';
import 'package:sel_org/utils/reusable_widgets/product_pack/product_entity/product_model.dart';
import 'package:sel_org/utils/reusable_widgets/product_pack/product_event.dart';
import 'package:sel_org/utils/reusable_widgets/product_pack/varient_box.dart';

class ProductDropDown extends StatefulWidget {
  const ProductDropDown({super.key, required this.productBloc});

  final ProductBloc productBloc;
  @override
  State<ProductDropDown> createState() => _ProductDropDownState();
}

class _ProductDropDownState extends State<ProductDropDown> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;

    return BlocBuilder<ProductBloc, BaseState>(
        bloc: widget.productBloc,
        builder: (context, state) {
          return DropdownButtonFormField2<Varient>(
            isExpanded: false,
            isDense: true,
            menuItemStyleData: MenuItemStyleData(
                padding: width <= 650
                    ? EdgeInsets.symmetric(horizontal: 4.w, vertical: 4.h)
                    : width >= 650 && width <= 1100
                        ? EdgeInsets.symmetric(horizontal: 4.w, vertical: 6.h)
                        : EdgeInsets.symmetric(horizontal: 4.w, vertical: 8.h),
                height: width <= 650
                    ? 70.h
                    : width >= 650 && width <= 1100
                        ? 80.h
                        : 100.h),
            iconStyleData: IconStyleData(
                icon: const Icon(
                  Icons.keyboard_arrow_down,
                  color: Colors.black,
                ),
                iconSize: width <= 650
                    ? 15.sp
                    : width >= 650 && width <= 1100
                        ? 10.sp
                        : 6.sp),
            alignment: Alignment.centerLeft,
            decoration: InputDecoration(
                fillColor: Colors.transparent,
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(const Radius.circular(8).r),
                    borderSide:
                        const BorderSide(width: 0.8, color: Colors.grey)),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(const Radius.circular(8).r),
                    borderSide:
                        const BorderSide(width: 0.8, color: Colors.grey)),
                contentPadding: width <= 650
                    ? EdgeInsets.symmetric(
                        horizontal: 4.w,
                      )
                    : width >= 650 && width <= 1100
                        ? EdgeInsets.symmetric(
                            horizontal: 4.w,
                          )
                        : EdgeInsets.symmetric(
                            horizontal: 4.w,
                          )),
            dropdownStyleData: DropdownStyleData(
              elevation: 1,
              width: width <= 650
                  ? width / 2
                  : width >= 650 && width <= 1100
                      ? width * 0.35
                      : width * 0.20,
            ),
            value: widget.productBloc.varient,
            onChanged: (Varient? value) {
              widget.productBloc.add(VarientChangeEvent(value!));
            },
            items: widget.productBloc.productModel.varients
                .map((Varient varient) => DropdownMenuItem(
                    value: varient,
                    child: VarientBox(
                      varient: varient,
                      bloc: widget.productBloc,
                    )))
                .toList()
              ..add(const DropdownMenuItem(child: AdditionalMenuItem())),
            selectedItemBuilder: (context) {
              return widget.productBloc.productModel.varients.map((value) {
                return Text(
                  widget.productBloc.varient.size,
                  // widget.productBloc.productSize.toString().length <= 1
                  //     ? value.size
                  //     : widget.productBloc.productSize,
                  style: TextStyle(
                      fontFamily: "Poppins",
                      fontSize: width <= 650
                          ? 10.sp
                          : width >= 650 && width <= 1100
                              ? 6.sp
                              : 4.sp,
                      fontWeight: FontWeight.w600,
                      color: width <= 650
                          ? const Color(0xff444444)
                          : width >= 650 && width <= 1100
                              ? const Color(0xff444444)
                              : const Color(0xff969696)),
                );
              }).toList();
            },
          );
        });
  }
}

///////////////////////Additional menu item for Desk top layout ///////////////////

// class ProductDropDownDesk extends StatefulWidget {
//   const ProductDropDownDesk({super.key, required this.varients});
//   final List<Varient> varients;
//   @override
//   State<ProductDropDownDesk> createState() => _ProductDropDownDeskState();
// }

// class _ProductDropDownDeskState extends State<ProductDropDownDesk> {
//   @override
//   Widget build(BuildContext context) {
//     Size screenSize = MediaQuery.of(context).size;

//     return BlocBuilder<ProductBloc, BaseState>(
//       builder: (context, state) {
//         return DropdownButtonFormField2<Varient>(
//           isExpanded: false,
//           isDense: true,
//           menuItemStyleData: MenuItemStyleData(
//               padding:
//               height:),
//           iconStyleData: IconStyleData(
//               icon: const Icon(
//                 Icons.keyboard_arrow_down,
//                 color: Colors.black,
//               ),
//               iconSize:),
//           alignment: Alignment.centerLeft,
//           decoration: InputDecoration(
//               fillColor: Colors.transparent,
//               enabledBorder: OutlineInputBorder(
//                   borderRadius: BorderRadius.all(const Radius.circular(8).r),
//                   borderSide: const BorderSide(width: 0.8, color: Colors.grey)),
//               focusedBorder: OutlineInputBorder(
//                   borderRadius: BorderRadius.all(const Radius.circular(8).r),
//                   borderSide: const BorderSide(width: 0.8, color: Colors.grey)),
//               contentPadding: ),
//           dropdownStyleData: DropdownStyleData(
//             elevation: 1,
//             width:
//           ),
//           value: widget.varients[0],
//           onChanged: (Varient? value) {
//             context.read<ProductBloc>().add(VarientChangeEvent(value));
//           },
//           items: widget.varients
//               .map((Varient varient) => DropdownMenuItem(
//                   value: varient,
//                   child: VarientBoxDesk(
//                     varient: varient,
//                   )))
//               .toList()
//             ..add(const DropdownMenuItem(child: AdditionalMenuItemDesk())),
//           selectedItemBuilder: (context) {
//             return widget.varients.map((value) {
//               return Text(
//                 value.gram,
//                 style: TextStyle(
//                     fontFamily: "Poppins",
//                     fontSize:
//                     color: ),
//               );
//             }).toList();
//           },
//         );
//       },
//     );
//   }
// }
