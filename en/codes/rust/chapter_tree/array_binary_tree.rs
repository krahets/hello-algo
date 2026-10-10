/*
 * File: array_binary_tree.rs
 * Created Time: 2023-07-25
 * Author: night-cruise (2586447362@qq.com)
 */

use hello_algo_rust::include::{print_util, tree_node};

/* Binary tree class represented by array */
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

    /* Get value of node at index i */
    fn val(&self, i: i32) -> Option<i32> {
        // If index is out of bounds, return None, representing empty position
        if i < 0 || i >= self.size() {
            None
        } else {
            self.tree[i as usize]
        }
    }

    /* Get index of left child node of node at index i */
    fn left(&self, i: i32) -> i32 {
        2 * i + 1
    }

    /* Get index of right child node of node at index i */
    fn right(&self, i: i32) -> i32 {
        2 * i + 2
    }

    /* Get index of parent node of node at index i */
    fn parent(&self, i: i32) -> i32 {
        (i - 1) / 2
    }

    /* Level-order traversal */
    fn level_order(&self) -> Vec<i32> {
        self.tree.iter().filter_map(|&x| x).collect()
    }

    /* Depth-first traversal */
    fn dfs(&self, i: i32, order: &'static str, res: &mut Vec<i32>) {
        if self.val(i).is_none() {
            return;
        }
        let val = self.val(i).unwrap();
        // Preorder traversal
        if order == "pre" {
            res.push(val);
        }
        self.dfs(self.left(i), order, res);
        // Inorder traversal
        if order == "in" {
            res.push(val);
        }
        self.dfs(self.right(i), order, res);
        // Postorder traversal
        if order == "post" {
            res.push(val);
        }
    }

    /* Preorder traversal */
    fn pre_order(&self) -> Vec<i32> {
        let mut res = vec![];
        self.dfs(0, "pre", &mut res);
        res
    }

    /* Inorder traversal */
    fn in_order(&self) -> Vec<i32> {
        let mut res = vec![];
        self.dfs(0, "in", &mut res);
        res
    }

    /* Postorder traversal */
    fn post_order(&self) -> Vec<i32> {
        let mut res = vec![];
        self.dfs(0, "post", &mut res);
        res
    }
}

/* Driver Code */
fn main() {
    // Initialize binary tree
    // Here we use a function to generate a binary tree directly from an array
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
    println!("Array representation of binary tree:");
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
    println!("Linked list representation of binary tree:");
    print_util::print_tree(&root);

    // Binary tree class represented by array
    let abt = ArrayBinaryTree::new(arr);

    // Access node
    let i = 1;
    let l = abt.left(i);
    let r = abt.right(i);
    let p = abt.parent(i);
    println!(
        "\nCurrent node index is {}, value is {}",
        i,
        if let Some(val) = abt.val(i) {
            format!("{val}")
        } else {
            "null".to_string()
        }
    );
    println!(
        "Left child index is {}, value is {}",
        l,
        if let Some(val) = abt.val(l) {
            format!("{val}")
        } else {
            "null".to_string()
        }
    );
    println!(
        "Right child index is {}, value is {}",
        r,
        if let Some(val) = abt.val(r) {
            format!("{val}")
        } else {
            "null".to_string()
        }
    );
    println!(
        "Parent node index is {}, value is {}",
        p,
        if let Some(val) = abt.val(p) {
            format!("{val}")
        } else {
            "null".to_string()
        }
    );

    // Traverse tree
    let mut res = abt.level_order();
    println!("\nLevel-order traversal is: {:?}", res);
    res = abt.pre_order();
    println!("Pre-order traversal is: {:?}", res);
    res = abt.in_order();
    println!("In-order traversal is: {:?}", res);
    res = abt.post_order();
    println!("Post-order traversal is: {:?}", res);
}
