import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  final String? message;
  final Map<String, dynamic>? data;

  const Failure({this.message, this.data});

  @override
  List<Object?> get props => [message];
}

class NoInternetFailure extends Failure {
  const NoInternetFailure() : super(message: 'No Internet Connection');
}

class ServerFailure extends Failure {
  const ServerFailure({super.message, super.data});
  @override
  List<Object?> get props => [
        message,
        data,
      ];
}
