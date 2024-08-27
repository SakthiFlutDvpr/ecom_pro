import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sel_org/core/core_widget/core_widgets.dart';
import 'package:sel_org/resources/colors/app_colors.dart';
import 'package:sel_org/state/application_state.dart';
import 'package:sel_org/ui_1/account/general_info/general_bloc.dart';
import 'package:sel_org/ui_1/account/general_info/general_event.dart';

import 'package:sel_org/utils/flutter_appBar/flutter_app_bar.dart';
import 'package:sel_org/utils/flutter_scaffold/flutter_scaffold.dart';

class TermsConditionScreenDesk extends CoreWidgets {
  const TermsConditionScreenDesk({super.key});
  @override
  CoreWidgetsState<TermsConditionScreenDesk> createState() =>
      _TermsConditionScreenDeskState();
}

class _TermsConditionScreenDeskState
    extends CoreWidgetsState<TermsConditionScreenDesk> {
  @override
  Widget build(BuildContext context) {
    final textStyle = TextStyle(
        fontFamily: "Poppins",
        fontSize: 5.sp,
        fontWeight: FontWeight.w700,
        height: 1.75,
        color: AppColors().twoblack,
        overflow: TextOverflow.fade);
    double width = MediaQuery.of(context).size.width;
    return BlocConsumer<GeneralBloc, BaseState>(
        builder: (context, state) {
          if (state is InitialState) {
            context.read<GeneralBloc>().add(GeneralIntitialContent(context));
          }

          return FlutterScaffold(
            backgroundVectorCurve: false,
            backgroundVectorWave: false,
            isScrollPhysics: true,
            toolBarTitleString: 'Terms & Conditions',
            greenBackground: false,
            isAppBar: true,
            toolBarIconEnum: IconEnum.back,
            child: state is SuccessState
                ? Container(
                    width: width,
                    padding: EdgeInsets.symmetric(
                        vertical: 50.h, horizontal: width * 0.10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        RichText(
                          textAlign: TextAlign.justify,
                          text: TextSpan(
                            style: textStyle,
                            children: const [
                              TextSpan(
                                text:
                                    'GENERAL POLICY FOR ALL CONSUMERS AND MEMBERS',
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 25.h),
                        RichText(
                          textAlign: TextAlign.justify,
                          text: TextSpan(
                            style: textStyle,
                            children: const [
                              TextSpan(
                                text:
                                    '1. SELORG TECH PRIVATE LIMITED an integrated organic agriculture product & service provider, in which consumers agree to purchase farm products from our group of farmers/suppliers/franchise/agents which are registered with SLEORG TECH PRIVATE LIMITED.',
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 25.h),
                        RichText(
                          text: TextSpan(
                            style: textStyle,
                            children: const [
                              TextSpan(
                                text:
                                    '2. SELORG TECH PRIVATE LIMITED consumers understand that agriculture has its inherent risks and uncertainties that are related to the changing climate, water availability, labor availability, and incidence of pests and diseases, and therefore, the quantity, quality, and consistency of supply of the farm produce cannot be guaranteed.',
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 25.h),
                        RichText(
                          text: TextSpan(
                            style: textStyle,
                            children: const [
                              TextSpan(
                                text:
                                    '3. SELORG TECH PRIVATE LIMITED verifies and ascertains the authenticity of the farm produce and other products supplied by farmers/suppliers/franchise/agents.',
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 25.h),
                        RichText(
                          text: TextSpan(
                            style: textStyle,
                            children: const [
                              TextSpan(
                                text:
                                    '4. SELORG TECH PRIVATE LIMITED, within its capacity as a protocol conducts routine quality control checks in order to ensure that the farmers who supply to SLEORG are using organic farming practices.',
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 25.h),
                        RichText(
                          text: TextSpan(
                            style: textStyle,
                            children: const [
                              TextSpan(
                                text:
                                    '5. Consumers who wish to be part of SLEORG can register online at www.selorg.com. Wherein they will receive organic fruits & vegetables, organic exotic vegetables, organic grocery, Also register with our Andriod App & IOS App',
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 25.h),
                        RichText(
                          text: TextSpan(
                            style: textStyle,
                            children: const [
                              TextSpan(
                                text:
                                    '6. SELORG TECH PRIVATE LIMITED uses www.selorg.com as its official payment gateway, and we do not have access to or store any data related to credit cards or debit cards of our customers.',
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 25.h),
                        RichText(
                          text: TextSpan(
                            style: textStyle,
                            children: const [
                              TextSpan(
                                text:
                                    '7. All prices are inclusive of government tax, where applicable.',
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 25.h),
                        RichText(
                          text: TextSpan(
                            style: textStyle,
                            children: const [
                              TextSpan(
                                text:
                                    'SHIPPING, CANCELLATION AND REFUND POLICY',
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 25.h),
                        RichText(
                          text: TextSpan(
                            style: textStyle,
                            children: const [
                              TextSpan(
                                text:
                                    '1. Kindly note that the weight of fresh produce reduces during shipping, and therefore, we cannot guarantee the weight consistency of the package. In the event of deficit supply due to adverse weather conditions or other agricultural factors, the impact of deficit supply will be shared equally by all S SLEORG TECH PRIVATE LIMITED consumers. Similarly, when there is surplus the same would be distributed equally among the SLEORG TECH PRIVATE LIMITED consumers to compensate for the deficit supply, if any',
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 25.h),
                        RichText(
                          text: TextSpan(
                            style: textStyle,
                            children: const [
                              TextSpan(
                                text:
                                    '2. In case you are not at home at the time of delivery, your basket will be delivered to the designated person indicated by you (neighbour or security guard). Please write to us customercare@selorg.com.',
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 25.h),
                        RichText(
                          text: TextSpan(
                            children: const [
                              TextSpan(
                                text:
                                    '3. In case any item(s) are not delivered to you or if the quantity of item(s) supplied to you is less than what you were billed for, then SLEORG TECH PRIVATE LIMITED will supply the undelivered item or deficit quantity at the time of the next delivery. If we cannot supply the undelivered item or deficit quantity within 07 days because the item is out of stock or due to any other reason, then you will receive a refund on the deficit quantity within 3 to 21 days.',
                              ),
                            ],
                            style: textStyle,
                          ),
                        ),
                      ],
                    ),
                  )
                : Container(
                    color: Colors.black,
                  ),
          );
        },
        listener: (context, state) {});
  }
}
