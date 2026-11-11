// Retrofit’s own examples often hide Dio’s Headers so it doesn’t clash with
// Retrofit’s own Headers.
import 'package:dio/dio.dart' hide Headers;
import 'package:enterprise_network/enterprise_network.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';
import 'package:yogasala_plus_mobile/features/series/data/models/serie_page_response_model.dart';
import 'package:yogasala_plus_mobile/features/teachers/data/api/teachers_endpoints.dart';
import 'package:yogasala_plus_mobile/features/teachers/data/models/teacher_model.dart';
import 'package:yogasala_plus_mobile/features/teachers/data/models/teacher_page_response_model.dart';

part 'teachers_api_client.g.dart';

/// Teachers API client (authenticated mobile user).
@lazySingleton
@RestApi()
abstract class TeachersApiClient {
  /// Factory method for the implementation.
  @factoryMethod
  factory TeachersApiClient(DioClient dioClient) =>
      _TeachersApiClient(dioClient.dio);

  /// Paginated enabled teachers.
  @GET(TeachersEndpoints.teachers)
  @Extra({NetworkConstants.forceRefreshExtraKey: true})
  Future<HttpResponse<TeacherPageResponseModel>> getTeachers({
    @Query('page') int page = 0,
    @Query('size') int size = 20,
  });

  /// Single enabled teacher by id.
  @GET(TeachersEndpoints.teacherById)
  @Extra({NetworkConstants.forceRefreshExtraKey: true})
  Future<HttpResponse<TeacherModel>> getTeacherById({
    @Path('id') required int id,
  });

  /// Paginated enabled series for a teacher (newest first).
  @GET(TeachersEndpoints.teacherSeries)
  @Extra({NetworkConstants.forceRefreshExtraKey: true})
  Future<HttpResponse<SeriePageResponseModel>> getTeacherSeries({
    @Path('id') required int id,
    @Query('page') int page = 0,
    @Query('size') int size = 20,
  });
}
