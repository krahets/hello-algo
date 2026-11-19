"""
File: heap.py
Created Time: 2023-02-23
Author: krahets (krahets@163.com)
"""

import sys
from pathlib import Path

sys.path.append(str(Path(__file__).parent.parent))
from modules import print_heap

import heapq


"""실행 코드"""
if __name__ == "__main__":
    # [region]{init}
    # 최소 힙 초기화
    min_heap, flag = [], 1
    # 최대 힙 초기화
    max_heap, flag = [], -1

    # Python의 heapq 모듈은 기본적으로 최소 힙을 구현한다
    # 원소의 부호를 바꾸어 힙에 삽입하면 대소 관계가 뒤집히므로 최대 힙을 구현할 수 있다
    # 이 예제에서 flag = 1은 최소 힙에, flag = -1은 최대 힙에 해당한다
    # [endregion]{init}
    print("\n다음 테스트 예제는 최대 힙이다")

    # [region]{push}
    # 힙에 원소 삽입
    heapq.heappush(max_heap, flag * 1)
    heapq.heappush(max_heap, flag * 3)
    heapq.heappush(max_heap, flag * 2)
    heapq.heappush(max_heap, flag * 5)
    heapq.heappush(max_heap, flag * 4)
    # [endregion]{push}
    print_heap([flag * val for val in max_heap])

    # [region]{peek}
    # 힙의 루트 원소 반환
    peek: int = flag * max_heap[0]  # 5
    # [endregion]{peek}
    print(f"\n힙의 루트 원소는 {peek}이다")

    # [region]{pop_1}
    # 힙의 루트 원소 꺼내기
    # 힙에서 꺼낸 원소는 내림차순 수열을 이룬다
    val = flag * heapq.heappop(max_heap)  # 5
    # [endregion]{pop_1}
    print(f"힙에서 꺼낸 원소: {val}")
    # [region]{pop_2}
    val = flag * heapq.heappop(max_heap)  # 4
    # [endregion]{pop_2}
    print(f"힙에서 꺼낸 원소: {val}")
    # [region]{pop_3}
    val = flag * heapq.heappop(max_heap)  # 3
    # [endregion]{pop_3}
    print(f"힙에서 꺼낸 원소: {val}")
    # [region]{pop_4}
    val = flag * heapq.heappop(max_heap)  # 2
    # [endregion]{pop_4}
    print(f"힙에서 꺼낸 원소: {val}")
    # [region]{pop_5}
    val = flag * heapq.heappop(max_heap)  # 1
    # [endregion]{pop_5}
    print(f"힙에서 꺼낸 원소: {val}")

    # [region]{size}
    # 힙 크기 반환
    size: int = len(max_heap)
    # [endregion]{size}
    print(f"\n힙의 원소 개수는 {size}개이다")

    # [region]{is_empty}
    # 힙이 비어 있는지 판단
    is_empty: bool = not max_heap
    # [endregion]{is_empty}
    print(f"\n힙이 비어 있는가 {is_empty}")

    # [region]{heapify}
    # 리스트를 입력하여 힙 구성
    # 시간 복잡도는 O(n)이며 O(nlogn)이 아니다
    min_heap: list[int] = [1, 3, 2, 5, 4]
    heapq.heapify(min_heap)
    # [endregion]{heapify}
    print("\n리스트를 입력하여 최소 힙을 구성한 후")
    print_heap(min_heap)
