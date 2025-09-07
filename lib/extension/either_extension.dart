import 'package:either_dart/either.dart';

extension EitherX<L, R> on Either<L, R> {
  /// Lấy giá trị bên Right, nếu là Left thì throw ra exception
  R getOrThrow() => fold(
        (l) => throw l is Exception ? l : Exception(l.toString()),
        (r) => r,
      );

  /// Map Right thành kiểu khác (giống map nhưng an toàn hơn)
  Either<L, T> mapRight<T>(T Function(R r) transform) => fold(
        (l) => Left(l),
        (r) => Right(transform(r)),
      );

  /// Map Left thành kiểu khác
  Either<T, R> mapLeft<T>(T Function(L l) transform) => fold(
        (l) => Left(transform(l)),
        (r) => Right(r),
      );

  /// Thực thi nếu là Right
  void onRight(void Function(R r) action) {
    fold((_) {}, action);
  }

  /// Thực thi nếu là Left
  void onLeft(void Function(L l) action) {
    fold(action, (_) {});
  }

  /// Thực thi khác nhau cho cả Left và Right (ngắn gọn thay vì fold)
  T when<T>({
    required T Function(L l) left,
    required T Function(R r) right,
  }) =>
      fold(left, right);

  /// Convert Either -> nullable
  R? getOrNull() => fold((_) => null, (r) => r);

  /// Convert Either -> default value nếu Left
  R getOrElse(R fallback) => fold((_) => fallback, (r) => r);

  /// Convert Either -> Future (thường dùng trong async/await)
  Future<R> asyncGetOrThrow() async => getOrThrow();
}
