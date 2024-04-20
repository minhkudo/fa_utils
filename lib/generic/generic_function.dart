List<T> differenceWithSet<T>(List<T> a, List<T> b) {
  return a.toSet().difference(b.toSet()).toList();
}