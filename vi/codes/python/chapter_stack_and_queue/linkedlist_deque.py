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
        self.next: ListNode | None = None  # Successor node reference
        self.prev: ListNode | None = None  # Predecessor node reference


class LinkedListDeque:
    """Double-ended queue based on doubly linked list implementation"""

    def __init__(self):
        """Constructor"""
        self._front: ListNode | None = None  # Head node front
        self._rear: ListNode | None = None  # Tail node rear
        self._size: int = 0  # Length of the double-ended queue

    def size(self) -> int:
        """Get the length of the double-ended queue"""
        return self._size

    def is_empty(self) -> bool:
        """Check if the double-ended queue is empty"""
        return self._size == 0

    def push(self, num: int, is_front: bool):
        """Enqueue operation"""
        node = ListNode(num)
        # If the linked list is empty, make both front and rear point to node
        if self.is_empty():
            self._front = self._rear = node
        # Front of the queue enqueue operation
        elif is_front:
            # Add node to the head of the linked list
            self._front.prev = node
            node.next = self._front
            self._front = node  # Update head node
        # Rear of the queue enqueue operation
        else:
            # Add node to the tail of the linked list
            self._rear.next = node
            node.prev = self._rear
            self._rear = node  # Update tail node
        self._size += 1  # Update queue length

    def push_first(self, num: int):
        """Front of the queue enqueue"""
        self.push(num, True)

    def push_last(self, num: int):
        """Rear of the queue enqueue"""
        self.push(num, False)

    def pop(self, is_front: bool) -> int:
        """Dequeue operation"""
        if self.is_empty():
            raise IndexError("Double-ended queue is empty")
        # Front of the queue dequeue operation
        if is_front:
            val: int = self._front.val  # Temporarily store head node value
            # Delete head node
            fnext: ListNode | None = self._front.next
            if fnext is not None:
                fnext.prev = None
                self._front.next = None
            self._front = fnext  # Update head node
        # Rear of the queue dequeue operation
        else:
            val: int = self._rear.val  # Temporarily store tail node value
            # Delete tail node
            rprev: ListNode | None = self._rear.prev
            if rprev is not None:
                rprev.next = None
                self._rear.prev = None
            self._rear = rprev  # Update tail node
        self._size -= 1  # Update queue length
        return val

    def pop_first(self) -> int:
        """Front of the queue dequeue"""
        return self.pop(True)

    def pop_last(self) -> int:
        """Rear of the queue dequeue"""
        return self.pop(False)

    def peek_first(self) -> int:
        """Access front of the queue element"""
        if self.is_empty():
            raise IndexError("Double-ended queue is empty")
        return self._front.val

    def peek_last(self) -> int:
        """Access rear of the queue element"""
        if self.is_empty():
            raise IndexError("Double-ended queue is empty")
        return self._rear.val

    def to_array(self) -> list[int]:
        """Return array for printing"""
        node = self._front
        res = [0] * self.size()
        for i in range(self.size()):
            res[i] = node.val
            node = node.next
        return res


"""Driver Code"""
if __name__ == "__main__":
    # Initialize double-ended queue
    deque = LinkedListDeque()
    deque.push_last(3)
    deque.push_last(2)
    deque.push_last(5)
    print("double-ended queue deque =", deque.to_array())

    # Access elements
    peek_first: int = deque.peek_first()
    print("Front of the queue element peek_first =", peek_first)
    peek_last: int = deque.peek_last()
    print("Rear of the queue element peek_last =", peek_last)

    # Elements enqueue
    deque.push_last(4)
    print("Element 4 rear enqueue after deque =", deque.to_array())
    deque.push_first(1)
    print("Element 1 front enqueue after deque =", deque.to_array())

    # Elements dequeue
    pop_last: int = deque.pop_last()
    print("Rear dequeued element =", pop_last, ", rear dequeue after deque =", deque.to_array())
    pop_first: int = deque.pop_first()
    print("Front dequeued element =", pop_first, ", front dequeue after deque =", deque.to_array())

    # Get the length of the double-ended queue
    size: int = deque.size()
    print("Length of the double-ended queue size =", size)

    # Check if the double-ended queue is empty
    is_empty: bool = deque.is_empty()
    print("Is the double-ended queue empty =", is_empty)
