import 'package:flutter/material.dart';
import 'package:sel_org/resources/drawable/app_drawable.dart';
import 'package:sel_org/utils/bottom_navigation_bar/bottom_nav_bar.dart';
import 'package:sel_org/utils/flutter_appBar/flutter_app_bar.dart';

class FlutterScaffold extends StatefulWidget {
  const FlutterScaffold(
      {Key? key,
      required this.child,
      this.isStatusBar = true,
      this.isAppBar = true,
      this.isLoading = false,
      this.appBarCenterImage = false,
      this.floatingActionButton,
      this.appBarImageString,
      this.floatingActionButtonLocation = FloatingActionButtonLocation.endFloat,
      this.toolBarTitleString,
      this.toolBarSubTitle,
      this.toolBarCaptionText,
      this.toolBarElevation = 0.0,
      this.toolBarIconEnum = IconEnum.empty,
      this.toolBarActionMenuIconEnum = MenuIconEnum.empty,
      this.toolBarLabel,
      this.toolBarShowSearch = false,
      this.toolBarNotificationCount = 0,
      this.toolBarTitleSpacing,
      this.floatingIcon,
      this.toolBarTextController,
      this.toolBarCallback,
      this.bottomNavigationBar,
      this.resizeToAvoidBottomInset = true,
      this.greenBackground = true,
      this.scaffoldKey,
      this.navBarIcon = BottomNavBarIcon.selorg,
      this.toolBarTitleStringStyle,
      this.leadingIcon = const Icon(
        Icons.keyboard_arrow_left,
        size: 24,
      ),
      this.trailingIcon,
      this.trailingImage,
      this.trailingImageCallback,
      this.leadingCallback,
      this.onCallBack,
      this.isScrollPhysics = false,
      this.floatingActionLabel = const SizedBox(),
      this.shape,
      this.bottomNavBarEnabled = false,
      this.extendedIcon,
      this.backgroundVectorCurve = true,
      this.backgroundVectorWave = false,
      this.backgroundVectorCurveWeb = false,
      this.backgroundVectorWaveWeb = false,
      this.backgroundFitMob = true,
      this.drawer})
      : super(key: key);

  final Widget child;
  final bool? backgroundFitMob;

  final bool? isStatusBar;
  final bool? isLoading;
  final bool? isAppBar;
  final bool? backgroundVectorCurve;
  final bool? backgroundVectorCurveWeb;
  final bool? backgroundVectorWaveWeb;
  final bool? isScrollPhysics;
  final FloatingActionButtonLocation? floatingActionButtonLocation;
  final FloatingActionButton? floatingActionButton;
  final bool? toolBarShowSearch;
  final String? toolBarTitleString;
  final TextStyle? toolBarTitleStringStyle;
  final String? toolBarSubTitle;
  final bool? greenBackground;
  final bool? appBarCenterImage;
  final String? appBarImageString;
  final String? toolBarLabel;
  final String? toolBarCaptionText;
  final Widget leadingIcon;
  final Widget? trailingIcon;
  final Widget? trailingImage;
  final Function(dynamic)? leadingCallback;
  final Function()? trailingImageCallback;
  final int? toolBarNotificationCount;
  final IconEnum? toolBarIconEnum;
  final MenuIconEnum? toolBarActionMenuIconEnum;
  final TextEditingController? toolBarTextController;
  final double? toolBarTitleSpacing;
  final IconData? floatingIcon;
  final double? toolBarElevation;
  final Function(dynamic)? toolBarCallback;
  final Widget? bottomNavigationBar;
  final bool? bottomNavBarEnabled;
  final bool? resizeToAvoidBottomInset;
  final bool? backgroundVectorWave;
  final VoidCallback? onCallBack;
  final GlobalKey<ScaffoldState>? scaffoldKey;
  final Widget? floatingActionLabel;
  final BottomNavBarIcon? navBarIcon;
  final Widget? drawer;
  final OutlinedBorder? shape;
  final Widget? extendedIcon;

  @override
  CustomScaffoldWidgetState createState() => CustomScaffoldWidgetState();
}

