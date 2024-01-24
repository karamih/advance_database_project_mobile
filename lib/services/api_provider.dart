import 'package:advance_db_class_mobile/models/branch_model.dart';
import 'package:advance_db_class_mobile/models/menu_model.dart';
import 'package:dio/dio.dart';

class ApiProvider {
  final Dio dio = Dio();

  Future<List<BranchModel>> getBranches(Map<String, dynamic> data) async {
    List<BranchModel> model = [];
    dio.options =
        BaseOptions(receiveTimeout: const Duration(milliseconds: 5000));
    var response = await dio.get('http://192.168.238.20:8000/mobile/branches',
        queryParameters: data);
    for (Map<String, dynamic> item in response.data) {
      model.add(BranchModel.fromJson(item));
    }
    return model;
  }

  Future<List<MenuModel>> getMenu(Map<String, dynamic> data) async {
    List<MenuModel> model = [];
    dio.options =
        BaseOptions(receiveTimeout: const Duration(milliseconds: 5000));
    var response = await dio.get('http://192.168.238.20:8000/mobile/branches-menu',
        queryParameters: data);
    for (Map<String, dynamic> item in response.data) {
      model.add(MenuModel.fromJson(item));
    }
    return model;
  }
}
