// File: array.cs
// Created Time: 2022-12-14
// Author: mingXta (1195669834@qq.com)

namespace hello_algo.chapter_array_and_linkedlist;

public class array {
    /* 隨機訪問元素 */
    int RandomAccess(int[] nums) {
        Random random = new();
        // 在區間 [0, nums.Length) 中隨機抽取一個數字
        int randomIndex = random.Next(nums.Length);
        // 獲取並返回隨機元素
        int randomNum = nums[randomIndex];
        return randomNum;
    }

    /* 擴展陣列長度 */
    int[] Extend(int[] nums, int enlarge) {
        // 初始化一個擴展長度後的陣列
        int[] res = new int[nums.Length + enlarge];
        // 將原陣列中的所有元素複製到新陣列
        for (int i = 0; i < nums.Length; i++) {
            res[i] = nums[i];
        }
        // 返回擴展後的新陣列
        return res;
    }

    /* 在陣列的索引 index 處插入元素 num */
    void Insert(int[] nums, int num, int index) {
        // 把索引 index 以及之後的所有元素向後移動一位
        for (int i = nums.Length - 1; i > index; i--) {
            nums[i] = nums[i - 1];
        }
        // 將 num 賦給 index 處的元素
        nums[index] = num;
    }

    /* 刪除索引 index 處的元素 */
    void Remove(int[] nums, int index) {
        // 把索引 index 之後的所有元素向前移動一位
        for (int i = index; i < nums.Length - 1; i++) {
            nums[i] = nums[i + 1];
        }
    }

    /* 走訪陣列 */
    void Traverse(int[] nums) {
        int count = 0;
        // 透過索引走訪陣列
        for (int i = 0; i < nums.Length; i++) {
            count += nums[i];
        }
        // 直接走訪陣列元素
        foreach (int num in nums) {
            count += num;
        }
    }

    /* 在陣列中查詢指定元素 */
    int Find(int[] nums, int target) {
        for (int i = 0; i < nums.Length; i++) {
            if (nums[i] == target)
                return i;
        }
        return -1;
    }

    /* 輔助函式,陣列轉字串 */
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

        // 隨機訪問
        int randomNum = RandomAccess(nums);
        Console.WriteLine("在 nums 中獲取隨機元素 " + randomNum);

        // 長度擴展
        nums = Extend(nums, 3);
        Console.WriteLine("將陣列長度擴展至 8 ，得到 nums = " + ToString(nums));

        // 插入元素
        Insert(nums, 6, 3);
        Console.WriteLine("在索引 3 處插入數字 6 ，得到 nums = " + ToString(nums));

        // 刪除元素
        Remove(nums, 2);
        Console.WriteLine("刪除索引 2 處的元素，得到 nums = " + ToString(nums));

        // 走訪陣列
        Traverse(nums);

        // 查詢元素 
        int index = Find(nums, 3);
        Console.WriteLine("在 nums 中查詢元素 3 ，得到索引 = " + index);
    }
}
