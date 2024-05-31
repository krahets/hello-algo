"""
File: deque.py
Created Time: 2022-11-29
Author: Peng Chen (pengchzn@gmail.com)
"""

from collections import deque

"""Driver Code"""
if __name__ == "__main__":
    # Initialize double-ended queue
    deq: deque[int] = deque()

    # Element enqueue
    deq.append(2)  # Add to rear
    deq.append(5)
    deq.append(4)
    deq.appendleft(3)  # Add to front
    deq.appendleft(1)
    print("Double-ended queue deque =", deq)

    # Access element
    front: int = deq[0]  # Front element
    print("Front element front =", front)
    rear: int = deq[-1]  # Rear element
    print("Rear element rear =", rear)

    # Element dequeue
    pop_front: int = deq.popleft()  # Front element dequeue
    print("Front dequeued element  pop_front =", pop_front)
    print("Deque after front dequeue =", deq)
    pop_rear: int = deq.pop()  # Rear element dequeue
    print("Rear dequeued element  pop_rear =", pop_rear)
    print("Deque after rear dequeue =", deq)

    # Get the length of the double-ended queue
    size: int = len(deq)
    print("Double-ended queue length size =", size)

    # Determine if the double-ended queue is empty
    is_empty: bool = len(deq) == 0
    print("Is the double-ended queue empty =", is_empty)
