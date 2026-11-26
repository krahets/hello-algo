/**
 * File: counting_sort.cs
 * Created Time: 2023-04-13
 * Author: hpstory (hpstory1024@163.com)
 */

namespace hello_algo.chapter_sorting;

public class counting_sort {
    /* カウントソート */
    // 簡易版。オブジェクトのソートには使えない
    void CountingSortNaive(int[] nums) {
        // 1. 配列の最大値 m を求める
        int m = 0;
        foreach (int num in nums) {
            m = Math.Max(m, num);
        }
        // 2. 各数値の出現回数を数える
        // counter[num] は num の出現回数を表す
        int[] counter = new int[m + 1];
        foreach (int num in nums) {
            counter[num]++;
        }
        // 3. counter を走査し、各要素を元の配列 nums に書き込む
        int i = 0;
        for (int num = 0; num < m + 1; num++) {
            for (int j = 0; j < counter[num]; j++, i++) {
                nums[i] = num;
            }
        }
    }

    /* カウントソート */
    // 完全版。オブジェクトもソートでき、安定性を保つ
    void CountingSort(int[] nums) {
        // 1. 配列の最大値 m を求める
        int m = 0;
        foreach (int num in nums) {
            m = Math.Max(m, num);
        }
        // 2. 各数値の出現回数を数える
        // counter[num] は num の出現回数を表す
        int[] counter = new int[m + 1];
        foreach (int num in nums) {
            counter[num]++;
        }
        // 3. counter の累積和を求め、出現回数から各値の末尾位置を求められるようにする
        // つまり counter[num]-1 は res 内で num が最後に現れるインデックス
        for (int i = 0; i < m; i++) {
            counter[i + 1] += counter[i];
        }
        // 4. nums を逆順に走査し、各要素を結果配列 res に書き込む
        // 結果を格納する配列 res を初期化
        int n = nums.Length;
        int[] res = new int[n];
        for (int i = n - 1; i >= 0; i--) {
            int num = nums[i];
            res[counter[num] - 1] = num; // num を対応するインデックスに配置
            counter[num]--; // 累積和を 1 減らして、次に num を置く位置を求める
        }
        // 結果配列 res で元の配列 nums を上書き
        for (int i = 0; i < n; i++) {
            nums[i] = res[i];
        }
    }

    [Test]
    public void Test() {
        int[] nums = [1, 0, 1, 2, 0, 4, 0, 2, 2, 4];
        CountingSortNaive(nums);
        Console.WriteLine("カウントソート（オブジェクトは対象外）後の nums = " + string.Join(" ", nums));

        int[] nums1 = [1, 0, 1, 2, 0, 4, 0, 2, 2, 4];
        CountingSort(nums1);
        Console.WriteLine("カウントソート後の nums1 = " + string.Join(" ", nums));
    }
}
