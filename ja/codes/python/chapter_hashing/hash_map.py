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
    # ハッシュテーブルを初期化
    hmap = dict[int, str]()

    # 追加操作
    # ハッシュテーブルにキーと値の組 (key, value) を追加する
    hmap[12836] = "シャオハー"
    hmap[15937] = "シャオルオ"
    hmap[16750] = "シャオスワン"
    hmap[13276] = "シャオファー"
    hmap[10583] = "シャオヤー"
    print("\n追加完了後、ハッシュテーブルは\nKey -> Value")
    print_dict(hmap)

    # 検索操作
    # ハッシュテーブルにキー key を入力し、値 value を取得する
    name: str = hmap[15937]
    print("\n学籍番号 15937 を入力すると、氏名は " + name)

    # 削除操作
    # ハッシュテーブルからキーと値の組 (key, value) を削除する
    hmap.pop(10583)
    print("\n10583 を削除した後、ハッシュテーブルは\nKey -> Value")
    print_dict(hmap)

    # ハッシュテーブルを走査
    print("\nキーと値のペア Key->Value を走査")
    for key, value in hmap.items():
        print(key, "->", value)

    print("\nキー Key を個別に走査")
    for key in hmap.keys():
        print(key)

    print("\n値 Value を個別に走査")
    for val in hmap.values():
        print(val)
