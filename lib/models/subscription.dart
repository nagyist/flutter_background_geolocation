part of '../flutter_background_geolocation.dart';

class Subscription {
  final Future<void> Function() _onRemove;

  Subscription._(this._onRemove);

  Future<void> remove() => _onRemove();
}
