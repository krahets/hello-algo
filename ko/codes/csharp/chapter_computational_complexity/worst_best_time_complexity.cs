/**
 * File: worst_best_time_complexity.cs
 * Created Time: 2022-12-23
 * Author: haptear (haptear@hotmail.com)
 */

namespace hello_algo.chapter_computational_complexity;

public class worst_best_time_complexity {
    /* 원소가 { 1, 2, ..., n }이며 순서가 섞인 배열 생성 */
    int[] RandomNumbers(int n) {
        int[] nums = new int[n];
        // 배열 nums = { 1, 2, 3, ..., n }을 생성한다
        for (int i = 0; i < n; i++) {
            nums[i] = i + 1;
        }

        // 배열 원소를 무작위로 섞는다
        for (int i = 0; i < nums.Length; i++) {
            int index = new Random().Next(i, nums.Length);
            (nums[i], nums[index]) = (nums[index], nums[i]);
        }
        return nums;
    }

    /* 배열 nums에서 숫자 1이 있는 인덱스 탐색 */
    int FindOne(int[] nums) {
        for (int i = 0; i < nums.Length; i++) {
            // 원소 1이 배열 맨 앞에 있으면 최선 시간 복잡도 O(1)에 도달한다
            // 원소 1이 배열 맨 뒤에 있으면 최악 시간 복잡도 O(n)에 도달한다
            if (nums[i] == 1)
                return i;
        }
        return -1;
    }


    /* 실행 코드 */
    [Test]
    public void Test() {
        for (int i = 0; i < 10; i++) {
            int n = 100;
            int[] nums = RandomNumbers(n);
            int index = FindOne(nums);
            Console.WriteLine("\n배열 [ 1, 2, ..., n ]을 섞은 결과 = " + string.Join(",", nums));
            Console.WriteLine("숫자 1의 인덱스 " + index);
        }
    }
}
