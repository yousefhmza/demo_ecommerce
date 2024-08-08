import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:universal_io/io.dart';

abstract class BasePlatformWidget<A extends Widget, I extends Widget> extends StatelessWidget {
  const BasePlatformWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Platform.isAndroid || kIsWeb ? createMaterialWidget(context) : createCupertinoWidget(context);
  }

  A createMaterialWidget(BuildContext context);

  I createCupertinoWidget(BuildContext context);
}
