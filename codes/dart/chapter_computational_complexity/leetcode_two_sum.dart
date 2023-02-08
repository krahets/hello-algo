/* 方法一： 暴力枚举 */
import 'dart:collection';

class SolutionBruteForce {
  List<int> twoSum(List<int> nums, int target) {
    int size = nums.length;
    for (var i = 0; i < size - 1; i++) {
      for (var j = i + 1; j < size; j++) {
        if (nums[i] + nums[j] == target) return [i, j];
      }
    }
    return [0];
  }
}

/* 方法二： 辅助哈希表 */
class SolutionHashMap {
  List<int> twoSum(List<int> nums, int target) {
    int size = nums.length;
    Map<int, int> dic = HashMap();
    for (var i = 0; i < size; i++) {
      if (dic.containsKey(target - nums[i])) {
        return [dic[target - nums[i]]!, i];
      }
      dic.putIfAbsent(nums[i], () => i);
    }
    return [0];
  }
}

int main() {
  // ======= Test Case =======
  List<int> nums = [2, 7, 11, 15];
  int target = 9;

  // ====== Driver Code ======
  // 方法一
  SolutionBruteForce slt1 = SolutionBruteForce();
  List<int> res = slt1.twoSum(nums, target);
  print('方法一 res = $res');
  // 方法二
  SolutionHashMap slt2 = SolutionHashMap();
  res = slt2.twoSum(nums, target);
  print('方法二 res = $res');
  return 0;
}
