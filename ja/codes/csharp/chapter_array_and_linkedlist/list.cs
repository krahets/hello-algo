/**
 * File: list.cs
 * Created Time: 2022-12-23
 * Author: haptear (haptear@hotmail.com)
 */

namespace hello_algo.chapter_array_and_linkedlist;

public class list {
    [Test]
    public void Test() {

        /* リストを初期化 */
        int[] numbers = [1, 3, 2, 5, 4];
        List<int> nums = [.. numbers];
        Console.WriteLine("リスト nums = " + string.Join(",", nums));

        /* 要素にアクセス */
        int num = nums[1];
        Console.WriteLine("インデックス 1 の要素にアクセスすると num = " + num);

        /* 要素を更新 */
        nums[1] = 0;
        Console.WriteLine("インデックス 1 の要素を 0 に更新すると nums = " + string.Join(",", nums));

        /* リストを空にする */
        nums.Clear();
        Console.WriteLine("リストを空にした後 nums = " + string.Join(",", nums));

        /* 末尾に要素を追加 */
        nums.Add(1);
        nums.Add(3);
        nums.Add(2);
        nums.Add(5);
        nums.Add(4);
        Console.WriteLine("要素を追加した後 nums = " + string.Join(",", nums));

        /* 中間に要素を挿入 */
        nums.Insert(3, 6);
        Console.WriteLine("インデックス 3 に数値 6 を挿入すると nums = " + string.Join(",", nums));

        /* 要素を削除 */
        nums.RemoveAt(3);
        Console.WriteLine("インデックス 3 の要素を削除すると nums = " + string.Join(",", nums));

        /* インデックスでリストを走査 */
        int count = 0;
        for (int i = 0; i < nums.Count; i++) {
            count += nums[i];
        }
        /* リスト要素を直接走査 */
        count = 0;
        foreach (int x in nums) {
            count += x;
        }

        /* 2 つのリストを連結する */
        List<int> nums1 = [6, 8, 7, 10, 9];
        nums.AddRange(nums1);
        Console.WriteLine("リスト nums1 を nums の後ろに連結すると nums = " + string.Join(",", nums));

        /* リストをソート */
        nums.Sort(); // ソート後、リスト要素は小さい順に並ぶ
        Console.WriteLine("リストをソートした後 nums = " + string.Join(",", nums));
    }
}
