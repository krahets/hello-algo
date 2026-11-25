"""
File: deque.py
Created Time: 2022-11-29
Author: Peng Chen (pengchzn@gmail.com)
"""

from collections import deque

"""Driver Code"""
if __name__ == "__main__":
    # Initialize the deque
    deq: deque[int] = deque()

    # Add elements to the deque
    deq.append(2)  # Add at the rear
    deq.append(5)
    deq.append(4)
    deq.appendleft(3)  # Add at the front
    deq.appendleft(1)
    print("deque =", deq)

    # Peek at the front and rear elements
    front: int = deq[0]  # Front element
    print("Front element (front) =", front)
    rear: int = deq[-1]  # Rear element
    print("Rear element (rear) =", rear)

    # Remove elements from both ends
    pop_front: int = deq.popleft()  # Remove and return the front element
    print("Removed from the front (pop_front) =", pop_front)
    print("After removing the front element, deque =", deq)
    pop_rear: int = deq.pop()  # Remove and return the rear element
    print("Removed from the rear (pop_rear) =", pop_rear)
    print("After removing the rear element, deque =", deq)

    # Get the deque size
    size: int = len(deq)
    print("Deque size =", size)

    # Check whether the deque is empty
    is_empty: bool = len(deq) == 0
    print("Deque is empty =", is_empty)
