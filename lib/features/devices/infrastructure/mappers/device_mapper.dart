import 'package:guardian_area/features/devices/domain/entities/device.dart';

class DeviceMapper {
  static Device fromJson(Map<String, dynamic> json) {
    return Device(
      guardianAreaDeviceRecordId: json['guardianAreaDeviceRecordId'] ?? '',
      nickname: json['nickname'] == '-' || json['nickname'] == null
          ? 'New Device'
          : json['nickname'],
      bearer: json['bearer'] ?? '',
      careMode: json['careMode'] ?? 'Not Configured',
      status: json['status'] ?? '',
      userId: json['userId'].toString(),
      apiKey: json['apiKey'] ?? '',
    );
  }

  static Map<String, dynamic> toJson(Device device) {
    return {
      'guardianAreaDeviceRecordId': device.guardianAreaDeviceRecordId,
      'nickname': device.nickname,
      'bearer': device.bearer,
      'careMode': device.careMode,
      'status': device.status,
      'userId': device.userId,
      'apiKey': device.apiKey,
    };
  }
}
