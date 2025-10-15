import 'package:either_dart/either.dart';

extension EitherX<L, R> on Either<L, R> {
  /// Lấy Right, nếu Left thì throw Exception (giữ nguyên nếu đã là Exception)
  R getOrThrow() => fold(
        (l) => throw l is Exception ? l : Exception(l.toString()),
        (r) => r,
  );

  /// Lấy Right, nếu Left thì trả null
  R? getOrNull() => fold((_) => null, (r) => r);

  /// Lấy Right, nếu Left thì trả fallback
  R getOrElse(R fallback) => fold((_) => fallback, (r) => r);

  /// Trả về Right nếu có, ngược lại null
  R? get rightOrNull => fold((_) => null, (r) => r);

  /// Trả về Left nếu có, ngược lại null
  L? get leftOrNull => fold((l) => l, (_) => null);

  /// Thực thi nếu là Right
  void onRight(void Function(R r) action) => fold((_) {}, action);

  /// Thực thi nếu là Left
  void onLeft(void Function(L l) action) => fold(action, (_) {});

  /// Thực thi cho cả Left/Right (viết gọn cho fold)
  T when<T>({
    required T Function(L l) left,
    required T Function(R r) right,
  }) =>
      fold(left, right);

  /// Map Right thành kiểu khác
  Either<L, T> mapRight<T>(T Function(R r) transform) =>
      fold((l) => Left(l), (r) => Right(transform(r)));

  /// Map Left thành kiểu khác
  Either<T, R> mapLeft<T>(T Function(L l) transform) =>
      fold((l) => Left(transform(l)), (r) => Right(r));

  /// Dùng trong async/await (convert về Future)
  Future<R> asyncGetOrThrow() async => getOrThrow();
}

/// Extension cho Future<Either<L, R>> để dùng tiện trong async/await
extension FutureEitherX<L, R> on Future<Either<L, R>> {
  /// Lấy Right, nếu Left thì throw Exception
  Future<R> getOrThrow() async {
    final either = await this;
    return either.getOrThrow();
  }

  /// Lấy Right, nếu Left thì trả null
  Future<R?> getOrNull() async {
    final either = await this;
    return either.getOrNull();
  }

  /// Lấy Right, nếu Left thì trả fallback
  Future<R> getOrElse(R fallback) async {
    final either = await this;
    return either.getOrElse(fallback);
  }

  /// Trả về Right nếu có, ngược lại null
  Future<R?> get rightOrNull async {
    final either = await this;
    return either.rightOrNull;
  }

  /// Trả về Left nếu có, ngược lại null
  Future<L?> get leftOrNull async {
    final either = await this;
    return either.leftOrNull;
  }

  /// Thực thi nếu là Right
  Future<void> onRight(void Function(R r) action) async {
    final either = await this;
    either.onRight(action);
  }

  /// Thực thi nếu là Left
  Future<void> onLeft(void Function(L l) action) async {
    final either = await this;
    either.onLeft(action);
  }

  /// Thực thi cho cả Left/Right (viết gọn cho fold)
  Future<T> when<T>({
    required T Function(L l) left,
    required T Function(R r) right,
  }) async {
    final either = await this;
    return either.when(left: left, right: right);
  }

  /// Map Right thành kiểu khác
  Future<Either<L, T>> mapRight<T>(T Function(R r) transform) async {
    final either = await this;
    return either.mapRight(transform);
  }

  /// Map Left thành kiểu khác
  Future<Either<T, R>> mapLeft<T>(T Function(L l) transform) async {
    final either = await this;
    return either.mapLeft(transform);
  }
}
