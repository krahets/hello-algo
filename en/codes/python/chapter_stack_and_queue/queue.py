"""
File: queue.py
Created Time: 2022-11-29
Author: Peng Chen (pengchzn@gmail.com)
"""

# [region]{import_deque}
from collections import deque
# [endregion]{import_deque}

"""Driver code"""
if __name__ == "__main__":
    # [region]{init_queue}
    # Initialize the queue
    # In Python, we generally use the deque class as a queue
    # Although queue.Queue() is a dedicated queue class, it is less convenient to use and is therefore not recommended
    que: deque[int] = deque()
    # [endregion]{init_queue}

    # [region]{push}
    # Enqueue elements
    que.append(1)
    que.append(3)
    que.append(2)
    que.append(5)
    que.append(4)
    # [endregion]{push}
    print("Queue que =", que)

    # [region]{peek}
    # Access the front element
    front: int = que[0]
    # [endregion]{peek}
    print("Front element front =", front)

    # [region]{pop}
    # Dequeue an element
    pop: int = que.popleft()
    # [endregion]{pop}
    print("Dequeued element pop =", pop)
    print("After dequeuing, que =", que)

    # [region]{size}
    # Get the queue size
    size: int = len(que)
    # [endregion]{size}
    print("Queue size =", size)

    # [region]{is_empty}
    # Check whether the queue is empty
    is_empty: bool = len(que) == 0
    # [endregion]{is_empty}
    print("Is the queue empty =", is_empty)
