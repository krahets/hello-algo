/**
 * File: radix_sort.cs
 * Created Time: 2023-04-13
 * Author: hpstory (hpstory1024@163.com)
 */

namespace hello_algo.chapter_sorting;

public class radix_sort {
    /* 要素 num の下から k 桁目を取得。ここで exp = 10^(k-1) */
    int Digit(int num, int exp) {
        // k ではなく exp を渡し、負荷の高いべき乗計算の繰り返しを避ける
        return (num / exp) % 10;
    }

    /* カウントソート（nums の下から k 桁目でソート） */
    void CountingSortDigit(int[] nums, int exp) {
        // 十進数の各桁は 0～9 なので、長さ 10 のバケット配列を用意
        int[] counter = new int[10];
        int n = nums.Length;
        // 0～9 の各数字の出現回数を数える
        for (int i = 0; i < n; i++) {
            int d = Digit(nums[i], exp); // nums[i] の下から k 桁目を d とする
            counter[d]++;                // 数字 d の出現回数を数える
        }
        // 累積和を求め、出現回数を配列のインデックスに対応する値に変換
        for (int i = 1; i < 10; i++) {
            counter[i] += counter[i - 1];
        }
        // 配列を逆順に走査し、バケットの集計値を使って各要素を res に書き込む
        int[] res = new int[n];
        for (int i = n - 1; i >= 0; i--) {
            int d = Digit(nums[i], exp);
            int j = counter[d] - 1; // 配列内での d のインデックス j を求める
            res[j] = nums[i];       // 現在の要素をインデックス j に書き込む
            counter[d]--;           // d の個数を 1 減らす
        }
        // 結果で元の配列 nums を上書き
        for (int i = 0; i < n; i++) {
            nums[i] = res[i];
        }
    }

    /* 基数ソート */
    void RadixSort(int[] nums) {
        // 配列の最大値から最大桁数を求める
        int m = int.MinValue;
        foreach (int num in nums) {
            if (num > m) m = num;
        }
        // 下位桁から上位桁へ順に走査
        for (int exp = 1; exp <= m; exp *= 10) {
            // 配列要素の下から k 桁目にカウントソートを適用
            // k = 1 -> exp = 1
            // k = 2 -> exp = 10
            // すなわち exp = 10^(k-1)
            CountingSortDigit(nums, exp);
        }
    }

    [Test]
    public void Test() {
        // 基数ソート
        int[] nums = [ 10546151, 35663510, 42865989, 34862445, 81883077,
            88906420, 72429244, 30524779, 82060337, 63832996 ];
        RadixSort(nums);
        Console.WriteLine("基数ソート後の nums = " + string.Join(" ", nums));
    }
}
