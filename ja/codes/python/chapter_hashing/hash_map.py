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
    # キー値ペア (key, value) をハッシュテーブルに追加
    hmap[12836] = "Ha"
    hmap[15937] = "Luo"
    hmap[16750] = "Suan"
    hmap[13276] = "Fa"
    hmap[10583] = "Ya"
    print("\n追加後、ハッシュテーブルは\nKey -> Value")
    print_dict(hmap)

    # 照会操作
    # ハッシュテーブルにキーを入力し、値を取得
    name: str = hmap[15937]
    print("\n学生ID 15937 を入力、名前 " + name + " が見つかりました")

    # 削除操作
    # ハッシュテーブルからキー値ペア (key, value) を削除
    hmap.pop(10583)
    print("\n10583 を削除後、ハッシュテーブルは\nKey -> Value")
    print_dict(hmap)

    # ハッシュテーブルを走査
    print("\nキー値ペアを走査 Key->Value")
    for key, value in hmap.items():
        print(key, "->", value)

    print("\nキーを個別に走査 Key")
    for key in hmap.keys():
        print(key)

    print("\n値を個別に走査 Value")
    for val in hmap.values():
        print(val)