import 'dart:developer';

import 'package:injectable/injectable.dart';

import 'base/base_provider.dart';
import '../service/category/category_service.dart';
import '../../utils/helper/error_manager.dart';

@lazySingleton
class CategoryProvider extends BaseProvider {
  final CategoryService _categoryService;
  final ErrorManager _errorManager;

  CategoryProvider(
    this._categoryService,
    this._errorManager,
  );

  Future<bool> getCategory() async {
    try {
      setViewBusy();
      final category = await _categoryService.getCategory();

      log(category.toString(), name: 'Category');
      return true;
    } catch (e, s) {
      _errorManager.analyticsLog(
        name: 'Category',
        e: e,
        s: s,
      );
    }finally{
      setViewIdeal();
    }
    return false;
  }
}
