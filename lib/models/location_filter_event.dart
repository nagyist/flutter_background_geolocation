part of '../flutter_background_geolocation.dart';

/// Event object provided to [BackgroundGeolocation.onLocationFilter].
///
/// Fired __only__ when the tracking location-filter __rejects__ a location
/// sample (eg: horizontal accuracy worse than [trackingAccuracyThreshold]).
/// Rejected locations are __not__ delivered to [BackgroundGeolocation.onLocation],
/// so this event is the only way to observe and adapt to them.
///
/// ### Example
/// ```dart
/// BackgroundGeolocation.onLocationFilter((LocationFilterEvent event) {
///   print('[locationfilter] ${event.reason}, ${event.accuracy}, ${event.trackingAccuracyThreshold}');
/// });
/// ```
///
class LocationFilterEvent {
  /// The rejected [Location] (raw sample that failed the filter).
  ///
  final Location location;

  /// The reason the location was rejected.
  ///
  /// | Reason            |
  /// |-------------------|
  /// | `low-accuracy`    |
  /// | `implied-speed`   |
  /// | `outlier-capped`  |
  final String reason;

  /// Horizontal accuracy (meters) of the rejected sample.
  ///
  final double accuracy;

  /// Configured tracking-accuracy threshold (meters) in effect at rejection.
  ///
  final double trackingAccuracyThreshold;

  LocationFilterEvent(dynamic event)
      : location = Location(event['location']),
        reason = event['reason'],
        accuracy = (event['accuracy'] as num).toDouble(),
        trackingAccuracyThreshold =
            (event['trackingAccuracyThreshold'] as num).toDouble();

  /// String representation of object.
  String toString() {
    return "[LocationFilterEvent " +
        this.reason.toString() +
        " (accuracy: " +
        this.accuracy.toString() +
        ", threshold: " +
        this.trackingAccuracyThreshold.toString() +
        ")]";
  }

  /// Convert object to Map.
  Map<String, dynamic> toMap() {
    return {
      'location': location.map,
      'reason': reason,
      'accuracy': accuracy,
      'trackingAccuracyThreshold': trackingAccuracyThreshold
    };
  }
}
