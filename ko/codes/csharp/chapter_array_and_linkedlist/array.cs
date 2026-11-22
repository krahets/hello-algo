// File: array.cs
// Created Time: 2022-12-14
// Author: mingXta (1195669834@qq.com)

namespace hello_algo.chapter_array_and_linkedlist;

public class array {
    /* 원소에 임의 접근 */
    int RandomAccess(int[] nums) {
        Random random = new();
        // 구간 [0, nums.Length)에서 무작위로 수 하나 선택
        int randomIndex = random.Next(nums.Length);
        // 무작위 원소를 가져와 반환한다
        int randomNum = nums[randomIndex];
        return randomNum;
    }

    /* 배열 길이 확장 */
    int[] Extend(int[] nums, int enlarge) {
        // 길이를 확장한 배열을 초기화한다
        int[] res = new int[nums.Length + enlarge];
        // 원래 배열의 모든 원소를 새 배열에 복사한다
        for (int i = 0; i < nums.Length; i++) {
            res[i] = nums[i];
        }
        // 확장한 새 배열을 반환한다
        return res;
    }

    /* 배열의 인덱스 index에 원소 num 삽입 */
    void Insert(int[] nums, int num, int index) {
        // 인덱스 index와 그 뒤에 있는 모든 원소를 한 칸씩 뒤로 이동한다
        for (int i = nums.Length - 1; i > index; i--) {
            nums[i] = nums[i - 1];
        }
        // index 위치의 원소에 num을 대입한다
        nums[index] = num;
    }

    /* 인덱스 index에 있는 원소 삭제 */
    void Remove(int[] nums, int index) {
        // 인덱스 index 뒤에 있는 모든 원소를 한 칸씩 앞으로 이동한다
        for (int i = index; i < nums.Length - 1; i++) {
            nums[i] = nums[i + 1];
        }
    }

    /* 배열 순회 */
    void Traverse(int[] nums) {
        int count = 0;
        // 인덱스를 통해 배열을 순회한다
        for (int i = 0; i < nums.Length; i++) {
            count += nums[i];
        }
        // 배열의 원소를 직접 순회한다
        foreach (int num in nums) {
            count += num;
        }
    }

    /* 배열에서 지정한 원소 탐색 */
    int Find(int[] nums, int target) {
        for (int i = 0; i < nums.Length; i++) {
            if (nums[i] == target)
                return i;
        }
        return -1;
    }

    /* 보조 함수: 배열을 문자열로 변환 */
    string ToString(int[] nums) {
        return string.Join(",", nums);
    }


    [Test]
    public void Test() {
        // 배열 초기화
        int[] arr = new int[5];
        Console.WriteLine("배열 arr = " + ToString(arr));
        int[] nums = [1, 3, 2, 5, 4];
        Console.WriteLine("배열 nums = " + ToString(nums));

        // 임의 접근
        int randomNum = RandomAccess(nums);
        Console.WriteLine("nums에서 무작위로 가져온 원소 " + randomNum);

        // 길이 확장
        nums = Extend(nums, 3);
        Console.WriteLine("배열 길이를 8로 확장한 후 nums = " + ToString(nums));

        // 원소 삽입
        Insert(nums, 6, 3);
        Console.WriteLine("인덱스 3에 숫자 6을 삽입한 후 nums = " + ToString(nums));

        // 원소 삭제
        Remove(nums, 2);
        Console.WriteLine("인덱스 2의 원소를 삭제한 후 nums = " + ToString(nums));

        // 배열 순회
        Traverse(nums);

        // 원소 탐색 
        int index = Find(nums, 3);
        Console.WriteLine("nums에서 원소 3을 탐색하여 얻은 인덱스 = " + index);
    }
}
