/// Helpers to compare installed app version/build against remote AppData.
abstract final class AppVersionComparator {
  /// Returns `true` when local version/build is older than remote.
  ///
  /// Prefers integer build comparison when both parse as ints; otherwise
  /// falls back to dotted semver-style version comparison.
  static bool isLocalOutdated({
    required String localVersion,
    required String localBuild,
    required String remoteVersion,
    required String remoteBuild,
  }) {
    final localBuildNum = int.tryParse(localBuild.trim());
    final remoteBuildNum = int.tryParse(remoteBuild.trim());
    if (localBuildNum != null && remoteBuildNum != null) {
      return localBuildNum < remoteBuildNum;
    }
    return compareSemver(localVersion, remoteVersion) < 0;
  }

  /// Compares dotted version strings (`1.2.3`).
  ///
  /// Returns negative if [a] < [b], zero if equal, positive if [a] > [b].
  static int compareSemver(String a, String b) {
    final aParts = _parseVersionParts(a);
    final bParts = _parseVersionParts(b);
    final length =
        aParts.length > bParts.length ? aParts.length : bParts.length;
    for (var i = 0; i < length; i++) {
      final aPart = i < aParts.length ? aParts[i] : 0;
      final bPart = i < bParts.length ? bParts[i] : 0;
      if (aPart != bPart) return aPart.compareTo(bPart);
    }
    return 0;
  }

  static List<int> _parseVersionParts(String version) {
    final core = version.trim().split(RegExp('[-+]')).first;
    if (core.isEmpty) return const [0];
    return core.split('.').map((part) {
      final match = RegExp(r'^\d+').firstMatch(part);
      return match == null ? 0 : int.parse(match.group(0)!);
    }).toList();
  }
}
