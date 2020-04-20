import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ResponsiveLayout {
  final BuildContext _context;
  double _defaultScreenWidth = 400.0;
  double _defaultScreenHeight = 810.0;

  ResponsiveLayout(this._context);

  responsiveSettings() {
    ScreenUtil.init(_context,
        width: _defaultScreenWidth,
        height: _defaultScreenHeight,
        allowFontScaling: true);
  }
}
