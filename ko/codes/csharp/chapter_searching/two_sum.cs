/**
 * File: two_sum.cs
 * Created Time: 2022-12-23
 * Author: haptear (haptear@hotmail.com)
 */

namespace hello_algo.chapter_searching;

public class two_sum {
    /* 방법 1: 완전 열거 */
    int[] TwoSumBruteForce(int[] nums, int target) {
        int size = nums.Length;
        // 이중 반복문이며 시간 복잡도는 O(n^2)이다
        for (int i = 0; i < size - 1; i++) {
            for (int j = i + 1; j < size; j++) {
                if (nums[i] + nums[j] == target)
                    return [i, j];
            }
        }
        return [];
    }

    /* 방법 2: 보조 해시 테이블 */
    int[] TwoSumHashTable(int[] nums, int target) {
        int size = nums.Length;
        // 보조 해시 테이블의 공간 복잡도는 O(n)이다
        Dictionary<int, int> dic = [];
        // 단일 반복문이며 시간 복잡도는 O(n)이다
        for (int i = 0; i < size; i++) {
            if (dic.ContainsKey(target - nums[i])) {
                return [dic[target - nums[i]], i];
            }
            dic.Add(nums[i], i);
        }
        return [];
    }

    [Test]
    public void Test() {
        // ======= 테스트 사례 =======
        int[] nums = [2, 7, 11, 15];
        int target = 13;

        // ====== 실행 코드 ======
        // 방법 1
        int[] res = TwoSumBruteForce(nums, target);
        Console.WriteLine("방법 1 res = " + string.Join(",", res));
        // 방법 2
        res = TwoSumHashTable(nums, target);
        Console.WriteLine("방법 2 res = " + string.Join(",", res));
    }
}
