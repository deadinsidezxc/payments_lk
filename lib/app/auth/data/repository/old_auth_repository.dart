import '../ds/old_auth_ds.dart';
import '../model/validate_response/validate_response.dart';

class OldAuthRepository implements IAuthRepository {
  final _apiDS = OldAuthDS();

  @override
  Future<bool> sendSMS({required String phone}) async {
    return await _apiDS
        .sendSMS(phone: phone)
        .catchError((error) => Future.value(false));
  }

  @override
  Future<ValidateResponse> validatePincode(
          {required String phone, required String pincode}) async =>
      ValidateResponse.fromJson(
        await _apiDS.validatePincode(phone: phone, pincode: pincode),
      );
}

abstract class IAuthRepository {
  Future<bool> sendSMS({required String phone});
  Future<ValidateResponse> validatePincode(
      {required String phone, required String pincode});
}
