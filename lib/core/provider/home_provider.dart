import 'package:injectable/injectable.dart';

import '../model/vacancy/vacancy_model.dart';
import '../../utils/helper/error_manager.dart';
import '../model/category/category_model.dart';
import '../service/home/home_service.dart';
import 'base/base_provider.dart';

@injectable
class HomeProvider extends BaseProvider {
  final ErrorManager _errorManager;
  final HomeService _homeService;

  HomeProvider(
    this._errorManager,
    this._homeService,
  );

  List<CategoryModel> _categories = [];
  List<VacancyModel> _vacancies = [];

  List<CategoryModel> get categories => _categories;
  List<VacancyModel> get vacancies => _vacancies;

  Future<bool> getHome() async {
    try {
      setViewBusy();
      final result = await _homeService.getHome();
      _categories = result.category;
      _vacancies = result.vacancy;
      return true;
    } catch (e, s) {
      _errorManager.analyticsLog(name: 'Get Home', e: e, s: s);
    } finally {
      setViewIdeal();
    }
    return false;
  }
}