class CustomScaffoldWidgetState extends State<FlutterScaffold> {
  @override
  Widget build(BuildContext context) {
    double height = kToolbarHeight;
    if (widget.toolBarSubTitle != null) {
      // ignore: unnecessary_statements
      height + kToolbarHeight;
    }
    return ScaffoldMessenger(
      key: widget.scaffoldKey,
      child: Stack(
        children: [
          Scaffold(
            floatingActionButton: widget.floatingActionButton,
            resizeToAvoidBottomInset: widget.resizeToAvoidBottomInset,
            // Set to true to resize the body to avoid bottom inset

            key: widget.scaffoldKey,
            backgroundColor: widget.greenBackground!
                ? const Color(0xff034703)
                : const Color(0xffFAFAFA),
            // backgroundColor: AppColors().colorPrimary,
            drawer: widget.drawer,
            appBar: widget.isAppBar!
                ? PreferredSize(
                    preferredSize: Size(double.infinity, sizedBoxHeight()),
                    child: FlutterAppbar(
                      toolBarTitleStringStyle: widget.toolBarTitleStringStyle,
                      appBarCenterImage: widget.appBarCenterImage,
                      appBarImageString: widget.appBarImageString,
                      toolBarTitleString: widget.toolBarTitleString,
                      toolBarActionMenuIconEnum:
                          widget.toolBarActionMenuIconEnum,
                      toolBarCaptionText: widget.toolBarCaptionText,
                      toolBarElevation: widget.toolBarElevation,
                      toolBarIconEnum: widget.toolBarIconEnum,
                      toolBarNotificationCount: widget.toolBarNotificationCount,
                      toolBarShowSearch: widget.toolBarShowSearch,
                      toolBarTextController: widget.toolBarTextController,
                      toolBarTitleSpacing: widget.toolBarTitleSpacing,
                      trailingIcon: widget.trailingIcon,
                      trailingImage: widget.trailingImage,
                      leadingIcon: widget.leadingIcon,
                      leadingCallback: (value) {
                        widget.leadingCallback!(value);
                      },
                      callback: (value) {
                        widget.leadingCallback!(value);
                        widget.onCallBack;
                      },
                    ),
                    // callback: (value) => widget.onCallBack),
                  )
                : null,
            body: SingleChildScrollView(
                physics: widget.isScrollPhysics!
                    ? const ScrollPhysics()
                    : const NeverScrollableScrollPhysics(),
                child: widget.backgroundVectorCurve!
                    ? Stack(alignment: Alignment.center, children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width,
                          height: widget.backgroundFitMob!
                              ? MediaQuery.of(context).size.height / 1.5
                              : MediaQuery.of(context).size.height,
                          child: widget.backgroundFitMob!
                              ? !widget.backgroundVectorWave!
                                  ? Image.asset(
                                      AppDrawable().backgroundVectorCurve,
                                      fit: BoxFit.fill)
                                  : Image.asset(
                                      AppDrawable().backgroundVectorWave,
                                    )
                              : !widget.backgroundVectorWave!
                                  ? Image.asset(
                                      AppDrawable().backgroundVectorCurveWeb,
                                      fit: BoxFit.fill,
                                    )
                                  : Image.asset(
                                      AppDrawable().backgroundVectorWaveWeb,
                                      fit: BoxFit.fill,
                                    ),
                        ),
                        widget.child
                      ])
                    : widget.child),

            bottomNavigationBar: widget.bottomNavBarEnabled!
                ? CustomBottomNavBar(
                    onItemTapped: (index) {
                      _getSelectedIndex(widget.navBarIcon!);
                    },
                    selectedIndex: _getSelectedIndex(widget.navBarIcon!),
                  )
                : widget.bottomNavigationBar,
          ),
          if (widget.isLoading!)
            Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              alignment: Alignment.center,
              color: Colors.black54,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Container(
                      margin: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                      child: const LinearProgressIndicator()),
                ],
              ),
            ),
        ],
      ),
    );
  }

  double sizedBoxHeight() {
    return widget.toolBarSubTitle != null
        ? kToolbarHeight + kToolbarHeight
        : kToolbarHeight;
  }

  int _getSelectedIndex(BottomNavBarIcon icon) {
    switch (icon) {
      case BottomNavBarIcon.selorg:
        return 0;
      case BottomNavBarIcon.categories:
        return 1;

      case BottomNavBarIcon.cart:
        return 2;
      default:
        return 0;
    }
  }
}

enum BottomNavBarIcon { selorg, categories, cart }
