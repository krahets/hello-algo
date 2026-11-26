/**
 * File: worst_best_time_complexity.cs
 * Created Time: 2022-12-23
 * Author: haptear (haptear@hotmail.com)
 */

namespace hello_algo.chapter_computational_complexity;

public class worst_best_time_complexity {
    /* { 1, 2, ..., n }을 원소로 갖는 배열을 만들고 순서를 섞는다 */
    int[] RandomNumbers(int n) {
        int[] nums = new int[n];
        // 배열 nums = { 1, 2, 3, ..., n }을 만든다
        for (int i = 0; i < n; i++) {
            nums[i] = i + 1;
        }

        // 배열의 원소를 무작위로 섞는다
        for (int i = 0; i < nums.Length; i++) {
            int index = new Random().Next(i, nums.Length);
            (nums[i], nums[index]) = (nums[index], nums[i]);
        }
        return nums;
    }

    /* 배열 nums에서 1의 인덱스를 찾는다 */
    int FindOne(int[] nums) {
        for (int i = 0; i < nums.Length; i++) {
            // 1이 배열 맨 앞에 있으면 최선 시간 복잡도 O(1)이 된다
            // 1이 배열 맨 뒤에 있으면 최악 시간 복잡도 O(n)이 된다
            if (nums[i] == 1)
                return i;
        }
        return -1;
    }


    /* 실행 예제 */
    [Test]
    public void Test() {
        for (int i = 0; i < 10; i++) {
            int n = 100;
            int[] nums = RandomNumbers(n);
            int index = FindOne(nums);
            Console.WriteLine("\n배열 [ 1, 2, ..., n ]을 섞은 결과 = " + string.Join(",", nums));
            Console.WriteLine("숫자 1의 인덱스 = " + index);
        }
    }
}
