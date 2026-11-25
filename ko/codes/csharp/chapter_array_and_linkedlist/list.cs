/**
 * File: list.cs
 * Created Time: 2022-12-23
 * Author: haptear (haptear@hotmail.com)
 */

namespace hello_algo.chapter_array_and_linkedlist;

public class list {
    [Test]
    public void Test() {

        /* 리스트 초기화 */
        int[] numbers = [1, 3, 2, 5, 4];
        List<int> nums = [.. numbers];
        Console.WriteLine("리스트 nums = " + string.Join(",", nums));

        /* 원소 접근 */
        int num = nums[1];
        Console.WriteLine("인덱스 1의 원소를 읽은 결과 num = " + num);

        /* 원소 갱신 */
        nums[1] = 0;
        Console.WriteLine("인덱스 1의 원소를 0으로 바꾼 후 nums = " + string.Join(",", nums));

        /* 리스트 비우기 */
        nums.Clear();
        Console.WriteLine("리스트를 비운 후 nums = " + string.Join(",", nums));

        /* 맨 뒤에 원소 추가 */
        nums.Add(1);
        nums.Add(3);
        nums.Add(2);
        nums.Add(5);
        nums.Add(4);
        Console.WriteLine("원소 추가 후 nums = " + string.Join(",", nums));

        /* 중간에 원소 삽입 */
        nums.Insert(3, 6);
        Console.WriteLine("인덱스 3에 숫자 6을 삽입한 후 nums = " + string.Join(",", nums));

        /* 원소 삭제 */
        nums.RemoveAt(3);
        Console.WriteLine("인덱스 3의 원소를 삭제한 후 nums = " + string.Join(",", nums));

        /* 인덱스로 리스트 순회 */
        int count = 0;
        for (int i = 0; i < nums.Count; i++) {
            count += nums[i];
        }
        /* 리스트 원소를 직접 순회 */
        count = 0;
        foreach (int x in nums) {
            count += x;
        }

        /* 두 리스트 이어 붙이기 */
        List<int> nums1 = [6, 8, 7, 10, 9];
        nums.AddRange(nums1);
        Console.WriteLine("nums 뒤에 리스트 nums1을 이어 붙인 후 nums = " + string.Join(",", nums));

        /* 리스트 정렬 */
        nums.Sort(); // 정렬 후 리스트 원소는 오름차순으로 배열된다.
        Console.WriteLine("리스트 정렬 후 nums = " + string.Join(",", nums));
    }
}
