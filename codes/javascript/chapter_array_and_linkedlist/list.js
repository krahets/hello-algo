/**
 * File: list.js
 * Created Time: 2022-12-12
 * Author: Justin (xiefahit@gmail.com)
 */

// [region]{init_list}
/* 初始化列表 */
// 无初始值
const emptyNums = [];
// 有初始值
const nums = [1, 3, 2, 5, 4];
// [endregion]{init_list}
console.log(`列表 nums = ${nums}`);
console.log(`列表 emptyNums = ${emptyNums}`);

// [region]{access_element}
/* 访问元素 */
const num = nums[1]; // 访问索引 1 处的元素
// [endregion]{access_element}
console.log(`访问索引 1 处的元素，得到 num = ${num}`);

// [region]{update_element}
/* 更新元素 */
nums[1] = 0; // 将索引 1 处的元素更新为 0
// [endregion]{update_element}
console.log(`将索引 1 处的元素更新为 0 ，得到 nums = ${nums}`);

// [region]{clear_list}
/* 清空列表 */
nums.length = 0;
// [endregion]{clear_list}
console.log(`清空列表后 nums = ${nums}`);

// [region]{append_element}
/* 在尾部添加元素 */
nums.push(1);
nums.push(3);
nums.push(2);
nums.push(5);
nums.push(4);
// [endregion]{append_element}
console.log(`添加元素后 nums = ${nums}`);

// [region]{insert_element}
/* 在中间插入元素 */
nums.splice(3, 0, 6); // 在索引 3 处插入数字 6
// [endregion]{insert_element}
console.log(`在索引 3 处插入数字 6 ，得到 nums = ${nums}`);

// [region]{remove_element}
/* 删除元素 */
nums.splice(3, 1); // 删除索引 3 处的元素
// [endregion]{remove_element}
console.log(`删除索引 3 处的元素，得到 nums = ${nums}`);

// [region]{iterate_list}
/* 通过索引遍历列表 */
let count = 0;
for (let i = 0; i < nums.length; i++) {
    count += nums[i];
}

/* 直接遍历列表元素 */
count = 0;
for (const x of nums) {
    count += x;
}
// [endregion]{iterate_list}

// [region]{concat_list}
/* 拼接两个列表 */
const nums1 = [6, 8, 7, 10, 9];
nums.push(...nums1); // 将列表 nums1 拼接到 nums 之后
// [endregion]{concat_list}
console.log(`将列表 nums1 拼接到 nums 之后，得到 nums = ${nums}`);

// [region]{sort_list}
/* 排序列表 */
nums.sort((a, b) => a - b); // 排序后，列表元素从小到大排列
// [endregion]{sort_list}
console.log(`排序列表后 nums = ${nums}`);
