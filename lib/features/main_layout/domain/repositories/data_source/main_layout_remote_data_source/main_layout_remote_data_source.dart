import 'package:dartz/dartz.dart';
import 'package:markti/core/failures/failure.dart';

import '../../../entities/main_layout_response_entity.dart';

abstract class MainLayoutRemoteDateSource{

  Future<Either<Failure,MainLayoutResponseEntity>> getAllProducts();
}