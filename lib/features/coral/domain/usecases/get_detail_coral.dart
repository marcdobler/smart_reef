import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';

import '../../../../core/error/failures.dart';
import '../entities/coral.dart';
import '../repositories/coral.dart';

class GetDetailCoral {
  final CoralRepository repository;

  GetDetailCoral(this.repository);

  Future<Either<Failure, Coral>> execute({
    @required int number,
  }) async {
    return repository.getDetailCoral(number);
  }
}
