"""
File: hash_map.py
Created Time: 2022-12-14
Author: msk397 (machangxinq@gmail.com)
"""

import sys
from pathlib import Path

sys.path.append(str(Path(__file__).parent.parent))
from modules import print_dict

"""실행 코드"""
if __name__ == "__main__":
    # 해시 테이블 초기화
    hmap = dict[int, str]()

    # 추가 연산
    # 해시 테이블에 (key, value) 키-값 쌍을 추가한다
    hmap[12836] = "小哈"
    hmap[15937] = "小啰"
    hmap[16750] = "小算"
    hmap[13276] = "小法"
    hmap[10583] = "小鸭"
    print("\n추가를 마친 후의 해시 테이블\n키 -> 값")
    print_dict(hmap)

    # 조회 연산
    # 해시 테이블에 키 key를 입력하여 값 value를 얻는다
    name: str = hmap[15937]
    print("\n학번 15937을 입력하여 조회한 이름 " + name)

    # 삭제 연산
    # 해시 테이블에서 (key, value) 키-값 쌍을 삭제한다
    hmap.pop(10583)
    print("\n10583을 삭제한 후의 해시 테이블\n키 -> 값")
    print_dict(hmap)

    # 해시 테이블 순회
    print("\n키-값 쌍(키->값) 순회")
    for key, value in hmap.items():
        print(key, "->", value)

    print("\n키 Key만 순회")
    for key in hmap.keys():
        print(key)

    print("\n값 Value만 순회")
    for val in hmap.values():
        print(val)
