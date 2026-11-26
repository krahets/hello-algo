"""
File: deque.py
Created Time: 2022-11-29
Author: Peng Chen (pengchzn@gmail.com)
"""

from collections import deque

"""Driver Code"""
if __name__ == "__main__":
    # 덱 초기화
    deq: deque[int] = deque()

    # 덱에 원소 삽입
    deq.append(2)  # 맨 뒤에 추가
    deq.append(5)
    deq.append(4)
    deq.appendleft(3)  # 맨 앞에 추가
    deq.appendleft(1)
    print("덱 deque =", deq)

    # 원소 조회
    front: int = deq[0]  # 맨 앞 원소
    print("맨 앞 원소 front =", front)
    rear: int = deq[-1]  # 맨 뒤 원소
    print("맨 뒤 원소 rear =", rear)

    # 덱에서 원소 꺼내기
    pop_front: int = deq.popleft()  # 맨 앞에서 원소 꺼내기
    print("맨 앞에서 꺼낸 원소  pop_front =", pop_front)
    print("맨 앞에서 꺼낸 후 deque =", deq)
    pop_rear: int = deq.pop()  # 맨 뒤에서 원소 꺼내기
    print("맨 뒤에서 꺼낸 원소  pop_rear =", pop_rear)
    print("맨 뒤에서 꺼낸 후 deque =", deq)

    # 덱의 길이 조회
    size: int = len(deq)
    print("덱의 길이 size =", size)

    # 덱이 비어 있는지 확인
    is_empty: bool = len(deq) == 0
    print("덱이 비어 있는가 =", is_empty)
