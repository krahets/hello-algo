"""
File: hash_map.py
Created Time: 2022-12-14
Author: msk397 (machangxinq@gmail.com)
"""

import sys
from pathlib import Path

sys.path.append(str(Path(__file__).parent.parent))
from modules import print_dict

"""Driver Code"""
if __name__ == "__main__":
    # 해시 테이블 초기화
    hmap = dict[int, str]()

    # 추가
    # 해시 테이블에 키-값 쌍 (key, value) 추가
    hmap[12836] = "샤오하"
    hmap[15937] = "샤오뤄"
    hmap[16750] = "샤오쑤안"
    hmap[13276] = "샤오파"
    hmap[10583] = "샤오야"
    print("\n추가 후 해시 테이블\nKey -> Value")
    print_dict(hmap)

    # 조회
    # 해시 테이블에 키 key를 입력하여 값 value 조회
    name: str = hmap[15937]
    print("\n학번 15937로 조회한 이름: " + name)

    # 삭제
    # 해시 테이블에서 키-값 쌍 (key, value) 삭제
    hmap.pop(10583)
    print("\n키 10583 삭제 후 해시 테이블\nKey -> Value")
    print_dict(hmap)

    # 해시 테이블 순회
    print("\n키-값 쌍 순회 Key->Value")
    for key, value in hmap.items():
        print(key, "->", value)

    print("\n키만 순회 Key")
    for key in hmap.keys():
        print(key)

    print("\n값만 순회 Value")
    for val in hmap.values():
        print(val)
