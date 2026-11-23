"""
File: linkedlist_deque.py
Created Time: 2023-03-01
Author: krahets (krahets@163.com)
"""


class ListNode:
    """Doubly linked list node"""

    def __init__(self, val: int):
        """Constructor"""
        self.val: int = val
        self.next: ListNode | None = None  # Reference to the next node
        self.prev: ListNode | None = None  # Reference to the previous node


class LinkedListDeque:
    """Deque implemented with a doubly linked list"""

    def __init__(self):
        """Constructor"""
        self._front: ListNode | None = None  # Head node front
        self._rear: ListNode | None = None  # Tail node rear
        self._size: int = 0  # Deque size

    def size(self) -> int:
        """Get the deque size"""
        return self._size

    def is_empty(self) -> bool:
        """Check whether the deque is empty"""
        return self._size == 0

    def push(self, num: int, is_front: bool):
        """Enqueue operation"""
        node = ListNode(num)
        # If the linked list is empty, make both front and rear point to node
        if self.is_empty():
            self._front = self._rear = node
        # Enqueue at the front
        elif is_front:
            # Add node to the head of the linked list
            self._front.prev = node
            node.next = self._front
            self._front = node  # Update the head node
        # Enqueue at the rear
        else:
            # Add node to the tail of the linked list
            self._rear.next = node
            node.prev = self._rear
            self._rear = node  # Update the tail node
        self._size += 1  # Update the deque size

    def push_first(self, num: int):
        """Enqueue at the front"""
        self.push(num, True)

    def push_last(self, num: int):
        """Enqueue at the rear"""
        self.push(num, False)

    def pop(self, is_front: bool) -> int:
        """Dequeue operation"""
        if self.is_empty():
            raise IndexError("Deque is empty")
        # When the deque size is 1, the head and tail point to the same node
        if self._size == 1:
            val: int = self._front.val
            self._front = None
            self._rear = None
        # Dequeue from the front
        elif is_front:
            val: int = self._front.val  # Save the head node value
            # Remove the head node
            fnext: ListNode | None = self._front.next
            fnext.prev = None
            self._front.next = None
            self._front = fnext  # Update the head node
        # Dequeue from the rear
        else:
            val: int = self._rear.val  # Save the tail node value
            # Remove the tail node
            rprev: ListNode | None = self._rear.prev
            rprev.next = None
            self._rear.prev = None
            self._rear = rprev  # Update the tail node
        self._size -= 1  # Update the deque size
        return val

    def pop_first(self) -> int:
        """Dequeue from the front"""
        return self.pop(True)

    def pop_last(self) -> int:
        """Dequeue from the rear"""
        return self.pop(False)

    def peek_first(self) -> int:
        """Access the front element"""
        if self.is_empty():
            raise IndexError("Deque is empty")
        return self._front.val

    def peek_last(self) -> int:
        """Access the rear element"""
        if self.is_empty():
            raise IndexError("Deque is empty")
        return self._rear.val

    def to_array(self) -> list[int]:
        """Return an array for printing"""
        node = self._front
        res = [0] * self.size()
        for i in range(self.size()):
            res[i] = node.val
            node = node.next
        return res


"""Driver code"""
if __name__ == "__main__":
    # Initialize the deque
    deque = LinkedListDeque()
    deque.push_last(3)
    deque.push_last(2)
    deque.push_last(5)
    print("Deque deque =", deque.to_array())

    # Access an element
    peek_first: int = deque.peek_first()
    print("Front element peek_first =", peek_first)
    peek_last: int = deque.peek_last()
    print("Rear element peek_last =", peek_last)

    # Enqueue elements
    deque.push_last(4)
    print("After enqueuing element 4 at the rear, deque =", deque.to_array())
    deque.push_first(1)
    print("After enqueuing element 1 at the front, deque =", deque.to_array())

    # Dequeue an element
    pop_last: int = deque.pop_last()
    print("Element dequeued from the rear =", pop_last, ", after dequeuing from the rear, deque =", deque.to_array())
    pop_first: int = deque.pop_first()
    print("Element dequeued from the front =", pop_first, ", after dequeuing from the front, deque =", deque.to_array())

    # Get the deque size
    size: int = deque.size()
    print("Deque size =", size)

    # Check whether the deque is empty
    is_empty: bool = deque.is_empty()
    print("Is the deque empty =", is_empty)
