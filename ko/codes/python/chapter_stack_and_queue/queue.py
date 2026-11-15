"""
File: queue.py
Created Time: 2022-11-29
Author: Peng Chen (pengchzn@gmail.com)
"""

# [region]{import_deque}
from collections import deque
# [endregion]{import_deque}

"""실행 코드"""
if __name__ == "__main__":
    # [region]{init_queue}
    # 큐 초기화
    # Python에서는 일반적으로 덱 클래스 deque를 큐로 사용한다
    # queue.Queue()는 전용 큐 클래스이지만 사용하기가 그다지 편리하지 않다
    que: deque[int] = deque()
    # [endregion]{init_queue}

    # [region]{push}
    # 큐에 원소 삽입
    que.append(1)
    que.append(3)
    que.append(2)
    que.append(5)
    que.append(4)
    # [endregion]{push}
    print("큐 que =", que)

    # [region]{peek}
    # 맨 앞 원소 접근
    front: int = que[0]
    # [endregion]{peek}
    print("맨 앞 원소 front =", front)

    # [region]{pop}
    # 큐에서 원소 꺼내기
    pop: int = que.popleft()
    # [endregion]{pop}
    print("큐에서 꺼낸 원소 pop =", pop)
    print("큐에서 꺼낸 후 que =", que)

    # [region]{size}
    # 큐의 길이 반환
    size: int = len(que)
    # [endregion]{size}
    print("큐 길이 size =", size)

    # [region]{is_empty}
    # 큐가 비어 있는지 판단
    is_empty: bool = len(que) == 0
    # [endregion]{is_empty}
    print("큐가 비어 있는가 =", is_empty)
