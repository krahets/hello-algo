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

        // [region]{access_element}
        /* 원소 접근 */
        int num = nums[1]; // 인덱스 1의 원소에 접근한다
        // [endregion]{access_element}
        Console.WriteLine("인덱스 1의 원소에 접근하여 얻은 num = " + num);

        // [region]{update_element}
        /* 원소 갱신 */
        nums[1] = 0; // 인덱스 1의 원소를 0으로 갱신한다
        // [endregion]{update_element}
        Console.WriteLine("인덱스 1의 원소를 0으로 갱신한 후 nums = " + string.Join(",", nums));

        // [region]{clear_list}
        /* 리스트 비우기 */
        nums.Clear();
        // [endregion]{clear_list}
        Console.WriteLine("리스트를 비운 후 nums = " + string.Join(",", nums));

        // [region]{append_element}
        /* 맨 뒤에 원소 추가 */
        nums.Add(1);
        nums.Add(3);
        nums.Add(2);
        nums.Add(5);
        nums.Add(4);
        // [endregion]{append_element}
        Console.WriteLine("원소를 추가한 후 nums = " + string.Join(",", nums));

        // [region]{insert_element}
        /* 중간에 원소 삽입 */
        nums.Insert(3, 6); // 인덱스 3에 숫자 6을 삽입한다
        // [endregion]{insert_element}
        Console.WriteLine("인덱스 3에 숫자 6을 삽입한 후 nums = " + string.Join(",", nums));

        // [region]{remove_element}
        /* 원소 삭제 */
        nums.RemoveAt(3); // 인덱스 3의 원소를 삭제한다
        // [endregion]{remove_element}
        Console.WriteLine("인덱스 3의 원소를 삭제한 후 nums = " + string.Join(",", nums));

        // [region]{iterate_list}
        /* 인덱스를 통해 리스트를 순회한다 */
        int count = 0;
        for (int i = 0; i < nums.Count; i++) {
            count += nums[i];
        }

        /* 리스트의 원소를 직접 순회한다 */
        count = 0;
        foreach (int x in nums) {
            count += x;
        }
        // [endregion]{iterate_list}

        // [region]{concat_list}
        /* 두 리스트 연결 */
        List<int> nums1 = [6, 8, 7, 10, 9];
        nums.AddRange(nums1); // 리스트 nums1을 nums 뒤에 연결한다
        // [endregion]{concat_list}
        Console.WriteLine("리스트 nums1을 nums 뒤에 연결한 후 nums = " + string.Join(",", nums));

        // [region]{sort_list}
        /* 리스트 정렬 */
        nums.Sort(); // 정렬 후 리스트 원소는 작은 값부터 큰 값 순서로 나열된다
        // [endregion]{sort_list}
        Console.WriteLine("리스트를 정렬한 후 nums = " + string.Join(",", nums));
    }
}
