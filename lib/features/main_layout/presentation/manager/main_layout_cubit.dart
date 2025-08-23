import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:markti/core/cache/secure_storage.dart';
import 'package:markti/features/main_layout/domain/entities/add_to_cart_response_entity.dart';
import 'package:markti/features/main_layout/domain/entities/brand_response_entity.dart';
import 'package:markti/features/main_layout/domain/entities/main_layout_response_entity.dart';
import 'package:markti/features/main_layout/domain/use_cases/add_to_cart_use_case.dart';
import 'package:markti/features/main_layout/domain/use_cases/brands_usecase.dart';
import 'package:markti/features/main_layout/domain/use_cases/category_use_case.dart';
import 'package:meta/meta.dart';

import '../../../../core/failures/server_failure.dart';
import '../../domain/entities/category_response_entity.dart';
import '../../domain/use_cases/main_layout_use_case.dart';

part 'main_layout_state.dart';

@injectable
class MainLayoutCubit extends Cubit<MainLayoutState> {
  MainLayoutCubit({this.mainLayoutUseCase,this.categoryUseCase,this.brandsUseCase,this.addToCartUseCase}) : super(MainLayoutInitial());

  MainLayoutUseCase? mainLayoutUseCase;
  CategoryUseCase? categoryUseCase;
  BrandsUseCase? brandsUseCase;
  AddToCartUseCase? addToCartUseCase;

  List<ListMainLayoutResponseEntity> productsList = [];
  List<CategoryListEntity> categoriesList = [];
  List<BrandListResponseEntity> brandsList = [];
  int numOfItem = 0;
  List<ListMainLayoutResponseEntity> searchResults = [];



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
      // print("response: $response");
      // print("response.list: ${response.list}");

      if (response.list != null) {
        productsList = response.list!
            .whereType<ListMainLayoutResponseEntity>()
            .toList();
      } else {
        productsList = [];
      }
      print("✅ Success state emitted");
      emit(getProductsSuccess(mainLayoutResponseEntity: response));
    });
  }

  void getAllCategories() async {
    emit(getCategoryLoading());
    var either = await categoryUseCase!.invoke();
    either.fold((fail)  {
          var error = fail as ServerFailure;
          emit(getCategoryError(errorMessage: error.message!));
    }, (response) {
          // print("response: $response");
          // print("response.list: ${response.list}");

          if (response.list != null) {
            categoriesList = response.list!
                .whereType<CategoryListEntity>()
                .toList();
          } else {
            categoriesList = [];
          }

          emit(getCategorySuccess(categoryResponseEntity: response));
        });
  }

  void getAllBrands()async{
    emit(getBrandsLoading());
    var either = await brandsUseCase!.invoke();
    either.fold((fail) {
      var error = fail as ServerFailure;
      emit(getBrandsError(errorMessage: error.message!));
    }, (response) {
      if(response.list != null){
        brandsList = response.list!
            .whereType<BrandListResponseEntity>()
            .toList();
      }else{
        brandsList = [];
      }
      emit(getBrandsSuccess(brandResponseEntity: response));
    });
  }

  void addToCart(String productId) async {
    if (productId.isEmpty) {
      emit(addToCartError(errorMessage: "❌ productId is empty"));
      return;
    }

    emit(addToCartLoading());
    var either = await addToCartUseCase!.invoke(productId);

    either.fold((fail) {
      var error = fail as ServerFailure;
      emit(addToCartError(errorMessage: error.message!));
    }, (response) {
      emit(addToCartSuccess(addToCartResponseEntity: response));
      print("✅ Add to cart success with productId: $productId");
    });
  }


  void searchProducts(String query) {
    emit(SearchLoadingState());

    try {
      List<ListMainLayoutResponseEntity> filtered;

      if (query.isEmpty) {
        filtered = productsList;
      } else {
        filtered = productsList
            .where((product) =>
        product.title != null &&
            product.title!.toLowerCase().contains(query.toLowerCase()))
            .toList();
      }

      emit(SearchSuccessState(filtered));
    } catch (e) {
      emit(SearchErrorState());
    }
  }


}
