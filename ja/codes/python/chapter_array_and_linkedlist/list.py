"""
File: list.py
Created Time: 2022-11-25
Author: krahets (krahets@163.com)
"""

"""実行用コード"""
if __name__ == "__main__":
    # [region]{init_list}
    # リストを初期化する
    # 初期値なし
    empty_nums: list[int] = []
    # 初期値あり
    nums: list[int] = [1, 3, 2, 5, 4]
    # [endregion]{init_list}
    print("\nリスト nums =", nums)
    print("\nリスト empty_nums =", empty_nums)

    # [region]{access_element}
    # 要素にアクセスする
    x: int = nums[1]  # インデックス 1 の要素にアクセスする
    # [endregion]{access_element}
    print("\nインデックス 1 の要素にアクセスした結果 x =", x)

    # [region]{update_element}
    # 要素を更新する
    nums[1] = 0  # インデックス 1 の要素を 0 に更新する
    # [endregion]{update_element}
    print("\nインデックス 1 の要素を 0 に更新した結果 nums =", nums)

    # [region]{clear_list}
    # リストを空にする
    nums.clear()
    # [endregion]{clear_list}
    print("\nリストを空にした後 nums =", nums)

    # [region]{append_element}
    # 末尾に要素を追加する
    nums.append(1)
    nums.append(3)
    nums.append(2)
    nums.append(5)
    nums.append(4)
    # [endregion]{append_element}
    print("\n要素を追加した後 nums =", nums)

    # [region]{insert_element}
    # 途中に要素を挿入する
    nums.insert(3, 6)  # インデックス 3 に数値 6 を挿入する
    # [endregion]{insert_element}
    print("\nインデックス 3 に数値 6 を挿入した結果 nums =", nums)

    # [region]{remove_element}
    # 要素を削除する
    nums.pop(3)  # インデックス 3 の要素を削除する
    # [endregion]{remove_element}
    print("\nインデックス 3 の要素を削除した結果 nums =", nums)

    # [region]{iterate_list}
    # インデックスを使ってリストを走査する
    count = 0
    for i in range(len(nums)):
        count += nums[i]

    # リストの要素を直接走査する
    for num in nums:
        count += num
    # [endregion]{iterate_list}

    # [region]{concat_list}
    # 2 つのリストを連結する
    nums1 = [6, 8, 7, 10, 9]
    nums += nums1  # リスト nums の後ろに nums1 を連結する
    # [endregion]{concat_list}
    print("\nリスト nums の後ろに nums1 を連結した結果 nums =", nums)

    # [region]{sort_list}
    # リストをソートする
    nums.sort()  # ソート後、リストの要素は昇順に並ぶ
    # [endregion]{sort_list}
    print("\nリストをソートした後 nums =", nums)
