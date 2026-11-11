part of 'profile_bloc.dart';

/// Events for [ProfileBloc].
@freezed
abstract class ProfileEvent with _$ProfileEvent {
  const ProfileEvent._();

  /// Load the current user profile.
  const factory ProfileEvent.fetched() = _EventFetched;
}
