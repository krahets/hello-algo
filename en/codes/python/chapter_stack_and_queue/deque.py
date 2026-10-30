"""
File: deque.py
Created Time: 2022-11-29
Author: Peng Chen (pengchzn@gmail.com)
"""

from collections import deque

"""Driver code"""
if __name__ == "__main__":
    # Initialize the deque
    deq: deque[int] = deque()

    # Enqueue elements
    deq.append(2)  # Add to the rear
    deq.append(5)
    deq.append(4)
    deq.appendleft(3)  # Add to the front
    deq.appendleft(1)
    print("Deque deq =", deq)

    # Access an element
    front: int = deq[0]  # Front element
    print("Front element front =", front)
    rear: int = deq[-1]  # Rear element
    print("Rear element rear =", rear)

    # Dequeue an element
    pop_front: int = deq.popleft()  # Dequeue the front element
    print("Element dequeued from the front, pop_front =", pop_front)
    print("After dequeuing from the front, deq =", deq)
    pop_rear: int = deq.pop()  # Dequeue the rear element
    print("Element dequeued from the rear, pop_rear =", pop_rear)
    print("After dequeuing from the rear, deq =", deq)

    # Get the deque size
    size: int = len(deq)
    print("Deque size =", size)

    # Check whether the deque is empty
    is_empty: bool = len(deq) == 0
    print("Is the deque empty =", is_empty)
