/**
 * File: list.cs
 * Created Time: 2022-12-23
 * Author: haptear (haptear@hotmail.com)
 */

namespace hello_algo.chapter_array_and_linkedlist;

public class list {
    [Test]
    public void Test() {

        /* リストを初期化する */
        int[] numbers = [1, 3, 2, 5, 4];
        List<int> nums = [.. numbers];
        Console.WriteLine("リスト nums = " + string.Join(",", nums));

        // [region]{access_element}
        /* 要素にアクセスする */
        int num = nums[1]; // インデックス 1 の要素にアクセスする
        // [endregion]{access_element}
        Console.WriteLine("インデックス 1 の要素にアクセスした結果 num = " + num);

        // [region]{update_element}
        /* 要素を更新する */
        nums[1] = 0; // インデックス 1 の要素を 0 に更新する
        // [endregion]{update_element}
        Console.WriteLine("インデックス 1 の要素を 0 に更新した結果 nums = " + string.Join(",", nums));

        // [region]{clear_list}
        /* リストを空にする */
        nums.Clear();
        // [endregion]{clear_list}
        Console.WriteLine("リストを空にした後 nums = " + string.Join(",", nums));

        // [region]{append_element}
        /* 末尾に要素を追加する */
        nums.Add(1);
        nums.Add(3);
        nums.Add(2);
        nums.Add(5);
        nums.Add(4);
        // [endregion]{append_element}
        Console.WriteLine("要素を追加した後 nums = " + string.Join(",", nums));

        // [region]{insert_element}
        /* 途中に要素を挿入する */
        nums.Insert(3, 6); // インデックス 3 に数値 6 を挿入する
        // [endregion]{insert_element}
        Console.WriteLine("インデックス 3 に数値 6 を挿入した結果 nums = " + string.Join(",", nums));

        // [region]{remove_element}
        /* 要素を削除する */
        nums.RemoveAt(3); // インデックス 3 の要素を削除する
        // [endregion]{remove_element}
        Console.WriteLine("インデックス 3 の要素を削除した結果 nums = " + string.Join(",", nums));

        // [region]{iterate_list}
        /* インデックスを使ってリストを走査する */
        int count = 0;
        for (int i = 0; i < nums.Count; i++) {
            count += nums[i];
        }

        /* リストの要素を直接走査する */
        count = 0;
        foreach (int x in nums) {
            count += x;
        }
        // [endregion]{iterate_list}

        // [region]{concat_list}
        /* 2 つのリストを連結する */
        List<int> nums1 = [6, 8, 7, 10, 9];
        nums.AddRange(nums1); // リスト nums の後ろに nums1 を連結する
        // [endregion]{concat_list}
        Console.WriteLine("リスト nums の後ろに nums1 を連結した結果 nums = " + string.Join(",", nums));

        // [region]{sort_list}
        /* リストをソートする */
        nums.Sort(); // ソート後、リストの要素は昇順に並ぶ
        // [endregion]{sort_list}
        Console.WriteLine("リストをソートした後 nums = " + string.Join(",", nums));
    }
}
