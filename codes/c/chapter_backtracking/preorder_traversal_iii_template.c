/**
 * File: preorder_traversal_iii_template.c
 * Created Time: 2023-06-04
 * Author: Gonglja (glj0@outlook.com)
 */

#include "../utils/common.h"

/* 定义向量类型 */
typedef struct Vector {
	int size;     // 当前向量的大小
	int capacity; // 当前向量的容量
	int depth;    // 当前向量的深度
	void **data;  // 指向数据的指针数组
} Vector;

/* 构造向量 */
Vector* newVector() {
	Vector *v = malloc (sizeof(Vector));
	v->size = 0;
	v->capacity = 4;
	v->depth = 1;
	v->data = malloc(v->capacity * sizeof(void *));
	return v;
}

/* 析构向量 */
void delVector(Vector *v) {
	if (v) {
		if (v->depth == 0) {
			return ;
		} else if (v->depth == 1) {
			for (int i=0; i<v->size; i++) {
				free(v->data[i]);
			}
			free(v);
		} else {
			for (int i=0; i<v->size; i++) {
				delVector(v->data[i]);
			}
			v->depth--;
		}
	}
}

/*  添加元素到向量尾部 */
void vectorPushback(Vector *v, void *elem) {
    if (v->size == v->capacity) {
        v->capacity *= 2;
        v->data = realloc(v->data, v->capacity * sizeof(void *));
    }
    v->data[v->size++] = elem;
}

/* 从向量尾部弹出元素 */
void vectorPopback(Vector *v) {
    if (v->size != 0) {
        v->size--;
    }
}

/* 清空向量 */
void vectorClear(Vector *v) {
    for (int i = 0; i < v->size; i++) {
        free(v->data[i]);
    }
    free(v->data);
    v->size = 0;
    v->capacity = 4;
    v->data = malloc(v->capacity * sizeof(void *));
}

/* 判断当前状态是否为解 */
bool isSolution(Vector *state) {
    return state->size != 0 && ((TreeNode *)(state->data[state->size - 1]))->val == 7;
}

/* 记录解 */
void recordSolution(Vector *state, Vector *res) {
    Vector *newPath = newVector();
    for (int i = 0; i < state->size; i++) {
        vectorPushback(newPath, state->data[i]);
    }
    vectorPushback(res, newPath);
}

/* 判断在当前状态下，该选择是否合法 */
bool isValid(Vector *state, TreeNode *choice) {
    return choice != NULL && choice->val != 3;
}

/* 更新状态 */
void makeChoice(Vector *state, TreeNode *choice) {
    vectorPushback(state, choice);
}

/* 恢复状态 */
void undoChoice(Vector *state, TreeNode *choice) {
    vectorPopback(state);
}

/* 前序遍历：例题三 */
void backtrace(Vector *state, Vector *choices, Vector *res) {
    // 检查是否为解
    if (isSolution(state)) {
        // 记录解
        recordSolution(state, res);
        return;
    }
    // 遍历所有选择
    for (int i = 0; i < choices->size; i++) {
        TreeNode *choice = choices->data[i];
        // 剪枝：检查选择是否合法
        if (isValid(state, choice)) {
            // 尝试：做出选择，更新状态
            makeChoice(state, choice);
            // 进行下一轮选择
            Vector *nextChoices = newVector();
            vectorPushback(nextChoices, choice->left);
            vectorPushback(nextChoices, choice->right);
            backtrace(state, nextChoices, res);
            // 回退：撤销选择，恢复到之前的状态
            undoChoice(state, choice);
        }
    }
}

// 打印向量中的元素
void printResult(Vector *vv) {
    for (int i = 0; i < vv->size; i++) {
        Vector *v = (Vector *)vv->data[i];
        for (int j = 0; j < v->size; j++) {
            TreeNode *node = (TreeNode *)v->data[j];
            printf("%d ", node->val);
        }
        printf("\n");
    }
}

int main() {
    int arr[] = {1, 7, 3, 4, 5, 6, 7};
    int n = sizeof(arr) / sizeof(arr[0]);
    TreeNode *root = arrToTree(arr, n);
    printf("\r\n初始化二叉树\r\n");
    printTree(root);

    // 回溯算法
    Vector *state = newVector();
	Vector *choices = newVector();
    Vector *res = newVector();
    vectorPushback(choices, root);

    // 前序遍历
    backtrace(state, choices, res);

    // 输出结果
    printf("输出所有根节点到节点 7 的路径，要求路径中不包含值为 3 的节点:\n");
    printResult(res);

    // 释放内存
	delVector(state);
	delVector(choices);
	delVector(res);
    return 0;
}
