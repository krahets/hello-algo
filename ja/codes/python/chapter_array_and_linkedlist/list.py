"""
File: list.py
Created Time: 2022-11-25
Author: krahets (krahets@163.com)
"""

"""Driver Code"""
if __name__ == "__main__":
    # リストを初期化
    nums: list[int] = [1, 3, 2, 5, 4]
    print("\nリスト nums =", nums)

    # 要素にアクセス
    x: int = nums[1]
    print("\nインデックス 1 の要素にアクセス、結果は x =", x)

    # 要素を更新
    nums[1] = 0
    print("\nインデックス 1 の要素を 0 に更新、結果は nums =", nums)

    # リストをクリア
    nums.clear()
    print("\nリストをクリア後、nums =", nums)

    # 末尾に要素を追加
    nums.append(1)
    nums.append(3)
    nums.append(2)
    nums.append(5)
    nums.append(4)
    print("\n要素を追加後、nums =", nums)

    # 中間に要素を挿入
    nums.insert(3, 6)
    print("\nインデックス 3 に数値 6 を挿入、結果は nums =", nums)

    # 要素を削除
    nums.pop(3)
    print("\nインデックス 3 の要素を削除、結果は nums =", nums)

    # インデックスによるリストの走査
    count = 0
    for i in range(len(nums)):
        count += nums[i]
    # リスト要素の走査
    for num in nums:
        count += num

    # 2つのリストを連結
    nums1 = [6, 8, 7, 10, 9]
    nums += nums1
    print("\nリスト nums1 を nums に連結、結果は nums =", nums)

    # リストをソート
    nums.sort()
    print("\nリストをソート後、nums =", nums)