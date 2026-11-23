"""
File: max_capacity.py
Created Time: 2023-07-21
Author: krahets (krahets@163.com)
"""


def max_capacity(ht: list[int]) -> int:
    """최대 용량: 탐욕"""
    # i와 j가 각각 배열의 양 끝을 가리키도록 초기화한다
    i, j = 0, len(ht) - 1
    # 최대 용량의 초깃값은 0이다
    res = 0
    # 두 칸막이가 만날 때까지 탐욕적 선택을 반복한다
    while i < j:
        # 최대 용량을 갱신한다
        cap = min(ht[i], ht[j]) * (j - i)
        res = max(res, cap)
        # 낮은 칸막이를 안쪽으로 이동한다
        if ht[i] < ht[j]:
            i += 1
        else:
            j -= 1
    return res


"""실행 코드"""
if __name__ == "__main__":
    ht = [3, 8, 5, 2, 7, 7, 3, 4]

    # 탐욕 알고리즘
    res = max_capacity(ht)
    print(f"최대 용량은 {res}이다")
