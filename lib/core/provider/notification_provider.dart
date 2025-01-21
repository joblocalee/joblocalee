import 'package:injectable/injectable.dart';

import 'base/base_provider.dart';

@injectable
class NotificationProvider extends BaseProvider{

  NotificationProvider();

  Future<bool> getNotification() async {
    try {
      setViewBusy();
      return true;
    }catch (e) {

    }finally {
      setViewIdeal();
    }
    return false;
  }
}