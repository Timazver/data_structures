class Node<T extends Object> {
  Node(
    this._next, {
    required this.value,
  });

  T value;
  Node<T>? _next;
  Node<T>? get next => _next;
  set next(Node<T>? item) => _next = item;

  @override
  String toString() {
    if (_next == null) return '$value';
    return '$value -> ${_next.toString()}';
  }
}
