import 'package:data_structures/queue.dart';
import 'package:data_structures/stack.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  //Test Stack
  test('push method adds element to the end of stack', () {
    final stack = Stack<int>();
    stack.push(1);
    stack.push(2);
    expect(stack.pop(), 2);
  });

  test('pop method removes last element and returns it', () {
    final stack = Stack<int>();
    stack.push(1);
    expect(stack.pop(), 1);
  });

  test('Queue adds element at the beginning of queue', () {
    final queue = Queue<int>();
    queue.enqueue(1);
    queue.enqueue(2);

    expect(queue.dequeue(), 1);
  });

  test('dequeue method removes first element and returns it', () {
    final queue = Queue<int>();
    queue.enqueue(1);

    expect(queue.dequeue(), 1);
  });
}
