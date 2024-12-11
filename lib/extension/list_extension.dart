extension DifferenceWithSet<T> on List<T> {
  List<T> differenceWithSet<T>(List<T> a, List<T> b) {
    return a.toSet().difference(b.toSet()).toList();
  }

  List<T> update(int index, T t) {
    List<T> list = [];
    list.add(t);
    replaceRange(index, index + 1, list);
    return this;
  }
}
