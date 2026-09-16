import 'package:enterprise_core/enterprise_core.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:yogasala_plus_mobile/features/auth/domain/entities/auth_user.dart';
import 'package:yogasala_plus_mobile/features/profile/domain/entities/user_yoga_sala_plus.dart';

part 'app_director_event.dart';
part 'app_director_state.dart';

/// The bloc for the app director feature.
/// It uses the [AppDirectorState] and [AppDirectorEvent] classes to manage the
/// state and events.
@lazySingleton
class AppDirectorBloc extends Bloc<AppDirectorEvent, AppDirectorState> {
  AppDirectorBloc() : super(AppDirectorState.initial());
}
