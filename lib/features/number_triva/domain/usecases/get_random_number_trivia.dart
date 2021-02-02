import 'package:dartz/dartz.dart';
import 'package:smart_reef/core/error/failures.dart';
import 'package:smart_reef/core/usecases/usecase.dart';

import '../entities/number_trivia.dart';
import '../repositories/number_trivia_repository.dart';

class GetRandomNumberTrivia implements UseCase<NumberTrivia, NoParams> {
  final NumberTriviaRepository repository;

  GetRandomNumberTrivia(this.repository);

  @override
  Future<Either<Failure, NumberTrivia>> call(NoParams params) async {
    return repository.getRandomNumberTrivia();
  }
}
