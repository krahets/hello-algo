"""
File: hash_map.py
Created Time: 2022-12-14
Author: msk397 (machangxinq@gmail.com)
"""

import sys
from pathlib import Path

sys.path.append(str(Path(__file__).parent.parent))
from modules import print_dict

"""実行用コード"""
if __name__ == "__main__":
    # [region]{init_hash_map}
    # ハッシュテーブルを初期化する
    hmap = dict[int, str]()
    # [endregion]{init_hash_map}

    # [region]{add_pairs}
    # 追加操作
    # ハッシュテーブルにキーと値のペア (key, value) を追加する
    hmap[12836] = "小哈"
    hmap[15937] = "小啰"
    hmap[16750] = "小算"
    hmap[13276] = "小法"
    hmap[10583] = "小鸭"
    # [endregion]{add_pairs}
    print("\n追加後のハッシュテーブル\nKey -> Value")
    print_dict(hmap)

    # [region]{get_value}
    # 取得操作
    # ハッシュテーブルにキー key を渡し、値 value を取得する
    name: str = hmap[15937]
    # [endregion]{get_value}
    print("\n学生番号 15937 に対応する氏名は " + name)

    # [region]{remove_pair}
    # 削除操作
    # ハッシュテーブルからキーと値のペア (key, value) を削除する
    hmap.pop(10583)
    # [endregion]{remove_pair}
    print("\n10583 を削除した後のハッシュテーブル\nKey -> Value")
    print_dict(hmap)

    print("\nキーと値のペア Key->Value を走査する")
    # [region]{iterate_pairs}
    # ハッシュテーブルを走査する
    # キーと値のペア key->value を走査する
    for key, value in hmap.items():
        print(key, "->", value)
    # [endregion]{iterate_pairs}

    print("\nキー Key だけを走査する")
    # [region]{iterate_keys}
    # キー key だけを走査する
    for key in hmap.keys():
        print(key)
    # [endregion]{iterate_keys}

    print("\n値 Value だけを走査する")
    # [region]{iterate_values}
    # 値 value だけを走査する
    for val in hmap.values():
        print(val)
    # [endregion]{iterate_values}
