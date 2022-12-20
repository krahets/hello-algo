/*
 * File: hash_map.ts
 * Created Time: 2022-12-20
 * Author: Daniel (better.sunjian@gmail.com)
 */

import ArrayHashMap from './array_hash_map';

class HashMap {

  constructor() {
    /* 初始化哈希表 */
    const map = new ArrayHashMap();
    /* 添加操作 */
    // 在哈希表中添加键值对 (key, value)
    map.put(12836, '小哈');
    map.put(15937, '小啰');
    map.put(16750, '小算');
    map.put(13276, '小法');
    map.put(10583, '小鸭');
    console.info('\n添加完成后，哈希表为\nKey -> Value');
    map.print();

    /* 查询操作 */
    // 向哈希表输入键 key ，得到值 value
    let name = map.get(15937);
    console.info('\n输入学号 15937 ，查询到姓名 ' + name);

    /* 删除操作 */
    // 在哈希表中删除键值对 (key, value)
    map.remove(10583);
    console.info('\n删除 10583 后，哈希表为\nKey -> Value');
    map.print();

    /* 遍历哈希表 */
    console.info('\n遍历键值对 Key->Value');
    for (const entry of map.entrySet()) {
      console.info(entry.key + ' -> ' + entry.val);
    }
    console.info('\n单独遍历键 Key');
    for (const key of map.keySet()) {
      console.info(key);
    }
    console.info('\n单独遍历值 Value');
    for (const val of map.valueSet()) {
      console.info(val);
    }
  }
}

export default HashMap;