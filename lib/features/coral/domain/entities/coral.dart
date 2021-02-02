import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class Coral extends Equatable {
  final String text;
  final int number;

  const Coral({
    @required this.text,
    @required this.number,
  });

  @override
  List<Object> get props => [text, number];
}
