extension DifferenceWithSet<T> on List<T> {
  List<T> differenceWithSet(List<T> other) {
    return toSet().difference(other.toSet()).toList();
  }

  List<T> updateAt(int index, T value) {
    this[index] = value;
    return this;
  }
}
