class ActivateAccountResponseEntity {
  ActivateAccountResponseEntity({
    this.success,
    this.message,
    this.error,
    this.stack,
    this.tokenActivateAccount,
  });

  bool? success;
  String? message;
  dynamic error;
  String? stack;
  String? tokenActivateAccount;
}
