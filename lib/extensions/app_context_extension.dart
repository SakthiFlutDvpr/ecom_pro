import 'package:flutter/cupertino.dart';

import '../resources/resources.dart';

extension AppContext on BuildContext {
  Resources get resources => Resources.of(this);
}
