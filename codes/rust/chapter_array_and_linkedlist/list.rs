/**
 * File: array.rs
 * Created Time: 2023-01-18
 * Author: xBLACICEx (xBLACKICEx@outlook.com)
 */

#[allow(unused_variables)]

/* Driver Code */
fn main() {
    /* 初始化列表 */
    let mut list: Vec<i32> = vec![1, 3, 2, 5, 4];
    println!("列表 list = {:?}", list);

    /* 访问元素 */
    let num = list[1];
    println!("访问索引 1 处的元素，得到 num = {num}");

    /* 更新元素 */
    list[1] = 0;
    println!("将索引 1 处的元素更新为 0 ，得到 list = {:?}", list);

    /* 清空列表 */
    list.clear();
    println!("清空列表后 list = {:?}", list);

    /* 尾部添加元素 */
    list.push(1);
    list.push(3);
    list.push(2);
    list.push(5);
    list.push(4);
    println!("添加元素后 list = {:?}", list);

    /* 中间插入元素 */
    list.insert(3, 6);
    println!("在索引 3 处插入数字 6 ，得到 list = {:?}", list);

    /* 删除元素 */
    list.remove(3);
    println!("删除索引 3 处的元素，得到 list = {:?}", list);

    /* 通过索引遍历列表 */
    let mut count = 0;
    for _ in 0..list.len() {
        count += 1;
    }

    /* 直接遍历列表元素 */
    count = 0;
    for _ in &list {
        count += 1;
    } // 或者
    // list.iter().for_each(|_| count += 1);
    // let count = list.iter().fold(0, |count, _| count + 1);

    /* 拼接两个列表 */
    let mut list1 = vec![6, 8, 7, 10, 9];
    list.append(&mut list1); // append（移动） 之后 list1 为空！
    // list.extend(&list1); // extend（借用） list1 能继续使用 

    println!("将列表 list1 拼接到 list 之后，得到 list = {:?}", list);

    /* 排序列表 */
    list.sort();
    println!("排序列表后 list = {:?}", list);
}