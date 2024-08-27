import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

// ignore: must_be_immutable
class FlutterAppbar extends AppBar implements PreferredSizeWidget {
  final bool? toolBarShowSearch;

  final bool? toolbarIsSearchBoarder;
  final bool? appBarCenterImage;
  late final String? toolBarTitleString;
  final String? toolBarCaptionText;
  final String? appBarImageString;
  final int? toolBarNotificationCount;
  final IconEnum? toolBarIconEnum;
  final Widget? leadingIcon;
  final Widget? trailingIcon;
  final Widget? trailingImage;
  final TextStyle? toolBarTitleStringStyle;
  final MenuIconEnum? toolBarActionMenuIconEnum;
  TextEditingController? toolBarTextController = TextEditingController();
  final double? toolBarTitleSpacing;
  final double? toolBarElevation;
  final Function(dynamic)? callback;
  final bool? isBottomLine;
  Function(dynamic)? leadingCallback;
  final double? leadPadding;

  FlutterAppbar(
      {Key? key,
      this.toolBarTitleString,
      this.toolBarCaptionText,
      this.appBarImageString,
      this.appBarCenterImage,
      this.toolBarElevation = 0.0,
      this.toolBarIconEnum = IconEnum.empty,
      this.toolBarActionMenuIconEnum,
      this.toolBarTitleStringStyle,
      this.leadingIcon = const Icon(
        Icons.keyboard_arrow_left,
        size: 24,
        color: Colors.white,
      ),
      this.trailingImage,
      this.trailingIcon,
      this.toolBarShowSearch = false,
      this.toolbarIsSearchBoarder,
      this.toolBarNotificationCount = 0,
      this.toolBarTitleSpacing,
      this.toolBarTextController,
      this.callback,
      this.isBottomLine = true,
      this.leadingCallback,
      this.leadPadding})
      : super(key: key);

  @override
  FlutterAppbarState createState() => FlutterAppbarState();

  @override
  Size get preferredSize => throw UnimplementedError();
}

class FlutterAppbarState extends State<FlutterAppbar> {
  bool showCancel = false;
  bool showSearch = false;
  bool? mobile;
  bool? desk;
  bool? tab;

  @override
  void initState() {
    super.initState();
  }

  void updateTitle(String? titleString) {
    debugPrint('Title string $titleString');
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    mobile = size.width <= 650;
    tab = size.width > 650 && size.width <= 1100;
    desk = size.width > 1100;
    return AppBar(
      primary: true,
      elevation: 0,

      // widget.toolBarElevation,
      titleSpacing: widget.toolBarTitleSpacing ?? 0,
      //centerTitle: true,
      bottom: widget.isBottomLine!
          ? PreferredSize(
              preferredSize: const Size.fromHeight(4.0),
              child: SizedBox(
                height: 0.65,
                child: Container(
                    // decoration: const BoxDecoration(
                    //     gradient: LinearGradient(
                    //         colors: [Colors.black, Colors.white, Colors.black],
                    //         begin: Alignment.centerLeft,
                    //         end: Alignment.centerRight)),
                    ),
              ),
            )
          : null,
      // shadowColor: Colors.red,
      // surfaceTintColor: Colors.red,
      // foregroundColor: Colors.red,
      //automaticallyImplyLeading: true,
      // scrolledUnderElevation: 2,
      centerTitle: true,
      title: widget.toolBarTitleString != null &&
              widget.toolBarTitleString != ''
          ? Text(
              widget.toolBarTitleString!,
              style: widget.toolBarTitleStringStyle ??
                  Theme.of(context).textTheme.headlineLarge!.copyWith(
                      fontWeight: FontWeight.bold,
                      fontSize: 18.5,
                      color: Colors.white
                      //     color: AppColors().colorPrimaryText
                      ),
            )
          : widget.appBarCenterImage!
              ? Container(
                  width: MediaQuery.of(context).size.width / 2.5,
                  height: MediaQuery.of(context).size.height / 2,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image:
                              AssetImage(widget.appBarImageString.toString()))),
                )
              : const SizedBox(),
      actions: <Widget>[
        widget.trailingIcon != null
            ? widget.trailingIcon!
            : widget.trailingImage != null
                ? widget.trailingIcon!
                : const SizedBox()
      ],

