import 'package:data_structures/linked_list/node.dart';

class LinkedList<E extends Object> extends Iterable {
  Node<E>? head;
  Node<E>? tail;

  int get size {
    int size = 0;
    var currentNode = head;
    while (currentNode != null) {
      size++;
      currentNode = currentNode.next;
    }
    return size;
  }

  //Time complexity - O(1)
  void push(E element) {
    head = Node(head, value: element);
    tail ??= head;
  }

  //Time complexity - O(1)
  void append(E element) {
    if (isEmpty) {
      push(element);
    } else {
      tail?.next = Node(null, value: element);
      tail = tail?.next;
    }
  }

  //Time complexity - O(i)
  @override
  Node<E> elementAt(int index) {
    if (index >= size) {
      throw RangeError('Wrong index, should be in range 0...${size - 1}');
    }
    if (isEmpty) {
      throw RangeError('Unable to get item from empty list');
    }
    var currentNode = head;
    var currentIndex = 0;
    while (currentNode != null && currentIndex < index) {
      currentNode = currentNode.next;
      currentIndex++;
    }
    return currentNode!;
  }

  //Time complexity - O(1)
  void insertAfter(E element, int index) {
    if (isEmpty) {
      throw Exception('Wrong index, list is empty');
    }
    final currentNode = elementAt(index);
    currentNode.next = Node(currentNode.next, value: element);
  }

  //Removes the first element in list
  //Time complexity - O(1)
  void pop() {
    if (isEmpty) {
      throw RangeError('Unable to remove item from empty list');
    }
    head = head?.next;
  }

  //Time complexity - O(n)
  void removeLast() {
    if (isEmpty) {
      throw RangeError('Unable to remove item from empty list');
    }
    final penultNode = elementAt(size - 2);
    penultNode.next = null;
  }

  //Time complexity - O(i)
  void removeAfter(int index) {
    if (isEmpty) {
      throw RangeError('Unable to remove item from empty list');
    }
    final currentNode = elementAt(index);
    currentNode.next = currentNode.next?.next;
  }

  @override
  String toString() {
    if (isEmpty) return 'List is empty';
    return head.toString();
  }

  @override
  Iterator get iterator => _LinkedListIterator(this);

  @override
  bool get isEmpty => head == null;
}

class _LinkedListIterator<E extends Object> implements Iterator<E> {
  _LinkedListIterator(LinkedList<E> list) : _list = list;
  final LinkedList<E> _list;
  Node<E>? _currentNode;

  @override
  E get current => _currentNode!.value;
  bool _firstPass = true;

  @override
  bool moveNext() {
    if (_list.isEmpty) return false;
    if (_firstPass) {
      _currentNode = _list.head;
      _firstPass = false;
    } else {
      _currentNode = _currentNode?.next;
    }

    return _currentNode != null;
  }
}
