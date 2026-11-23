"""
File: fractional_knapsack.py
Created Time: 2023-07-19
Author: krahets (krahets@163.com)
"""


class Item:
    """물건"""

    def __init__(self, w: int, v: int):
        self.w = w  # 물건의 무게
        self.v = v  # 물건의 가치


def fractional_knapsack(wgt: list[int], val: list[int], cap: int) -> int:
    """분할 가능한 배낭: 탐욕"""
    # 무게와 가치 두 속성을 갖는 물건의 리스트를 생성한다
    items = [Item(w, v) for w, v in zip(wgt, val)]
    # 단위 가치 item.v / item.w를 기준으로 내림차순 정렬한다
    items.sort(key=lambda item: item.v / item.w, reverse=True)
    # 탐욕적 선택을 반복한다
    res = 0
    for item in items:
        if item.w <= cap:
            # 남은 용량이 충분하면 현재 물건을 통째로 배낭에 넣는다
            res += item.v
            cap -= item.w
        else:
            # 남은 용량이 부족하면 현재 물건의 일부를 배낭에 넣는다
            res += (item.v / item.w) * cap
            # 남은 용량이 없으므로 반복문을 종료한다
            break
    return res


"""실행 코드"""
if __name__ == "__main__":
    wgt = [10, 20, 30, 40, 50]
    val = [50, 120, 150, 210, 240]
    cap = 50
    n = len(wgt)

    # 탐욕 알고리즘
    res = fractional_knapsack(wgt, val, cap)
    print(f"배낭 용량을 초과하지 않는 물건의 최대 가치는 {res}이다")
