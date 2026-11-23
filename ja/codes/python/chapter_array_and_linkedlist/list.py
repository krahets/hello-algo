"""
File: list.py
Created Time: 2022-11-25
Author: krahets (krahets@163.com)
"""

"""実行用コード"""
if __name__ == "__main__":
    # リストを初期化する
    nums: list[int] = [1, 3, 2, 5, 4]
    print("\nリスト nums =", nums)

    # 要素にアクセスする
    x: int = nums[1]
    print("\nインデックス 1 の要素にアクセスした結果 x =", x)

    # 要素を更新する
    nums[1] = 0
    print("\nインデックス 1 の要素を 0 に更新した結果 nums =", nums)

    # リストを空にする
    nums.clear()
    print("\nリストを空にした後 nums =", nums)

    # 末尾に要素を追加する
    nums.append(1)
    nums.append(3)
    nums.append(2)
    nums.append(5)
    nums.append(4)
    print("\n要素を追加した後 nums =", nums)

    # 途中に要素を挿入する
    nums.insert(3, 6)
    print("\nインデックス 3 に数値 6 を挿入した結果 nums =", nums)

    # 要素を削除する
    nums.pop(3)
    print("\nインデックス 3 の要素を削除した結果 nums =", nums)

    # インデックスを使ってリストを走査する
    count = 0
    for i in range(len(nums)):
        count += nums[i]
    # リストの要素を直接走査する
    for num in nums:
        count += num

    # 2 つのリストを連結する
    nums1 = [6, 8, 7, 10, 9]
    nums += nums1
    print("\nリスト nums の後ろに nums1 を連結した結果 nums =", nums)

    # リストをソートする
    nums.sort()
    print("\nリストをソートした後 nums =", nums)
