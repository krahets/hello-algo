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
    # ハッシュ表を初期化する
    hmap = dict[int, str]()

    # 追加
    # ハッシュ表にペア (key, value) を追加する
    hmap[12836] = "小哈"
    hmap[15937] = "小啰"
    hmap[16750] = "小算"
    hmap[13276] = "小法"
    hmap[10583] = "小鸭"
    print("\n追加後のハッシュ表\nKey -> Value")
    print_dict(hmap)

    # 検索
    # ハッシュ表でキー key に対応する値 value を取得する
    name: str = hmap[15937]
    print("\n学籍番号 15937 に対応する名前は " + name)

    # 削除
    # ハッシュ表からペア (key, value) を削除する
    hmap.pop(10583)
    print("\n10583 を削除した後のハッシュ表\nKey -> Value")
    print_dict(hmap)

    # ハッシュ表を走査する
    print("\nキーと値のペアを順に表示 Key->Value")
    for key, value in hmap.items():
        print(key, "->", value)

    print("\nキーだけを順に表示 Key")
    for key in hmap.keys():
        print(key)

    print("\n値だけを順に表示 Value")
    for val in hmap.values():
        print(val)
