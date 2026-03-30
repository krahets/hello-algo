// File: array.cs
// Created Time: 2022-12-14
// Author: mingXta (1195669834@qq.com)

namespace hello_algo.chapter_array_and_linkedlist;

public class array {
    /* 要素へランダムアクセス */
    int RandomAccess(int[] nums) {
        Random random = new();
        // 区間 [0, nums.Length) からランダムに数字を 1 つ選ぶ
        int randomIndex = random.Next(nums.Length);
        // ランダムな要素を取得して返す
        int randomNum = nums[randomIndex];
        return randomNum;
    }

    /* 配列長を拡張する */
    int[] Extend(int[] nums, int enlarge) {
        // 拡張後の長さを持つ配列を初期化する
        int[] res = new int[nums.Length + enlarge];
        // 元の配列の全要素を新しい配列にコピー
        for (int i = 0; i < nums.Length; i++) {
            res[i] = nums[i];
        }
        // 拡張後の新しい配列を返す
        return res;
    }

    /* 配列の index 番目に要素 num を挿入 */
    void Insert(int[] nums, int num, int index) {
        // インデックス index 以降の全要素を 1 つ後ろへ移動する
        for (int i = nums.Length - 1; i > index; i--) {
            nums[i] = nums[i - 1];
        }
        // index の要素に num を代入する
        nums[index] = num;
    }

    /* index の要素を削除する */
    void Remove(int[] nums, int index) {
        // インデックス index より後ろの全要素を 1 つ前へ移動する
        for (int i = index; i < nums.Length - 1; i++) {
            nums[i] = nums[i + 1];
        }
    }

    /* 配列を走査 */
    void Traverse(int[] nums) {
        int count = 0;
        // インデックスで配列を走査
        for (int i = 0; i < nums.Length; i++) {
            count += nums[i];
        }
        // 配列要素を直接走査
        foreach (int num in nums) {
            count += num;
        }
    }

    /* 配列内で指定要素を探す */
    int Find(int[] nums, int target) {
        for (int i = 0; i < nums.Length; i++) {
            if (nums[i] == target)
                return i;
        }
        return -1;
    }

    /* 補助関数：配列を文字列に変換 */
    string ToString(int[] nums) {
        return string.Join(",", nums);
    }


    [Test]
    public void Test() {
        // 配列を初期化
        int[] arr = new int[5];
        Console.WriteLine("配列 arr = " + ToString(arr));
        int[] nums = [1, 3, 2, 5, 4];
        Console.WriteLine("配列 nums = " + ToString(nums));

        // ランダムアクセス
        int randomNum = RandomAccess(nums);
        Console.WriteLine("nums からランダムな要素を取得 " + randomNum);

        // 長さを拡張
        nums = Extend(nums, 3);
        Console.WriteLine("配列の長さを 8 まで拡張すると nums = " + ToString(nums));

        // 要素を挿入する
        Insert(nums, 6, 3);
        Console.WriteLine("インデックス 3 に数値 6 を挿入すると nums = " + ToString(nums));

        // 要素を削除
        Remove(nums, 2);
        Console.WriteLine("インデックス 2 の要素を削除すると nums = " + ToString(nums));

        // 配列を走査
        Traverse(nums);

        // 要素を探索する
        int index = Find(nums, 3);
        Console.WriteLine("nums 内で要素 3 を検索するとインデックス = " + index);
    }
}
