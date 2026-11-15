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
    # 初始化哈希表
    hmap = dict[int, str]()
    # [endregion]{init_hash_map}

    # [region]{add_pairs}
    # 添加操作
    # 在哈希表中添加键值对 (key, value)
    hmap[12836] = "小哈"
    hmap[15937] = "小啰"
    hmap[16750] = "小算"
    hmap[13276] = "小法"
    hmap[10583] = "小鸭"
    # [endregion]{add_pairs}
    print("\n添加完成后，哈希表为\nKey -> Value")
    print_dict(hmap)

    # [region]{get_value}
    # 查询操作
    # 向哈希表中输入键 key ，得到值 value
    name: str = hmap[15937]
    # [endregion]{get_value}
    print("\n输入学号 15937 ，查询到姓名 " + name)

    # [region]{remove_pair}
    # 删除操作
    # 在哈希表中删除键值对 (key, value)
    hmap.pop(10583)
    # [endregion]{remove_pair}
    print("\n删除 10583 后，哈希表为\nKey -> Value")
    print_dict(hmap)

    print("\n遍历键值对 Key->Value")
    # [region]{iterate_pairs}
    # 遍历哈希表
    # 遍历键值对 key->value
    for key, value in hmap.items():
        print(key, "->", value)
    # [endregion]{iterate_pairs}

    print("\n单独遍历键 Key")
    # [region]{iterate_keys}
    # 单独遍历键 key
    for key in hmap.keys():
        print(key)
    # [endregion]{iterate_keys}

    print("\n单独遍历值 Value")
    # [region]{iterate_values}
    # 单独遍历值 value
    for val in hmap.values():
        print(val)
    # [endregion]{iterate_values}
