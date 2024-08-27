import 'package:flutter/cupertino.dart';

import '../multilingual/language.dart';
import 'colors/app_colors.dart';
import 'drawable/app_drawable.dart';

class Resources {
  final BuildContext _context;

  Resources(this._context);

  Languages? get strings {
    return Localizations.of<Languages>(_context, Languages);
  }

  AppColors get color {
    return AppColors();
  }



  AppDrawable get drawable {
    return AppDrawable();
  }

  static Resources of(BuildContext context) {
    return Resources(context);
  }
}
