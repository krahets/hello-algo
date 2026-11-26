/**
* File: max_capacity.cs
* Created Time: 2023-07-21
* Author: hpstory (hpstory1024@163.com)
*/

namespace hello_algo.chapter_greedy;

public class max_capacity {
    /* 탐욕 알고리즘으로 최대 용량 구하기 */
    int MaxCapacity(int[] ht) {
        // i와 j를 각각 배열의 양 끝에 놓는다
        int i = 0, j = ht.Length - 1;
        // 최대 용량의 초깃값은 0이다
        int res = 0;
        // 두 칸막이가 만날 때까지 탐욕 선택을 반복한다
        while (i < j) {
            // 최대 용량을 갱신한다
            int cap = Math.Min(ht[i], ht[j]) * (j - i);
            res = Math.Max(res, cap);
            // 낮은 칸막이 쪽을 안으로 한 칸 옮긴다
            if (ht[i] < ht[j]) {
                i++;
            } else {
                j--;
            }
        }
        return res;
    }

    [Test]
    public void Test() {
        int[] ht = [3, 8, 5, 2, 7, 7, 3, 4];

        // 탐욕 알고리즘
        int res = MaxCapacity(ht);
        Console.WriteLine("최대 용량: " + res);
    }
}