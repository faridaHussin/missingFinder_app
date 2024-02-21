import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../domain/use_case/register_use_case.dart';
import 'Reconfirm_States.dart';

class ReconfirmScreenViewModel extends Cubit<ReconfirmStates> {
  ReconfirmAccountUseCase reconfirmAccountUseCase;

  ReconfirmScreenViewModel({required this.reconfirmAccountUseCase})
      : super(ReconfirmInitialStates());
  var forKey = GlobalKey<FormState>();

  TextEditingController pinCodeTextField = TextEditingController();

// void reconfirmAccount() async {
//   if (forKey.currentState?.validate() == true) {
//     emit(ReconfirmLoadingStates(LoadingMessage: 'Loading'));
//     print("reconfirm");
//     var either = await reconfirmAccountUseCase.invoke();
//     either.fold(
//         (error) => {
//               emit(ReconfirmErrorStates(Message: error.errorMessage)),
//             },
//         (response) => {
//               emit(ReconfirmSuccessStates(reconfirmResponseEntity: response)),
//             });
//   }
// }
}
