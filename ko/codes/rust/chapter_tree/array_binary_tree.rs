/*
 * File: array_binary_tree.rs
 * Created Time: 2023-07-25
 * Author: night-cruise (2586447362@qq.com)
 */

use hello_algo_rust::include::{print_util, tree_node};

/* 배열로 표현한 이진 트리 클래스 */
struct ArrayBinaryTree {
    tree: Vec<Option<i32>>,
}

impl ArrayBinaryTree {
    /* 생성자 */
    fn new(arr: Vec<Option<i32>>) -> Self {
        Self { tree: arr }
    }

    /* 리스트 용량 */
    fn size(&self) -> i32 {
        self.tree.len() as i32
    }

    /* 인덱스가 i인 노드의 값 반환 */
    fn val(&self, i: i32) -> Option<i32> {
        // 인덱스가 범위를 벗어나면 빈칸을 나타내는 None을 반환한다
        if i < 0 || i >= self.size() {
            None
        } else {
            self.tree[i as usize]
        }
    }

    /* 인덱스가 i인 노드의 왼쪽 자식 노드 인덱스 반환 */
    fn left(&self, i: i32) -> i32 {
        2 * i + 1
    }

    /* 인덱스가 i인 노드의 오른쪽 자식 노드 인덱스 반환 */
    fn right(&self, i: i32) -> i32 {
        2 * i + 2
    }

    /* 인덱스가 i인 노드의 부모 노드 인덱스 반환 */
    fn parent(&self, i: i32) -> i32 {
        (i - 1) / 2
    }

    /* 레벨 순서 순회 */
    fn level_order(&self) -> Vec<i32> {
        self.tree.iter().filter_map(|&x| x).collect()
    }

    /* 깊이 우선 순회 */
    fn dfs(&self, i: i32, order: &'static str, res: &mut Vec<i32>) {
        if self.val(i).is_none() {
            return;
        }
        let val = self.val(i).unwrap();
        // 전위 순회
        if order == "pre" {
            res.push(val);
        }
        self.dfs(self.left(i), order, res);
        // 중위 순회
        if order == "in" {
            res.push(val);
        }
        self.dfs(self.right(i), order, res);
        // 후위 순회
        if order == "post" {
            res.push(val);
        }
    }

    /* 전위 순회 */
    fn pre_order(&self) -> Vec<i32> {
        let mut res = vec![];
        self.dfs(0, "pre", &mut res);
        res
    }

    /* 중위 순회 */
    fn in_order(&self) -> Vec<i32> {
        let mut res = vec![];
        self.dfs(0, "in", &mut res);
        res
    }

    /* 후위 순회 */
    fn post_order(&self) -> Vec<i32> {
        let mut res = vec![];
        self.dfs(0, "post", &mut res);
        res
    }
}

/* 실행 코드 */
fn main() {
    // 이진 트리 초기화
    // 여기서는 배열로부터 이진 트리를 바로 생성하는 함수를 사용한다
    let arr = vec![
        Some(1),
        Some(2),
        Some(3),
        Some(4),
        None,
        Some(6),
        Some(7),
        Some(8),
        Some(9),
        None,
        None,
        Some(12),
        None,
        None,
        Some(15),
    ];

    let root = tree_node::vec_to_tree(arr.clone()).unwrap();
    println!("\n이진 트리 초기화\n");
    println!("이진 트리의 배열 표현:");
    println!(
        "[{}]",
        arr.iter()
            .map(|&val| if let Some(val) = val {
                format!("{val}")
            } else {
                "null".to_string()
            })
            .collect::<Vec<String>>()
            .join(", ")
    );
    println!("이진 트리의 연결 리스트 표현:");
    print_util::print_tree(&root);

    // 배열로 표현한 이진 트리 클래스
    let abt = ArrayBinaryTree::new(arr);

    // 노드 접근
    let i = 1;
    let l = abt.left(i);
    let r = abt.right(i);
    let p = abt.parent(i);
    println!(
        "\n현재 노드의 인덱스: {}, 값: {}",
        i,
        if let Some(val) = abt.val(i) {
            format!("{val}")
        } else {
            "null".to_string()
        }
    );
    println!(
        "왼쪽 자식 노드의 인덱스: {}, 값: {}",
        l,
        if let Some(val) = abt.val(l) {
            format!("{val}")
        } else {
            "null".to_string()
        }
    );
    println!(
        "오른쪽 자식 노드의 인덱스: {}, 값: {}",
        r,
        if let Some(val) = abt.val(r) {
            format!("{val}")
        } else {
            "null".to_string()
        }
    );
    println!(
        "부모 노드의 인덱스: {}, 값: {}",
        p,
        if let Some(val) = abt.val(p) {
            format!("{val}")
        } else {
            "null".to_string()
        }
    );

    // 트리 순회
    let mut res = abt.level_order();
    println!("\n레벨 순서 순회: {:?}", res);
    res = abt.pre_order();
    println!("전위 순회: {:?}", res);
    res = abt.in_order();
    println!("중위 순회: {:?}", res);
    res = abt.post_order();
    println!("후위 순회: {:?}", res);
}
