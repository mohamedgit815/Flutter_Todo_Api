import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc_todo_api_app/Core/Error/failure.dart';


abstract class BaseUseCase <T , Parameters> {

  Future<Either< Failure , T >> call(Parameters parameters);

}

class NoParameters extends Equatable {
  const NoParameters();

  @override
  List<Object?> get props => [] ;
}