import 'package:dartz/dartz.dart';

import '../../../../core/error/failures.dart';
import '../entities/coral.dart';

abstract class CoralRepository {
  Future<Either<Failure, Coral>> getListCoral();
  Future<Either<Failure, Coral>> getDetailCoral(int number);
}
