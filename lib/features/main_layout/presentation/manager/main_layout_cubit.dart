import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:markti/core/cache/secure_storage.dart';
import 'package:markti/features/main_layout/domain/entities/main_layout_response_entity.dart';
import 'package:meta/meta.dart';

import '../../../../core/failures/server_failure.dart';
import '../../domain/use_cases/main_layout_use_case.dart';

part 'main_layout_state.dart';

@injectable
class MainLayoutCubit extends Cubit<MainLayoutState> {
  MainLayoutCubit({this.mainLayoutUseCase}) : super(MainLayoutInitial());

  MainLayoutUseCase? mainLayoutUseCase;

  List<ListMainLayoutResponseEntity> productsList = [];

  Future<void> ToggleTheme(bool isDarkMode) async {
    await secureStorage.write(key: "isDarkMode", value: isDarkMode.toString());
    if (isDarkMode) {
      emit(toggleToDark());
    } else {
      emit(toggleToLight());
    }
  }

  void loadSavedTheme(bool isDarkMode) {
    if (isDarkMode) {
      emit(toggleToDark());
    } else {
      emit(toggleToLight());
    }
  }

  void getALlProducts() async {
    emit(getProductsLoading());
    var either = await mainLayoutUseCase!.invoke();
    either.fold((fail) {
      var error = fail as ServerFailure;
      emit(getProductsFailure(errorMessage: error.message!));
    }, (response) {
      print("response: $response");
      print("response.list: ${response.list}");

      if (response.list != null) {
        productsList = response.list!
            .whereType<ListMainLayoutResponseEntity>()
            .toList();
      } else {
        productsList = [];
      }

      emit(getProductsSuccess(mainLayoutResponseEntity: response));
    });
  }
}
