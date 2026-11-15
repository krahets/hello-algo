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
    # [region]{init_hash_map}
    # 해시 테이블 초기화
    hmap = dict[int, str]()
    # [endregion]{init_hash_map}

    # [region]{add_pairs}
    # 추가 연산
    # 해시 테이블에 (key, value) 키-값 쌍을 추가한다
    hmap[12836] = "小哈"
    hmap[15937] = "小啰"
    hmap[16750] = "小算"
    hmap[13276] = "小法"
    hmap[10583] = "小鸭"
    # [endregion]{add_pairs}
    print("\n추가를 마친 후의 해시 테이블\n키 -> 값")
    print_dict(hmap)

    # [region]{get_value}
    # 조회 연산
    # 해시 테이블에 키 key를 입력하여 값 value를 얻는다
    name: str = hmap[15937]
    # [endregion]{get_value}
    print("\n학번 15937을 입력하여 조회한 이름 " + name)

    # [region]{remove_pair}
    # 삭제 연산
    # 해시 테이블에서 (key, value) 키-값 쌍을 삭제한다
    hmap.pop(10583)
    # [endregion]{remove_pair}
    print("\n10583을 삭제한 후의 해시 테이블\n키 -> 값")
    print_dict(hmap)

    print("\n키-값 쌍(키->값) 순회")
    # [region]{iterate_pairs}
    # 해시 테이블 순회
    # 키-값 쌍 key->value를 순회한다
    for key, value in hmap.items():
        print(key, "->", value)
    # [endregion]{iterate_pairs}

    print("\n키 Key만 순회")
    # [region]{iterate_keys}
    # 키 key만 순회한다
    for key in hmap.keys():
        print(key)
    # [endregion]{iterate_keys}

    print("\n값 Value만 순회")
    # [region]{iterate_values}
    # 값 value만 순회한다
    for val in hmap.values():
        print(val)
    # [endregion]{iterate_values}
