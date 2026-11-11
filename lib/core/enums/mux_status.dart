import 'package:freezed_annotation/freezed_annotation.dart';

/// Mux processing status from the backend [MuxStatus] enum.
enum MuxStatus {
  /// Waiting for upload.
  @JsonValue('WAITING_UPLOAD')
  waitingUpload,

  /// Asset is preparing.
  @JsonValue('PREPARING')
  preparing,

  /// Ready for playback.
  @JsonValue('READY')
  ready,

  /// Mux reported an error.
  @JsonValue('ERRORED')
  errored,
}
