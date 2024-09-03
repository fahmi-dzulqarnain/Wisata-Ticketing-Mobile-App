import 'package:dartz/dartz.dart';
import 'package:wisata_ticketing/core/errors/errors.dart';

typedef ResultFuture<T> = Future<Either<Failure, T>>;

typedef ResultVoid = ResultFuture<void>;

typedef DataMap = Map<String, dynamic>;