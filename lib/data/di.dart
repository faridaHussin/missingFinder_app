import 'package:missing_finder1/data/api/api_manager.dart';
import 'package:missing_finder1/data/repository/data_source/auth_remote_date_source_impl.dart';
import 'package:missing_finder1/data/repository/repository/auth_repository_impl.dart';
import 'package:missing_finder1/domain/repository/data_sources/auth_remote_data_source.dart';
import 'package:missing_finder1/domain/repository/repository/auth_repository.dart';
import 'package:missing_finder1/domain/use_case/register_use_case.dart';

ReconfirmAccountUseCase injectReconfirmAccountUseCase() {
  return ReconfirmAccountUseCase(authRepository: injectAuthRepository());
}

ActivateAccountUseCase injectActivateAccountUseCase() {
  return ActivateAccountUseCase(authRepository: injectAuthRepository());
}

RegisterUseCase injectRegisterUseCase() {
  return RegisterUseCase(authRepository: injectAuthRepository());
}

AuthRepository injectAuthRepository() {
  return AuthRepositoryImpl(remoteDataSource: injectRemoteDataSource());
}

AuthRemoteDataSource injectRemoteDataSource() {
  return AuthRemoteDataSourceImpl(apiManager: ApiManager.getInstance());
}

