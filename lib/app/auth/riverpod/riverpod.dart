import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../data/repository/old_auth_repository.dart';

enum PhoneAuthState { initial, phoneNotFound, phoneNotCorrect, smsSended }

final phoneAuthProvider =
    StateNotifierProvider<PhoneAuthNotifier, PhoneAuthState>(
        (ref) => PhoneAuthNotifier());

class PhoneAuthNotifier extends StateNotifier<PhoneAuthState> {
  PhoneAuthNotifier() : super(PhoneAuthState.initial);

  void sendSMS({required String phone}) async {
    if (phone.length != 10) {
      state = PhoneAuthState.phoneNotCorrect;
    } else {
      final repository = OldAuthRepository();
      final result = await repository.sendSMS(phone: phone);
      if (result == true) {
        state = PhoneAuthState.smsSended;
      } else {
        state = PhoneAuthState.phoneNotFound;
      }
    }
  }
}

enum PincodeAuthState { initial, pincodeCorrect, pincodeNotCorrect }

class PincodeAuthNotifier extends StateNotifier<PincodeAuthState> {
  PincodeAuthNotifier() : super(PincodeAuthState.initial);

  void validatePincode({required String phone, required String pincode}) async {
    // final response = await OldAuthRepository()
    //     .validatePincode(phone: phone, pincode: pincode);
  }
}
