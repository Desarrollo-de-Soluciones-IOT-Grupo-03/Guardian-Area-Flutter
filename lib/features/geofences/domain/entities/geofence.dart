class Geofence {
  final int id;
  final String name;
  final String geoFenceStatus;
  final List<Coordinate> coordinates;
  final String guardianAreaDeviceRecordId;

  Geofence({
    required this.id,
    required this.name,
    required this.geoFenceStatus,
    required this.coordinates,
    required this.guardianAreaDeviceRecordId,
  });
  
  Geofence copyWith({
    int? id,
    String? name,
    String? geoFenceStatus,
    List<Coordinate>? coordinates,
    String? guardianAreaDeviceRecordId,
  }) {
    return Geofence(
      id: id ?? this.id,
      name: name ?? this.name,
      geoFenceStatus: geoFenceStatus ?? this.geoFenceStatus,
      coordinates: coordinates ?? List.from(this.coordinates),
      guardianAreaDeviceRecordId:
          guardianAreaDeviceRecordId ?? this.guardianAreaDeviceRecordId,
    );
  }
}

class Coordinate {
  final double latitude;
  final double longitude;

  Coordinate({required this.latitude, required this.longitude});
}
