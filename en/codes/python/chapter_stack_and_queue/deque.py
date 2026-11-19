"""
File: deque.py
Created Time: 2022-11-29
Author: Peng Chen (pengchzn@gmail.com)
"""

# [region]{import_deque}
from collections import deque
# [endregion]{import_deque}

"""Driver code"""
if __name__ == "__main__":
    # [region]{init_deque}
    # Initialize the deque
    deq: deque[int] = deque()
    # [endregion]{init_deque}

    # [region]{push}
    # Enqueue elements
    deq.append(2)  # Add to the rear
    deq.append(5)
    deq.append(4)
    deq.appendleft(3)  # Add to the front
    deq.appendleft(1)
    # [endregion]{push}
    print("Deque deque =", deq)

    # [region]{peek_first}
    # Access an element
    front: int = deq[0]  # Front element
    # [endregion]{peek_first}
    print("Front element front =", front)
    # [region]{peek_last}
    rear: int = deq[-1]  # Rear element
    # [endregion]{peek_last}
    print("Rear element rear =", rear)

    # [region]{pop_first}
    # Dequeue an element
    pop_front: int = deq.popleft()  # Dequeue the front element
    # [endregion]{pop_first}
    print("Element dequeued from the front, pop_front =", pop_front)
    print("After dequeuing from the front, deque =", deq)
    # [region]{pop_last}
    pop_rear: int = deq.pop()  # Dequeue the rear element
    # [endregion]{pop_last}
    print("Element dequeued from the rear, pop_rear =", pop_rear)
    print("After dequeuing from the rear, deque =", deq)

    # [region]{size}
    # Get the deque size
    size: int = len(deq)
    # [endregion]{size}
    print("Deque size =", size)

    # [region]{is_empty}
    # Check whether the deque is empty
    is_empty: bool = len(deq) == 0
    # [endregion]{is_empty}
    print("Is the deque empty =", is_empty)
