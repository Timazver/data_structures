// LIFO(Last In First Out) data structure

class Stack<T extends Object> {
  final _content = <T>[];

  bool get isEmpty => _content.isEmpty;
  int get size => _content.length;

  //Adds element to the end of stack
  void push(T element) {
    _content.add(element);
  }

  //Removes last element in stack and returns it
  T pop() {
    try {
      final result = _content.removeLast();
      return result;
    } catch (error) {
      throw Exception('Item cannot be popped from empty stack');
    }
  }

  //Returns last element from stack
  T peek() {
    if (_content.isNotEmpty) {
      return _content.last;
    } else {
      throw Error();
    }
  }
}
