import 'package:injectable/injectable.dart';
import 'package:yogasala_plus_mobile/features/series/data/models/serie_page_response_model.dart';
import 'package:yogasala_plus_mobile/features/teachers/data/api/teachers_api_client.dart';
import 'package:yogasala_plus_mobile/features/teachers/data/datasources/teachers_remote_data_source.dart';
import 'package:yogasala_plus_mobile/features/teachers/data/models/teacher_model.dart';
import 'package:yogasala_plus_mobile/features/teachers/data/models/teacher_page_response_model.dart';

/// Implementation of [TeachersRemoteDataSource].
@LazySingleton(as: TeachersRemoteDataSource)
class TeachersRemoteDataSourceImpl implements TeachersRemoteDataSource {
  /// Creates a [TeachersRemoteDataSourceImpl].
  TeachersRemoteDataSourceImpl(this._apiClient);

  final TeachersApiClient _apiClient;

  @override
  Future<TeacherPageResponseModel> getTeachers({
    int page = 0,
    int size = 20,
  }) async {
    final response = await _apiClient.getTeachers(page: page, size: size);
    return response.data;
  }

  @override
  Future<TeacherModel> getTeacherById(int id) async {
    final response = await _apiClient.getTeacherById(id: id);
    return response.data;
  }

  @override
  Future<SeriePageResponseModel> getTeacherSeries({
    required int id,
    int page = 0,
    int size = 20,
  }) async {
    final response = await _apiClient.getTeacherSeries(
      id: id,
      page: page,
      size: size,
    );
    return response.data;
  }
}
