// File: array.cs
// Created Time: 2022-12-14
// Author: mingXta (1195669834@qq.com)

namespace hello_algo.chapter_array_and_linkedlist;

public class array {
    /* 隨機存取元素 */
    int RandomAccess(int[] nums) {
        Random random = new();
        // 從區間 [0, nums.Length) 隨機選取一個數
        int randomIndex = random.Next(nums.Length);
        // 取得並回傳隨機選出的元素
        int randomNum = nums[randomIndex];
        return randomNum;
    }

    /* 增加陣列長度 */
    int[] Extend(int[] nums, int enlarge) {
        // 初始化加長後的陣列
        int[] res = new int[nums.Length + enlarge];
        // 將原陣列的所有元素複製到新陣列
        for (int i = 0; i < nums.Length; i++) {
            res[i] = nums[i];
        }
        // 回傳加長後的新陣列
        return res;
    }

    /* 在陣列的索引 index 處插入元素 num */
    void Insert(int[] nums, int num, int index) {
        // 將索引 index 起的所有元素往後移一格
        for (int i = nums.Length - 1; i > index; i--) {
            nums[i] = nums[i - 1];
        }
        // 將 num 指派給索引 index 處的元素
        nums[index] = num;
    }

    /* 刪除索引 index 處的元素 */
    void Remove(int[] nums, int index) {
        // 將索引 index 之後的所有元素往前移一格
        for (int i = index; i < nums.Length - 1; i++) {
            nums[i] = nums[i + 1];
        }
    }

    /* 走訪陣列 */
    void Traverse(int[] nums) {
        int count = 0;
        // 依索引走訪陣列
        for (int i = 0; i < nums.Length; i++) {
            count += nums[i];
        }
        // 直接走訪陣列中的元素
        foreach (int num in nums) {
            count += num;
        }
    }

    /* 在陣列中尋找指定元素 */
    int Find(int[] nums, int target) {
        for (int i = 0; i < nums.Length; i++) {
            if (nums[i] == target)
                return i;
        }
        return -1;
    }

    /* 輔助函式：將陣列轉為字串 */
    string ToString(int[] nums) {
        return string.Join(",", nums);
    }


    [Test]
    public void Test() {
        // 初始化陣列
        int[] arr = new int[5];
        Console.WriteLine("陣列 arr = " + ToString(arr));
        int[] nums = [1, 3, 2, 5, 4];
        Console.WriteLine("陣列 nums = " + ToString(nums));

        // 隨機存取
        int randomNum = RandomAccess(nums);
        Console.WriteLine("從 nums 隨機取得的元素為 " + randomNum);

        // 增加長度
        nums = Extend(nums, 3);
        Console.WriteLine("將陣列長度增加至 8，得到 nums = " + ToString(nums));

        // 插入元素
        Insert(nums, 6, 3);
        Console.WriteLine("在索引 3 處插入數字 6，得到 nums = " + ToString(nums));

        // 刪除元素
        Remove(nums, 2);
        Console.WriteLine("刪除索引 2 處的元素，得到 nums = " + ToString(nums));

        // 走訪陣列
        Traverse(nums);

        // 尋找元素 
        int index = Find(nums, 3);
        Console.WriteLine("在 nums 中尋找元素 3，得到索引 = " + index);
    }
}
