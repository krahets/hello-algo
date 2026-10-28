"""
File: max_product_cutting.py
Created Time: 2023-07-21
Author: krahets (krahets@163.com)
"""

import math


def max_product_cutting(n: int) -> int:
    """분할 후의 최대 곱: 탐욕"""
    # n <= 3이면 반드시 1 하나가 나오도록 분할해야 한다
    if n <= 3:
        return 1 * (n - 1)
    # 탐욕적으로 3을 떼어 낸다. a는 3의 개수이고 b는 나머지이다
    a, b = n // 3, n % 3
    if b == 1:
        # 나머지가 1이면 1 * 3 한 쌍을 2 * 2로 바꾼다
        return int(math.pow(3, a - 1)) * 2 * 2
    if b == 2:
        # 나머지가 2이면 별도로 처리하지 않는다
        return int(math.pow(3, a)) * 2
    # 나머지가 0이면 별도로 처리하지 않는다
    return int(math.pow(3, a))


"""실행 코드"""
if __name__ == "__main__":
    n = 58

    # 탐욕 알고리즘
    res = max_product_cutting(n)
    print(f"분할 후의 최대 곱은 {res}이다")
