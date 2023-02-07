/*
 * File: list.rs
 * Created Time: 2023-01-18
 * Author: xBLACICEx (xBLACKICEx@outlook.com), sjinzh (sjinzh@gmail.com)
 */

 include!("../include/include.rs");

/* Driver Code */
 fn main() {
    //  初始化列表
    let mut list: Vec<i32> = vec![ 1, 3, 2, 5, 4 ];
    print!("列表 list = ");
    print_util::print_array(&list);
 
    //  访问元素
    let num = list[1];
    println!("\n访问索引 1 处的元素，得到 num = {num}");
 
    //  更新元素
    list[1] = 0;
    print!("将索引 1 处的元素更新为 0 ，得到 list = ");
    print_util::print_array(&list);
 
    //  清空列表
    list.clear();
    print!("\n清空列表后 list = ");
    print_util::print_array(&list);
 
    //  尾部添加元素
    list.push(1);
    list.push(3);
    list.push(2);
    list.push(5);
    list.push(4);
    print!("\n添加元素后 list = ");
    print_util::print_array(&list);
 
    //  中间插入元素
    list.insert(3, 6);
    print!("\n在索引 3 处插入数字 6 ，得到 list = ");
    print_util::print_array(&list);
 
    //  删除元素
    list.remove(3);
    print!("\n删除索引 3 处的元素，得到 list = ");
    print_util::print_array(&list);
 
    //  通过索引遍历列表
    let mut _count = 0;
    for _ in 0..list.len() {
    _count += 1;
    }
 
    //  直接遍历列表元素
    _count = 0;
    for _ in &list {
    _count += 1;
    } // 或者
    // list.iter().for_each(|_| _count += 1);
    // let _count = list.iter().fold(0, |_count, _| _count + 1);
 
    //  拼接两个列表
    let mut list1 = vec![ 6, 8, 7, 10, 9 ];
    list.append(&mut list1);   // append（移动） 之后 list1 为空！
    // list.extend(&list1);    // extend（借用） list1 能继续使用 
    print!("\n将列表 list1 拼接到 list 之后，得到 list = ");
    print_util::print_array(&list);
 
    //  排序列表
    list.sort();
    print!("\n排序列表后 list = ");
    print_util::print_array(&list);
 }