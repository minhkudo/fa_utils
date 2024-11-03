List<T> differenceWithSet<T>(List<T> a, List<T> b) {
  return a.toSet().difference(b.toSet()).toList();
}

T? castValue<T>(x) => x is T ? x : null;
