// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../../features/auth/data/data_sources/remote_data_source/auth_remote_data_source_impl.dart'
    as _i689;
import '../../features/auth/data/repositories/auth_repository_impl.dart'
    as _i153;
import '../../features/auth/domain/repositories/data_source/remote_data_source/auth_remote_data_source.dart'
    as _i849;
import '../../features/auth/domain/repositories/repository/auth_repository.dart'
    as _i154;
import '../../features/auth/domain/use_cases/active_reset_password_usecase.dart'
    as _i924;
import '../../features/auth/domain/use_cases/login_usecase.dart' as _i1012;
import '../../features/auth/domain/use_cases/new_password_usecase.dart'
    as _i358;
import '../../features/auth/domain/use_cases/register_usecase.dart' as _i957;
import '../../features/auth/domain/use_cases/send_password_email.dart'
    as _i1043;
import '../../features/auth/presentation/manager/auth_cubit.dart' as _i888;
import '../../features/main_layout/data/data_sources/main_layout_remote_data_source_impl/main_layout_remote_data_source_impl.dart'
    as _i779;
import '../../features/main_layout/data/repositories/main_layout_repository_impl.dart'
    as _i241;
import '../../features/main_layout/domain/repositories/data_source/main_layout_remote_data_source/main_layout_remote_data_source.dart'
    as _i585;
import '../../features/main_layout/domain/repositories/repository/main_layout_repository.dart'
    as _i815;
import '../../features/main_layout/domain/use_cases/main_layout_use_case.dart'
    as _i320;
import '../../features/main_layout/presentation/manager/main_layout_cubit.dart'
    as _i500;
import '../api/api_manager.dart' as _i1047;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    gh.singleton<_i1047.ApiManager>(() => _i1047.ApiManager());
    gh.factory<_i500.MainLayoutCubit>(
      () => _i500.MainLayoutCubit(
        mainLayoutUseCase: gh<_i320.MainLayoutUseCase>(),
      ),
    );
    gh.factory<_i849.AuthRemoteDataSource>(
      () => _i689.AuthRemoteDataSourceImpl(apiManager: gh<_i1047.ApiManager>()),
    );
    gh.factory<_i585.MainLayoutRemoteDateSource>(
      () => _i779.MainLayoutRemoteDataSourceImpl(
        apiManager: gh<_i1047.ApiManager>(),
      ),
    );
    gh.factory<_i154.AuthRepository>(
      () => _i153.AuthRepositoryImpl(
        authRemoteDataSource: gh<_i849.AuthRemoteDataSource>(),
      ),
    );
    gh.factory<_i815.MainLayoutRepository>(
      () => _i241.MainLayoutRepositoryImpl(
        mainLayoutRemoteDateSource: gh<_i585.MainLayoutRemoteDateSource>(),
      ),
    );
    gh.factory<_i320.MainLayoutUseCase>(
      () => _i320.MainLayoutUseCase(
        mainLayoutRepository: gh<_i815.MainLayoutRepository>(),
      ),
    );
    gh.factory<_i358.NewPasswordUseCase>(
      () =>
          _i358.NewPasswordUseCase(authRepository: gh<_i154.AuthRepository>()),
    );
    gh.factory<_i957.RegisterUseCase>(
      () => _i957.RegisterUseCase(authRepository: gh<_i154.AuthRepository>()),
    );
    gh.factory<_i1012.LoginUseCase>(
      () => _i1012.LoginUseCase(authRepository: gh<_i154.AuthRepository>()),
    );
    gh.factory<_i1043.SendPasswordEmailUseCase>(
      () => _i1043.SendPasswordEmailUseCase(
        authRepository: gh<_i154.AuthRepository>(),
      ),
    );
    gh.factory<_i924.ActiveResetPasswordUseCase>(
      () => _i924.ActiveResetPasswordUseCase(
        authRepository: gh<_i154.AuthRepository>(),
      ),
    );
    gh.factory<_i888.AuthCubit>(
      () => _i888.AuthCubit(
        registerUseCase: gh<_i957.RegisterUseCase>(),
        loginUseCase: gh<_i1012.LoginUseCase>(),
        sendPasswordEmailUseCase: gh<_i1043.SendPasswordEmailUseCase>(),
        activeResetPasswordUseCase: gh<_i924.ActiveResetPasswordUseCase>(),
        newPasswordUseCase: gh<_i358.NewPasswordUseCase>(),
      ),
    );
    return this;
  }
}
