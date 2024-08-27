import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:sel_org/resources/drawable/app_drawable.dart';
import 'package:sel_org/state/application_state.dart';
import 'package:sel_org/ui_1/login/login_screen_binding/login_page/login_screen.dart';
import 'package:sel_org/ui_1/splash/splash_bloc.dart';
import 'package:sel_org/ui_1/splash/splash_event.dart';
import 'package:sel_org/utils/flutter_scaffold/flutter_scaffold.dart';

import '../../dashboard/homepage/homepage_screen.dart';

class SplashScreenMobile extends StatelessWidget {
  const SplashScreenMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SplashBloc, BaseState>(
      listener: (context, state) {
        if (state is SuccessState) {
          if (state.successResponse == HomepageScreen.routeName) {
            GoRouter.of(context).pushReplacement(HomepageScreen.routeName);
          } else {
            GoRouter.of(context).pushReplacement(LoginScreenPage.routeName);
          }
        }
      },
      builder: (context, state) {
        if (state is InitialState) {
          context
              .read<SplashBloc>()
              .add(SplashInitialContent(context: context));
        }
        return FlutterScaffold(
          backgroundVectorCurve: false,
          backgroundVectorWave: false,
          isLoading: false,
          isAppBar: false,
          greenBackground: true,
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Center(
              child: Image.asset(
                AppDrawable().selorgLogo,
                fit: BoxFit.contain,
              ),
            ),
          ),
        );
      },
    );
  }
}
