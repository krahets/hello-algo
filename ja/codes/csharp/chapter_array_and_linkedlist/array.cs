// File: array.cs
// Created Time: 2022-12-14
// Author: mingXta (1195669834@qq.com)

namespace hello_algo.chapter_array_and_linkedlist;

public class array {
    /* 要素にランダムアクセスする */
    int RandomAccess(int[] nums) {
        Random random = new();
        // 区間 [0, nums.Length) から数値をランダムに 1 つ選ぶ
        int randomIndex = random.Next(nums.Length);
        // ランダムに選んだ要素を取得して返す
        int randomNum = nums[randomIndex];
        return randomNum;
    }

    /* 配列の長さを拡張する */
    int[] Extend(int[] nums, int enlarge) {
        // 拡張後の長さの配列を初期化する
        int[] res = new int[nums.Length + enlarge];
        // 元の配列の全要素を新しい配列にコピーする
        for (int i = 0; i < nums.Length; i++) {
            res[i] = nums[i];
        }
        // 拡張後の新しい配列を返す
        return res;
    }

    /* 配列のインデックス index に要素 num を挿入する */
    void Insert(int[] nums, int num, int index) {
        // インデックス index 以降の全要素を 1 つ後ろにずらす
        for (int i = nums.Length - 1; i > index; i--) {
            nums[i] = nums[i - 1];
        }
        // インデックス index の要素に num を代入する
        nums[index] = num;
    }

    /* インデックス index の要素を削除する */
    void Remove(int[] nums, int index) {
        // インデックス index より後の全要素を 1 つ前にずらす
        for (int i = index; i < nums.Length - 1; i++) {
            nums[i] = nums[i + 1];
        }
    }

    /* 配列を走査する */
    void Traverse(int[] nums) {
        int count = 0;
        // インデックスを使って配列を走査する
        for (int i = 0; i < nums.Length; i++) {
            count += nums[i];
        }
        // 配列の要素を直接走査する
        foreach (int num in nums) {
            count += num;
        }
    }

    /* 配列から指定した要素を探索する */
    int Find(int[] nums, int target) {
        for (int i = 0; i < nums.Length; i++) {
            if (nums[i] == target)
                return i;
        }
        return -1;
    }

    /* 補助関数：配列を文字列に変換する */
    string ToString(int[] nums) {
        return string.Join(",", nums);
    }


    [Test]
    public void Test() {
        // 配列を初期化する
        int[] arr = new int[5];
        Console.WriteLine("配列 arr = " + ToString(arr));
        int[] nums = [1, 3, 2, 5, 4];
        Console.WriteLine("配列 nums = " + ToString(nums));

        // ランダムアクセス
        int randomNum = RandomAccess(nums);
        Console.WriteLine("nums からランダムに取得した要素 " + randomNum);

        // 長さの拡張
        nums = Extend(nums, 3);
        Console.WriteLine("配列の長さを 8 に拡張した結果 nums = " + ToString(nums));

        // 要素を挿入する
        Insert(nums, 6, 3);
        Console.WriteLine("インデックス 3 に数値 6 を挿入した結果 nums = " + ToString(nums));

        // 要素を削除する
        Remove(nums, 2);
        Console.WriteLine("インデックス 2 の要素を削除した結果 nums = " + ToString(nums));

        // 配列を走査する
        Traverse(nums);

        // 要素を探索する 
        int index = Find(nums, 3);
        Console.WriteLine("nums から要素 3 を探索した結果のインデックス = " + index);
    }
}
