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
