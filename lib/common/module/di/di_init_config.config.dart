// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:test_synapsisid/modul/home_page/data/datasources/user_local_datasource.dart'
    as _i11;
import 'package:test_synapsisid/modul/home_page/domain/usecases/get_user_info_usecase.dart'
    as _i12;
import 'package:test_synapsisid/modul/home_page/domain/usecases/login_user_biometrics_usecase.dart'
    as _i13;
import 'package:test_synapsisid/modul/home_page/domain/usecases/login_user_nfc_usecase.dart'
    as _i14;
import 'package:test_synapsisid/modul/home_page/domain/usecases/login_user_qr_usecase.dart'
    as _i15;
import 'package:test_synapsisid/modul/login/data/repositories/login_repositories_impl.dart'
    as _i4;
import 'package:test_synapsisid/modul/login/data/repositories/register_repository_impl.dart'
    as _i9;
import 'package:test_synapsisid/modul/login/domain/repositories/login_repositories.dart'
    as _i3;
import 'package:test_synapsisid/modul/login/domain/repositories/register_repositories.dart'
    as _i8;
import 'package:test_synapsisid/modul/login/domain/usecases/login_usecase.dart'
    as _i5;
import 'package:test_synapsisid/modul/login/domain/usecases/logout_local_usecase.dart'
    as _i6;
import 'package:test_synapsisid/modul/login/domain/usecases/logout_usecase.dart'
    as _i7;
import 'package:test_synapsisid/modul/login/domain/usecases/register_usecase.dart'
    as _i10;
import 'package:test_synapsisid/modul/login/presentations/login_bloc/login_bloc.dart'
    as _i17;
import 'package:test_synapsisid/modul/login/presentations/register_bloc/register_bloc.dart'
    as _i16;

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// initializes the registration of main-scope dependencies inside of GetIt
_i1.GetIt $initGetIt(
  _i1.GetIt getIt, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) {
  final gh = _i2.GetItHelper(
    getIt,
    environment,
    environmentFilter,
  );
  gh.lazySingleton<_i3.LoginRepository>(() => _i4.LoginRepositoryImp());
  gh.lazySingleton<_i5.LoginUsecase>(
      () => _i5.LoginUsecase(gh<_i3.LoginRepository>()));
  gh.lazySingleton<_i6.LogoutLocalUsecase>(
      () => _i6.LogoutLocalUsecase(gh<_i3.LoginRepository>()));
  gh.lazySingleton<_i7.LogoutUsecase>(
      () => _i7.LogoutUsecase(gh<_i3.LoginRepository>()));
  gh.lazySingleton<_i8.RegisterRepository>(() => _i9.RegisterRepositoryImpl());
  gh.lazySingleton<_i10.RegisterUsecase>(
      () => _i10.RegisterUsecase(gh<_i8.RegisterRepository>()));
  gh.lazySingleton<_i11.UserLocalDatasource>(
      () => _i11.UserLocalDatasourceImpl());
  gh.lazySingleton<_i12.GetUserInfoLogin>(
      () => _i12.GetUserInfoLogin(gh<_i11.UserLocalDatasource>()));
  gh.lazySingleton<_i13.LoginUserBiometricsUsecase>(
      () => _i13.LoginUserBiometricsUsecase(gh<_i11.UserLocalDatasource>()));
  gh.lazySingleton<_i14.LoginUserNFCUsecase>(
      () => _i14.LoginUserNFCUsecase(gh<_i11.UserLocalDatasource>()));
  gh.lazySingleton<_i15.LoginUserQRUsecase>(
      () => _i15.LoginUserQRUsecase(gh<_i11.UserLocalDatasource>()));
  gh.factory<_i16.RegisterBloc>(
      () => _i16.RegisterBloc(gh<_i10.RegisterUsecase>()));
  gh.factory<_i17.LoginBloc>(() => _i17.LoginBloc(
        gh<_i5.LoginUsecase>(),
        gh<_i7.LogoutUsecase>(),
        gh<_i14.LoginUserNFCUsecase>(),
        gh<_i13.LoginUserBiometricsUsecase>(),
        gh<_i15.LoginUserQRUsecase>(),
        gh<_i12.GetUserInfoLogin>(),
        gh<_i6.LogoutLocalUsecase>(),
      ));
  return getIt;
}
