// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:stacked_services/stacked_services.dart';

import '_services/apiService.dart';
import '_services/connectivityService.dart';
import '_services/coreServices.dart';
import '_services/fcmService.dart';
import '_services/messagesService.dart';
import '_services/userService.dart';
import '_services/utilsService.dart';

/// adds generated dependencies
/// to the provided [GetIt] instance

GetIt $initGetIt(
  GetIt get, {
  String environment,
  EnvironmentFilter environmentFilter,
}) {
  final gh = GetItHelper(get, environment, environmentFilter);
  final coreServices = _$CoreServices();
  gh.lazySingleton<ApiService>(() => ApiService());
  gh.lazySingleton<ConnectivityService>(() => ConnectivityService());
  gh.lazySingleton<DialogService>(() => coreServices.dialogService);
  gh.lazySingleton<FcmService>(() => FcmService());
  gh.lazySingleton<MessagesService>(() => MessagesService());
  gh.lazySingleton<NavigationService>(() => coreServices.navigationService);
  gh.lazySingleton<SnackbarService>(() => coreServices.snackBarService);
  gh.lazySingleton<UserService>(() => UserService());
  gh.lazySingleton<UtilsService>(() => UtilsService());
  return get;
}

class _$CoreServices extends CoreServices {
  @override
  DialogService get dialogService => DialogService();
  @override
  NavigationService get navigationService => NavigationService();
  @override
  SnackbarService get snackBarService => SnackbarService();
}
