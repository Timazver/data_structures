// FIFO(First In First Out) data structure

class Queue<T extends Object> {
  final _content = <T>[];

  bool get isEmpty => _content.isEmpty;
  int get size => _content.length;

  //Adds element to the beginning of queue
  void enqueue(T element) {
    _content.insert(0, element);
  }

  //Removes last element in queue and returns it
  T dequeue() {
    try {
      final result = _content.removeLast();
      return result;
    } catch (error) {
      throw Exception('Item cannot be dequeued from empty queue');
    }
  }
}
