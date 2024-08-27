

import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

import '../../../resources/drawable/app_drawable.dart';
import '../../../state/application_state.dart';
import '../../../utils/flutter_scaffold/flutter_scaffold.dart';
import '../../dashboard/homepage/homepage_screen.dart';
import '../../login/login_screen_binding/login_page/login_screen.dart';
import '../splash_bloc.dart';
import '../splash_event.dart';

class SplashScreenWeb extends StatelessWidget {
  const SplashScreenWeb({super.key});

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
          backgroundFitMob: false,
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Center(
              child: SvgPicture.asset(
                AppDrawable().selorgLogoWeb,
              ),
            ),
          ),
        );
      },
    );
  }
}
