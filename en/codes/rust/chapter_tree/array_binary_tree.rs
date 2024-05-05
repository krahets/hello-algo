/*
 * File: array_binary_tree.rs
 * Created Time: 2023-07-25
 * Author: night-cruise (2586447362@qq.com)
 */

include!("../include/include.rs");

/* Array-based binary tree class */
struct ArrayBinaryTree {
    tree: Vec<Option<i32>>,
}

impl ArrayBinaryTree {
    /* Constructor */
    fn new(arr: Vec<Option<i32>>) -> Self {
        Self { tree: arr }
    }

    /* List capacity */
    fn size(&self) -> i32 {
        self.tree.len() as i32
    }

    /* Get the value of the node at index i */
    fn val(&self, i: i32) -> Option<i32> {
        // If the index is out of bounds, return None, representing a vacancy
        if i < 0 || i >= self.size() {
            None
        } else {
            self.tree[i as usize]
        }
    }

    /* Get the index of the left child of the node at index i */
    fn left(&self, i: i32) -> i32 {
        2 * i + 1
    }

    /* Get the index of the right child of the node at index i */
    fn right(&self, i: i32) -> i32 {
        2 * i + 2
    }

    /* Get the index of the parent of the node at index i */
    fn parent(&self, i: i32) -> i32 {
        (i - 1) / 2
    }

    /* Level-order traversal */
    fn level_order(&self) -> Vec<i32> {
        let mut res = vec![];
        // Traverse array
        for i in 0..self.size() {
            if let Some(val) = self.val(i) {
                res.push(val)
            }
        }
        res
    }

    /* Depth-first traversal */
    fn dfs(&self, i: i32, order: &str, res: &mut Vec<i32>) {
        if self.val(i).is_none() {
            return;
        }
        let val = self.val(i).unwrap();
        // Pre-order traversal
        if order == "pre" {
            res.push(val);
        }
        self.dfs(self.left(i), order, res);
        // In-order traversal
        if order == "in" {
            res.push(val);
        }
        self.dfs(self.right(i), order, res);
        // Post-order traversal
        if order == "post" {
            res.push(val);
        }
    }

    /* Pre-order traversal */
    fn pre_order(&self) -> Vec<i32> {
        let mut res = vec![];
        self.dfs(0, "pre", &mut res);
        res
    }

    /* In-order traversal */
    fn in_order(&self) -> Vec<i32> {
        let mut res = vec![];
        self.dfs(0, "in", &mut res);
        res
    }

    /* Post-order traversal */
    fn post_order(&self) -> Vec<i32> {
        let mut res = vec![];
        self.dfs(0, "post", &mut res);
        res
    }
}

/* Driver Code */
fn main() {
    // Initialize binary tree
    // Use a specific function to convert an array into a binary tree
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
    println!("\nInitialize binary tree\n");
    println!("Binary tree's array representation:");
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
    println!("Binary tree's linked list representation:");
    print_util::print_tree(&root);

    // Array-based binary tree class
    let abt = ArrayBinaryTree::new(arr);

    // Access node
    let i = 1;
    let l = abt.left(i);
    let r = abt.right(i);
    let p = abt.parent(i);
    println!(
        "\nCurrent node's index = {}, value = {}",
        i,
        if let Some(val) = abt.val(i) {
            format!("{val}")
        } else {
            "null".to_string()
        }
    );
    println!(
        "Its left child's index = {}, value = {}",
        l,
        if let Some(val) = abt.val(l) {
            format!("{val}")
        } else {
            "null".to_string()
        }
    );
    println!(
        "Its right child's index = {}, value = {}",
        r,
        if let Some(val) = abt.val(r) {
            format!("{val}")
        } else {
            "null".to_string()
        }
    );
    println!(
        "Its parent's index = {}, value = {}",
        p,
        if let Some(val) = abt.val(p) {
            format!("{val}")
        } else {
            "null".to_string()
        }
    );

    // Traverse tree
    let mut res = abt.level_order();
    println!("\nLevel-order traversal is:{:?}", res);
    res = abt.pre_order();
    println!("Pre-order traversal is:{:?}", res);
    res = abt.in_order();
    println!("In-order traversal is:{:?}", res);
    res = abt.post_order();
    println!("Post-order traversal is:{:?}", res);
}
