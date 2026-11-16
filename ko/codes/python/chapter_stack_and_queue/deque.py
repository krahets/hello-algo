"""
File: deque.py
Created Time: 2022-11-29
Author: Peng Chen (pengchzn@gmail.com)
"""

# [region]{import_deque}
from collections import deque
# [endregion]{import_deque}

"""실행 코드"""
if __name__ == "__main__":
    # [region]{init_deque}
    # 덱 초기화
    deq: deque[int] = deque()
    # [endregion]{init_deque}

    # [region]{push}
    # 원소 삽입
    deq.append(2)  # 맨 뒤에 추가한다
    deq.append(5)
    deq.append(4)
    deq.appendleft(3)  # 맨 앞에 추가한다
    deq.appendleft(1)
    # [endregion]{push}
    print("덱 deque =", deq)

    # [region]{peek_first}
    # 원소 접근
    front: int = deq[0]  # 맨 앞 원소
    # [endregion]{peek_first}
    print("맨 앞 원소 front =", front)
    # [region]{peek_last}
    rear: int = deq[-1]  # 맨 뒤 원소
    # [endregion]{peek_last}
    print("맨 뒤 원소 rear =", rear)

    # [region]{pop_first}
    # 원소 꺼내기
    pop_front: int = deq.popleft()  # 맨 앞 원소를 꺼낸다
    # [endregion]{pop_first}
    print("맨 앞에서 꺼낸 원소  pop_front =", pop_front)
    print("맨 앞에서 꺼낸 후 deque =", deq)
    # [region]{pop_last}
    pop_rear: int = deq.pop()  # 맨 뒤 원소를 꺼낸다
    # [endregion]{pop_last}
    print("맨 뒤에서 꺼낸 원소  pop_rear =", pop_rear)
    print("맨 뒤에서 꺼낸 후 deque =", deq)

    # [region]{size}
    # 덱의 길이 반환
    size: int = len(deq)
    # [endregion]{size}
    print("덱 길이 size =", size)

    # [region]{is_empty}
    # 덱이 비어 있는지 판단
    is_empty: bool = len(deq) == 0
    # [endregion]{is_empty}
    print("덱이 비어 있는가 =", is_empty)