      leading: Padding(
        padding: EdgeInsets.only(left: mobile! ? 0.03.sw : 0.09.sw),
        child: leadingIcon(context),
      ),

      backgroundColor: const Color(0xff034703),
      // backgroundColor: AppColors().colorPrimary,
    );
  }

  Widget? leadingIcon(BuildContext context) {
    Widget? leadingView = const SizedBox();
    if (widget.toolBarIconEnum == IconEnum.back) {
      leadingView = GestureDetector(
          // onTap: widget.callback!(widget.toolBarIconEnum),
          onTap: () {
            debugPrint('pop');
            GoRouter.of(context).pop();
          },
          child: widget.toolBarIconEnum!.icons);
    }
    return leadingView;
  }

  /// old code for appbar trailing Icon.
// Widget trailing(BuildContext context) {
//   Widget trailingView = const SizedBox();
//   if (widget.toolBarActionMenuIconEnum != MenuIconEnum.empty) {
//     trailingView = GestureDetector(
//       child: Container(
//           padding: const EdgeInsets.symmetric(horizontal: 10),
//           child: widget.toolBarActionMenuIconEnum!.icons),
//       onTap: () => widget.leadingCallback!(widget.toolBarActionMenuIconEnum),
//     );
//   }
//   return trailingView;
// }
}

enum IconEnum { close, back, menu, empty, mainMenu }

enum MenuIconEnum {
  download,
  add,
  setting,
  notification,
  empty,
  refresh,
  menu,
  filter,
  share,
  search
}

extension IconExtension on IconEnum {
  Widget get icons {
    switch (this) {
      case IconEnum.close:
        return const Icon(
          Icons.close,
          size: 18,
        );
      case IconEnum.back:
        return const Icon(
          Icons.arrow_back_ios_new,
          size: 16,
          color: Colors.white,
        );
      case IconEnum.mainMenu:
        return const Icon(
          Icons.supervised_user_circle_outlined,
          size: 32,
        );
      case IconEnum.menu:
        return const Icon(
          Icons.menu,
        );
      case IconEnum.empty:
        return const SizedBox();
      default:
        return const SizedBox();
    }
  }

  String get iconsString {
    switch (this) {
      case IconEnum.close:
        return IconEnum.close.toString();
      case IconEnum.back:
        return IconEnum.back.toString();
      case IconEnum.menu:
        return IconEnum.menu.toString();
      case IconEnum.empty:
        return IconEnum.empty.toString();
      case IconEnum.mainMenu:
        return IconEnum.mainMenu.toString();
      default:
        return IconEnum.empty.toString();
    }
  }
}

extension MenuButtonExtension on MenuIconEnum {
  Widget get icons {
    switch (this) {
      case MenuIconEnum.setting:
        return const Icon(
          Icons.settings,
          // color: AppColors().colorPrimaryText,
          size: 28,
        );
      case MenuIconEnum.filter:
        return const Icon(
          Icons.filter_alt_outlined,
          // color: AppColors().colorPrimaryText,
          size: 28,
        );
      case MenuIconEnum.share:
        return const Icon(
          Icons.share,
          // color: AppColors().colorPrimaryText,
          size: 28,
        );
      case MenuIconEnum.menu:
        return const Icon(
          Icons.more_vert,
          color: Colors.white,
          size: 28,
        );
      case MenuIconEnum.download:
        return const Icon(
          Icons.download,
          // color: AppColors().colorPrimaryText,
          size: 28,
        );
      case MenuIconEnum.refresh:
        return const Icon(
          Icons.refresh,
          // color: AppColors().colorPrimaryText,
          size: 28,
        );
      case MenuIconEnum.add:
        return Container(
          padding: const EdgeInsets.all(5),
          child: const Icon(
            size: 28,
            Icons.add,
            // color: AppColors().colorPrimaryText,
          ),
        );
      case MenuIconEnum.notification:
        return const Icon(
          Icons.notifications,
          size: 28,
          // color: AppColors().colorPrimaryText,
        );
      case MenuIconEnum.search:
        return const Icon(
          Icons.search,
          size: 28,
        );
      default:
        return const SizedBox();
    }
  }
}

enum ButtonClickAction {
  mainMenu,
  add,
  notification,
  empty,
  caption,
  title,
  label,
  subTitle
}
