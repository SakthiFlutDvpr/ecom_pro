import 'package:flutter/material.dart';


import '../../utils/snackbar/custom_snack_bar.dart';
import '../../utils/snackbar/top_snack_bar.dart';

/// Base class of the CoreWidget's stateful widget class
abstract class CoreWidgets extends StatefulWidget {
  /// base class constructor of CoreWidget's stateful widget class
  const CoreWidgets({Key? key}) : super(key: key);
}

/// Base class of the CoreWidget's state class
// class CoreWidgetsState extends State<CoreWidgets> {
class CoreWidgetsState<T> extends State<CoreWidgets> {

  void hidTheKeyBoard() {
    FocusManager.instance.primaryFocus?.unfocus();
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(),
    );
  }

  showSnackBar({SnackBarType? type = SnackBarType.success, required String value}) {
    showTopSnackBar(
      Overlay.of(context),
      type == SnackBarType.success
          ? CustomSnackBar.success(
        message: value,
      )
          : type == SnackBarType.info
          ? CustomSnackBar.info(
        message: value,
      )
          : CustomSnackBar.error(
        message: value,
      ),
    );
  }
}

enum SnackBarType { success, fail, info }
