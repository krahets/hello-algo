/**
 * File: list.ts
 * Created Time: 2022-12-10
 * Author: Justin (xiefahit@gmail.com)
 */

/* 初始化列表 */
const list: number[] = [1, 3, 2, 5, 4];
console.log(`列表 list = ${list}`);

/* 访问元素 */
const num: number = list[1];
console.log(`访问索引 1 处的元素，得到 num = ${num}`);

/* 更新元素 */
list[1] = 0;
console.log(`将索引 1 处的元素更新为 0 ，得到 list = ${list}`);

/* 清空列表 */
list.length = 0;
console.log(`清空列表后 list = ${list}`);

/* 尾部添加元素 */
list.push(1);
list.push(3);
list.push(2);
list.push(5);
list.push(4);
console.log(`添加元素后 list = ${list}`);

/* 中间插入元素 */
list.splice(3, 0, 6);
console.log(`在索引 3 处插入数字 6 ，得到 list = ${list}`);

/* 删除元素 */
list.splice(3, 1);
console.log(`删除索引 3 处的元素，得到 list = ${list}`);

/* 通过索引遍历列表 */
let count = 0;
for (let i = 0; i < list.length; i++) {
    count++;
}

/* 直接遍历列表元素 */
count = 0;
for (const n of list) {
    count++;
}

/* 拼接两个列表 */
const list1: number[] = [6, 8, 7, 10, 9];
list.push(...list1);
console.log(`将列表 list1 拼接到 list 之后，得到 list = ${list}`);

/* 排序列表 */
list.sort((a, b) => a - b);
console.log(`排序列表后 list = ${list}`);

export {};
