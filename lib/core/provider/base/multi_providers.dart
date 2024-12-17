import 'package:jus/core/provider/auth_provider.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

import '../../injection/injection.dart';

abstract class MultiProviders {
  static final List<SingleChildWidget> providers = [
    ChangeNotifierProvider(
      create: (context) => locator<AuthProvider>(),
    )
  ];
}