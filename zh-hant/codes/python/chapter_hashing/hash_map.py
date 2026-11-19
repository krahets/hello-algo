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
    # [region]{init_hash_map}
    # 初始化雜湊表
    hmap = dict[int, str]()
    # [endregion]{init_hash_map}

    # [region]{add_pairs}
    # 新增操作
    # 在雜湊表中新增鍵值對 (key, value)
    hmap[12836] = "小哈"
    hmap[15937] = "小囉"
    hmap[16750] = "小算"
    hmap[13276] = "小法"
    hmap[10583] = "小鴨"
    # [endregion]{add_pairs}
    print("\n新增完成後，雜湊表為\nKey -> Value")
    print_dict(hmap)

    # [region]{get_value}
    # 查詢操作
    # 向雜湊表中輸入鍵 key ，得到值 value
    name: str = hmap[15937]
    # [endregion]{get_value}
    print("\n輸入學號 15937 ，查詢到姓名 " + name)

    # [region]{remove_pair}
    # 刪除操作
    # 在雜湊表中刪除鍵值對 (key, value)
    hmap.pop(10583)
    # [endregion]{remove_pair}
    print("\n刪除 10583 後，雜湊表為\nKey -> Value")
    print_dict(hmap)

    print("\n走訪鍵值對 Key->Value")
    # [region]{iterate_pairs}
    # 走訪雜湊表
    # 走訪鍵值對 key->value
    for key, value in hmap.items():
        print(key, "->", value)
    # [endregion]{iterate_pairs}

    print("\n單獨走訪鍵 Key")
    # [region]{iterate_keys}
    # 單獨走訪鍵 key
    for key in hmap.keys():
        print(key)
    # [endregion]{iterate_keys}

    print("\n單獨走訪值 Value")
    # [region]{iterate_values}
    # 單獨走訪值 value
    for val in hmap.values():
        print(val)
    # [endregion]{iterate_values}
