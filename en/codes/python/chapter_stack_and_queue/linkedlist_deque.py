"""
File: linkedlist_deque.py
Created Time: 2023-03-01
Author: krahets (krahets@163.com)
"""


class ListNode:
    """Double-linked list node"""

    def __init__(self, val: int):
        """Constructor"""
        self.val: int = val
        self.next: ListNode | None = None  # Reference to successor node
        self.prev: ListNode | None = None  # Reference to predecessor node


class LinkedListDeque:
    """Double-ended queue class based on double-linked list"""

    def __init__(self):
        """Constructor"""
        self._front: ListNode | None = None  # Head node front
        self._rear: ListNode | None = None  # Tail node rear
        self._size: int = 0  # Length of the double-ended queue

    def size(self) -> int:
        """Get the length of the double-ended queue"""
        return self._size

    def is_empty(self) -> bool:
        """Determine if the double-ended queue is empty"""
        return self._size == 0

    def push(self, num: int, is_front: bool):
        """Enqueue operation"""
        node = ListNode(num)
        # If the list is empty, make front and rear both point to node
        if self.is_empty():
            self._front = self._rear = node
        # Front enqueue operation
        elif is_front:
            # Add node to the head of the list
            self._front.prev = node
            node.next = self._front
            self._front = node  # Update head node
        # Rear enqueue operation
        else:
            # Add node to the tail of the list
            self._rear.next = node
            node.prev = self._rear
            self._rear = node  # Update tail node
        self._size += 1  # Update queue length

    def push_first(self, num: int):
        """Front enqueue"""
        self.push(num, True)

    def push_last(self, num: int):
        """Rear enqueue"""
        self.push(num, False)

    def pop(self, is_front: bool) -> int:
        """Dequeue operation"""
        if self.is_empty():
            raise IndexError("Double-ended queue is empty")
        # Front dequeue operation
        if is_front:
            val: int = self._front.val  # Temporarily store the head node value
            # Remove head node
            fnext: ListNode | None = self._front.next
            if fnext != None:
                fnext.prev = None
                self._front.next = None
            self._front = fnext  # Update head node
        # Rear dequeue operation
        else:
            val: int = self._rear.val  # Temporarily store the tail node value
            # Remove tail node
            rprev: ListNode | None = self._rear.prev
            if rprev != None:
                rprev.next = None
                self._rear.prev = None
            self._rear = rprev  # Update tail node
        self._size -= 1  # Update queue length
        return val

    def pop_first(self) -> int:
        """Front dequeue"""
        return self.pop(True)

    def pop_last(self) -> int:
        """Rear dequeue"""
        return self.pop(False)

    def peek_first(self) -> int:
        """Access front element"""
        if self.is_empty():
            raise IndexError("Double-ended queue is empty")
        return self._front.val

    def peek_last(self) -> int:
        """Access rear element"""
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
    print("Double-ended queue deque =", deque.to_array())

    # Access element
    peek_first: int = deque.peek_first()
    print("Front element peek_first =", peek_first)
    peek_last: int = deque.peek_last()
    print("Rear element peek_last =", peek_last)

    # Element enqueue
    deque.push_last(4)
    print("Element 4 rear enqueued, deque =", deque.to_array())
    deque.push_first(1)
    print("Element 1 front enqueued, deque =", deque.to_array())

    # Element dequeue
    pop_last: int = deque.pop_last()
    print("Rear dequeued element =", pop_last, ", deque after rear dequeue =", deque.to_array())
    pop_first: int = deque.pop_first()
    print("Front dequeued element =", pop_first, ", deque after front dequeue =", deque.to_array())

    # Get the length of the double-ended queue
    size: int = deque.size()
    print("Double-ended queue length size =", size)

    # Determine if the double-ended queue is empty
    is_empty: bool = deque.is_empty()
    print("Is the double-ended queue empty =", is_empty)
