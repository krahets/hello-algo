/**
 * File: list.js
 * Created Time: 2022-12-12
 * Author: Justin (xiefahit@gmail.com)
 */

// [region]{init_list}
/* 初始化串列 */
// 無初始值
const emptyNums = [];
// 有初始值
const nums = [1, 3, 2, 5, 4];
// [endregion]{init_list}
console.log(`串列 nums = ${nums}`);
console.log(`串列 emptyNums = ${emptyNums}`);

// [region]{access_element}
/* 訪問元素 */
const num = nums[1]; // 訪問索引 1 處的元素
// [endregion]{access_element}
console.log(`訪問索引 1 處的元素，得到 num = ${num}`);

// [region]{update_element}
/* 更新元素 */
nums[1] = 0; // 將索引 1 處的元素更新為 0
// [endregion]{update_element}
console.log(`將索引 1 處的元素更新為 0 ，得到 nums = ${nums}`);

// [region]{clear_list}
/* 清空串列 */
nums.length = 0;
// [endregion]{clear_list}
console.log(`清空串列後 nums = ${nums}`);

// [region]{append_element}
/* 在尾部新增元素 */
nums.push(1);
nums.push(3);
nums.push(2);
nums.push(5);
nums.push(4);
// [endregion]{append_element}
console.log(`新增元素後 nums = ${nums}`);

// [region]{insert_element}
/* 在中間插入元素 */
nums.splice(3, 0, 6); // 在索引 3 處插入數字 6
// [endregion]{insert_element}
console.log(`在索引 3 處插入數字 6 ，得到 nums = ${nums}`);

// [region]{remove_element}
/* 刪除元素 */
nums.splice(3, 1); // 刪除索引 3 處的元素
// [endregion]{remove_element}
console.log(`刪除索引 3 處的元素，得到 nums = ${nums}`);

// [region]{iterate_list}
/* 透過索引走訪串列 */
let count = 0;
for (let i = 0; i < nums.length; i++) {
    count += nums[i];
}

/* 直接走訪串列元素 */
count = 0;
for (const x of nums) {
    count += x;
}
// [endregion]{iterate_list}

// [region]{concat_list}
/* 拼接兩個串列 */
const nums1 = [6, 8, 7, 10, 9];
nums.push(...nums1); // 將串列 nums1 拼接到 nums 之後
// [endregion]{concat_list}
console.log(`將串列 nums1 拼接到 nums 之後，得到 nums = ${nums}`);

// [region]{sort_list}
/* 排序串列 */
nums.sort((a, b) => a - b); // 排序後，串列元素從小到大排列
// [endregion]{sort_list}
console.log(`排序串列後 nums = ${nums}`);
