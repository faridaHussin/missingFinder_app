

abstract class ReconfirmStates {}

class ReconfirmInitialStates extends ReconfirmStates {}

class ReconfirmLoadingStates extends ReconfirmStates {
  String? LoadingMessage;

  ReconfirmLoadingStates({this.LoadingMessage});
}

class ReconfirmErrorStates extends ReconfirmStates {
  String? Message;

  ReconfirmErrorStates({this.Message});
}

// class ReconfirmSuccessStates extends ReconfirmStates {
//   ReconfirmResponseEntity reconfirmResponseEntity;
//
//   ReconfirmSuccessStates({required this.reconfirmResponseEntity});
// }
