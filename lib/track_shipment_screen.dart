// import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';
//
// class TrackShipmentScreen extends StatefulWidget {
//   const TrackShipmentScreen({Key? key}) : super(key: key);
//
//   @override
//   _TrackShipmentScreenState createState() => _TrackShipmentScreenState();
// }
//
// class _TrackShipmentScreenState extends State<TrackShipmentScreen> {
//   Locale? _locale;
//
//   String dateValues = '';
//
//   // final DateFormat outputFormat = DateFormat.yMMMd();
//
//   @override
//   void didChangeDependencies() {
//     getLocale().then((Locale locale) {
//       setState(() {
//         _locale = locale;
//       });
//     });
//     super.didChangeDependencies();
//   }
//
//   @override
//   void initState() {
//     super.initState();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     Get.put(TrackShipmentController());
//     return GetBuilder<TrackShipmentController>(
//       builder: (controller) {
//         return _buildBodyWidget(context, controller);
//       },
//     );
//   }
//
//   SafeArea _buildBodyWidget(
//       BuildContext context, TrackShipmentController controller) {
//     return SafeArea(
//       top: false,
//       child: Scaffold(
//         body: Stack(
//           children: [
//             SizedBox(
//               child: Column(
//                 children: [
//                   Expanded(
//                     flex: 2,
//                     child: Container(
//                         padding: const EdgeInsets.only(left: 54),
//                         decoration: BoxDecoration(
//                           color: ColorResource.getOrangeColor(context),
//                         ),
//                         child: Image.asset(ImageResource.trackship_background)),
//                   ),
//                   Expanded(
//                     flex: 2,
//                     child: Container(
//                       color: ColorResource.colorE5E5E5,
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             Column(
//               children: [
//                 Flexible(
//                   child: Column(
//                     children: [
//                       CustomAppbar(
//                         titleString: Languages.of(context)!.trackShipment,
//                         iconEnumValues: IconEnum.back,
//                         // backgroundColor:
//                         //     ColorResource.getOrangeColor(context),
//                         titleSpacing: 8,
//                         onItemSelected: (values) {
//                           Navigator.pop(context);
//                         },
//                       ),
//                       Expanded(
//                         child: SizedBox(
//                           child: Column(
//                             children: [
//                               const SizedBox(
//                                 height: 16,
//                               ),
//                               CustomText(Languages.of(context)!.orderDetails,
//                                   style: Theme.of(context)
//                                       .textTheme
//                                       .subtitle1!
//                                       .copyWith(
//                                           color:
//                                               ColorResource.getWhiteTextColor(
//                                                   context),
//                                           fontWeight: FontWeight.w400)),
//                               Container(
//                                 margin: const EdgeInsets.only(top: 08),
//                                 child: CustomText('''
// ${Languages.of(context)!.dateOfOrder} ${DateFormat.yMMMd().format(DateTime.parse(controller.shipmentModel.orderedDate.toString()))}''',
//                                     style: Theme.of(context)
//                                         .textTheme
//                                         .bodyText1!
//                                         .copyWith(
//                                             color:
//                                                 ColorResource.getWhiteTextColor(
//                                                     context),
//                                             fontWeight: FontWeight.w700)),
//                               ),
//                               Container(
//                                 margin: const EdgeInsets.only(top: 08),
//                                 child: CustomText('''
// ${Languages.of(context)!.amount} ₹${controller.shipmentModel.amount}''',
//                                     style: Theme.of(context)
//                                         .textTheme
//                                         .bodyText1!
//                                         .copyWith(
//                                             color:
//                                                 ColorResource.getWhiteTextColor(
//                                                     context),
//                                             fontWeight: FontWeight.w700)),
//                               ),
//                               Container(
//                                 margin: const EdgeInsets.only(top: 32),
//                                 child: CustomText(
//                                     Languages.of(context)!.estimatedDelivery,
//                                     style: Theme.of(context)
//                                         .textTheme
//                                         .subtitle1!
//                                         .copyWith(
//                                             color:
//                                                 ColorResource.getWhiteTextColor(
//                                                     context),
//                                             fontWeight: FontWeight.w400)),
//                               ),
//                               Container(
//                                 margin: const EdgeInsets.only(top: 08),
//                                 child: CustomText('5 Jun - 6 Jun',
//                                     style: Theme.of(context)
//                                         .textTheme
//                                         .bodyText1!
//                                         .copyWith(
//                                             color:
//                                                 ColorResource.getWhiteTextColor(
//                                                     context),
//                                             fontWeight: FontWeight.w700)),
//                               ),
//                               Flexible(
//                                 child: Container(
//                                   alignment: Alignment.topLeft,
//                                   margin: const EdgeInsets.symmetric(
//                                       vertical: 32, horizontal: 12),
//                                   child: Card(
//                                     color: Colors.white,
//                                     elevation: 0,
//                                     shape: RoundedRectangleBorder(
//                                       borderRadius: BorderRadius.circular(14),
//                                     ),
//                                     shadowColor: ColorResource.color090B0,
//                                     // Chan
//                                     child: Column(
//                                       children: [
//                                         Flexible(
//                                           child: ListView.builder(
//                                               physics: ScrollPhysics(),
//                                               itemCount: controller
//                                                   .shipmentModel
//                                                   .shipmentTrack!
//                                                   .length,
//                                               itemBuilder:
//                                                   (BuildContext con, int ind) {
//                                                 if (ind != 0) {
//                                                   return Column(
//                                                     children: [
//                                                       Container(
//                                                         padding:
//                                                             const EdgeInsets
//                                                                 .only(
//                                                           left: 31,
//                                                           right: 31,
//                                                         ),
//                                                         child: Column(
//                                                             children: [
//                                                               Row(
//                                                                 children: [
//                                                                   Column(
//                                                                     children: List
//                                                                         .generate(
//                                                                       5,
//                                                                       (int ii) =>
//                                                                           Padding(
//                                                                         padding: const EdgeInsets.only(
//                                                                             left:
//                                                                                 25,
//                                                                             right:
//                                                                                 10,
//                                                                             top:
//                                                                                 2,
//                                                                             bottom:
//                                                                                 2),
//                                                                         child:
//                                                                             Container(
//                                                                           height:
//                                                                               3,
//                                                                           width:
//                                                                               2,
//                                                                           color: controller.shipmentModel.shipmentTrack![ind].isActive!
//                                                                               ? ColorResource.colorFF781F
//                                                                               : ColorResource.color787878,
//                                                                         ),
//                                                                       ),
//                                                                     ),
//                                                                   ),
//                                                                 ],
//                                                               ),
//                                                               Row(children: [
//                                                                 const SizedBox(
//                                                                   width: 5,
//                                                                 ),
//                                                                 Card(
//                                                                   color: Colors
//                                                                       .white,
//                                                                   child:
//                                                                       Container(
//                                                                     child:
//                                                                         Image(
//                                                                       image: AssetImage(controller
//                                                                               .shipmentModel
//                                                                               .shipmentTrack![
//                                                                                   ind]
//                                                                               .isActive!
//                                                                           ? ImageResource
//                                                                               .shipment_tracking_activate
//                                                                           : ImageResource
//                                                                               .shipment_tracking_step_icon),
//                                                                       fit: BoxFit
//                                                                           .fill,
//                                                                       width: 16,
//                                                                       height:
//                                                                           16,
//                                                                     ),
//                                                                     margin: const EdgeInsets
//                                                                         .all(8),
//                                                                   ),
//                                                                   elevation: 2,
//                                                                   shape:
//                                                                       RoundedRectangleBorder(
//                                                                     borderRadius:
//                                                                         BorderRadius
//                                                                             .circular(8),
//                                                                   ),
//                                                                 ),
//                                                                 const SizedBox(
//                                                                   width: 16,
//                                                                 ),
//                                                                 CustomText(
//                                                                   controller
//                                                                       .shipmentModel
//                                                                       .shipmentTrack![
//                                                                           ind]
//                                                                       .description!,
//                                                                   style: Theme.of(context).textTheme.subtitle1!.copyWith(
//                                                                       color: controller
//                                                                               .shipmentModel
//                                                                               .shipmentTrack![
//                                                                                   ind]
//                                                                               .isActive!
//                                                                           ? ColorResource.getBlackTextColor(
//                                                                               context)
//                                                                           : ColorResource.getGreyTextColor(
//                                                                               context),
//                                                                       fontWeight: controller
//                                                                               .shipmentModel
//                                                                               .shipmentTrack![
//                                                                                   ind]
//                                                                               .isActive!
//                                                                           ? FontWeight
//                                                                               .w700
//                                                                           : FontWeight
//                                                                               .w600),
//                                                                 )
//                                                               ]),
//                                                             ]),
//                                                       ),
//                                                       (ind ==
//                                                               controller
//                                                                       .shipmentModel
//                                                                       .shipmentTrack!
//                                                                       .length -
//                                                                   1)
//                                                           ? Container(
//                                                               width:
//                                                                   MediaQuery.of(
//                                                                           context)
//                                                                       .size
//                                                                       .width,
//                                                               child: Card(
//                                                                 elevation: 0,
//                                                                 margin:
//                                                                     EdgeInsets
//                                                                         .zero,
//                                                                 color: ColorResource
//                                                                     .color1ABFCBD7
//                                                                     .withOpacity(
//                                                                         0.10),
//                                                                 shape:
//                                                                     RoundedRectangleBorder(
//                                                                   borderRadius:
//                                                                       BorderRadius
//                                                                           .circular(
//                                                                               16),
//                                                                 ),
//                                                                 child:
//                                                                     Container(
//                                                                   margin: const EdgeInsets
//                                                                           .symmetric(
//                                                                       vertical:
//                                                                           16,
//                                                                       horizontal:
//                                                                           25),
//                                                                   child: Column(
//                                                                     crossAxisAlignment:
//                                                                         CrossAxisAlignment
//                                                                             .start,
//                                                                     children: [
//                                                                       CustomText(
//                                                                           Languages.of(context)!
//                                                                               .deliveryAddress,
//                                                                           style: Theme.of(context)
//                                                                               .textTheme
//                                                                               .subtitle1!
//                                                                               .copyWith(color: ColorResource.getGreyTextColor(context), fontWeight: FontWeight.w400)),
//                                                                       const SizedBox(
//                                                                         height:
//                                                                             10,
//                                                                       ),
//                                                                       CustomText(
//                                                                           controller
//                                                                               .shipmentModel
//                                                                               .name!,
//                                                                           style: Theme.of(context)
//                                                                               .textTheme
//                                                                               .bodyText1!
//                                                                               .copyWith(color: ColorResource.getBlackTextColor(context), fontWeight: FontWeight.w700)),
//                                                                       const SizedBox(
//                                                                         height:
//                                                                             10,
//                                                                       ),
//                                                                       CustomText(
//                                                                           controller
//                                                                               .shipmentModel
//                                                                               .deliveryAddress!,
//                                                                           style: Theme.of(context)
//                                                                               .textTheme
//                                                                               .subtitle1!
//                                                                               .copyWith(color: ColorResource.getBlackTextColor(context), fontWeight: FontWeight.w400)),
//                                                                     ],
//                                                                   ),
//                                                                 ),
//                                                               ),
//                                                               margin: EdgeInsets
//                                                                   .only(
//                                                                       top: 20),
//                                                             )
//                                                           : Container()
//                                                     ],
//                                                   );
//                                                 } else {
//                                                   return Container(
//                                                     padding:
//                                                         const EdgeInsets.only(
//                                                       left: 31,
//                                                       right: 31,
//                                                     ),
//                                                     child: Row(children: [
//                                                       const SizedBox(
//                                                         width: 5,
//                                                       ),
//                                                       Card(
//                                                         color: Colors.white,
//                                                         child: Container(
//                                                           child: const Image(
//                                                             image: AssetImage(
//                                                                 ImageResource
//                                                                     .shipment_tracking_activate),
//                                                             fit: BoxFit.contain,
//                                                             width: 16,
//                                                             height: 16,
//                                                           ),
//                                                           margin:
//                                                               const EdgeInsets
//                                                                   .all(8),
//                                                           width: 16,
//                                                           height: 16,
//                                                         ),
//                                                         elevation: 2,
//                                                         shape:
//                                                             RoundedRectangleBorder(
//                                                           borderRadius:
//                                                               BorderRadius
//                                                                   .circular(8),
//                                                         ),
//                                                       ),
//                                                       const SizedBox(
//                                                         width: 16,
//                                                       ),
//                                                       CustomText(
//                                                           controller
//                                                               .shipmentModel
//                                                               .shipmentTrack![0]
//                                                               .description!,
//                                                           style: Theme.of(
//                                                                   context)
//                                                               .textTheme
//                                                               .subtitle1!
//                                                               .copyWith(
//                                                                   color: ColorResource
//                                                                       .getBlackTextColor(
//                                                                           context),
//                                                                   fontWeight:
//                                                                       FontWeight
//                                                                           .w700))
//                                                     ]),
//                                                   );
//                                                 }
//                                               }),
//                                         ),
//                                       ],
//                                     ),
//                                   ),
//                                 ),
//                               )
//                             ],
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
//
// extension DateHelpers on DateTime {
//   bool isToday() {
//     final DateTime now = DateTime.now();
//     return now.day == this.day &&
//         now.month == this.month &&
//         now.year == this.year;
//   }
//
//   bool isYesterday() {
//     final DateTime yesterday = DateTime.now().subtract(const Duration(days: 1));
//     return yesterday.day == this.day &&
//         yesterday.month == this.month &&
//         yesterday.year == this.year;
//   }
// }
