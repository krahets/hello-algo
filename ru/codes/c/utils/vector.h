/**
 * File: vector.h
 * Created Time: 2023-07-13
 * Author: Zuoxun (845242523@qq.com)、Gonglja (glj0@outlook.com)
 */

#ifndef VECTOR_H
#define VECTOR_H

#ifdef __cplusplus
extern "C" {
#endif

/* Определить тип вектора */
typedef struct vector {
    int size;     // Текущий размер вектора
    int capacity; // Текущая емкость вектора
    int depth;    // Текущая глубина вектора
    void **data;  // Массив указателей на данные
} vector;

/* Создать вектор */
vector *newVector() {
    vector *v = malloc(sizeof(vector));
    v->size = 0;
    v->capacity = 4;
    v->depth = 1;
    v->data = malloc(v->capacity * sizeof(void *));
    return v;
}

/* Создать вектор, указав размер и значение элементов по умолчанию */
vector *_newVector(int size, void *elem, int elemSize) {
    vector *v = malloc(sizeof(vector));
    v->size = size;
    v->capacity = size;
    v->depth = 1;
    v->data = malloc(v->capacity * sizeof(void *));
    for (int i = 0; i < size; i++) {
        void *tmp = malloc(sizeof(char) * elemSize);
        memcpy(tmp, elem, elemSize);
        v->data[i] = tmp;
    }
    return v;
}

/* Уничтожить вектор */
void delVector(vector *v) {
    if (v) {
        if (v->depth == 0) {
            return;
        } else if (v->depth == 1) {
            for (int i = 0; i < v->size; i++) {
                free(v->data[i]);
            }
            free(v);
        } else {
            for (int i = 0; i < v->size; i++) {
                delVector(v->data[i]);
            }
            v->depth--;
        }
    }
}

/* Добавить элемент в конец вектора (копированием) */
void vectorPushback(vector *v, void *elem, int elemSize) {
    if (v->size == v->capacity) {
        v->capacity *= 2;
        v->data = realloc(v->data, v->capacity * sizeof(void *));
    }
    void *tmp = malloc(sizeof(char) * elemSize);
    memcpy(tmp, elem, elemSize);
    v->data[v->size++] = tmp;
}

/* Извлечь элемент из конца вектора */
void vectorPopback(vector *v) {
    if (v->size != 0) {
        free(v->data[v->size - 1]);
        v->size--;
    }
}

/* Очистить вектор */
void vectorClear(vector *v) {
    delVector(v);
    v->size = 0;
    v->capacity = 4;
    v->depth = 1;
    v->data = malloc(v->capacity * sizeof(void *));
}

/* Получить размер вектора */
int vectorSize(vector *v) {
    return v->size;
}

/* Получить последний элемент вектора */
void *vectorBack(vector *v) {
    int n = v->size;
    return n > 0 ? v->data[n - 1] : NULL;
}

/* Получить первый элемент вектора */
void *vectorFront(vector *v) {
    return v->size > 0 ? v->data[0] : NULL;
}

/* Получить элемент вектора по индексу pos */
void *vectorAt(vector *v, int pos) {
    if (pos < 0 || pos >= v->size) {
        printf("vectorAt: out of range\n");
        return NULL;
    }
    return v->data[pos];
}

/* Установить элемент вектора по индексу pos */
void vectorSet(vector *v, int pos, void *elem, int elemSize) {
    if (pos < 0 || pos >= v->size) {
        printf("vectorSet: out of range\n");
        return;
    }
    free(v->data[pos]);
    void *tmp = malloc(sizeof(char) * elemSize);
    memcpy(tmp, elem, elemSize);
    v->data[pos] = tmp;
}

/* Расширение вектора */
void vectorExpand(vector *v) {
    v->capacity *= 2;
    v->data = realloc(v->data, v->capacity * sizeof(void *));
}

/* Сжатие вектора */
void vectorShrink(vector *v) {
    v->capacity /= 2;
    v->data = realloc(v->data, v->capacity * sizeof(void *));
}

/* Вставить элемент по индексу pos в вектор */
void vectorInsert(vector *v, int pos, void *elem, int elemSize) {
    if (v->size == v->capacity) {
        vectorExpand(v);
    }
    for (int j = v->size; j > pos; j--) {
        v->data[j] = v->data[j - 1];
    }
    void *tmp = malloc(sizeof(char) * elemSize);
    memcpy(tmp, elem, elemSize);
    v->data[pos] = tmp;
    v->size++;
}

/* Удалить элемент вектора по индексу pos */
void vectorErase(vector *v, int pos) {
    if (v->size != 0) {
        free(v->data[pos]);
        for (int j = pos; j < v->size - 1; j++) {
            v->data[j] = v->data[j + 1];
        }
        v->size--;
    }
}

/* Обмен элементов вектора */
void vectorSwap(vector *v, int i, int j) {
    void *tmp = v->data[i];
    v->data[i] = v->data[j];
    v->data[j] = tmp;
}

/* Пуст ли вектор */
bool vectorEmpty(vector *v) {
    return v->size == 0;
}

/* Заполнен ли вектор */
bool vectorFull(vector *v) {
    return v->size == v->capacity;
}

/* Равны ли векторы */
bool vectorEqual(vector *v1, vector *v2) {
    if (v1->size != v2->size) {
        printf("size not equal\n");
        return false;
    }
    for (int i = 0; i < v1->size; i++) {
        void *a = v1->data[i];
        void *b = v2->data[i];
        if (memcmp(a, b, sizeof(a)) != 0) {
            printf("data %d not equal\n", i);
            return false;
        }
    }
    return true;
}

/* Отсортировать содержимое вектора */
void vectorSort(vector *v, int (*cmp)(const void *, const void *)) {
    qsort(v->data, v->size, sizeof(void *), cmp);
}

/* Функция печати: нужно передать функцию для вывода значения переменной */
/* В настоящее время поддерживается только вывод vector глубины 1 */
void printVector(vector *v, void (*printFunc)(vector *v, void *p)) {
    if (v) {
        if (v->depth == 0) {
            return;
        } else if (v->depth == 1) {
            if(v->size == 0) {
                printf("\n");
                return;
            }
            for (int i = 0; i < v->size; i++) {
                if (i == 0) {
                    printf("[");
                } else if (i == v->size - 1) {
                    printFunc(v, v->data[i]);
                    printf("]\r\n");
                    break;
                }
                printFunc(v, v->data[i]);
                printf(",");
            }
        } else {
            for (int i = 0; i < v->size; i++) {
                printVector(v->data[i], printFunc);
            }
            v->depth--;
        }
    }
}

/* В настоящее время поддерживается только вывод vector глубины 2 */
void printVectorMatrix(vector *vv, void (*printFunc)(vector *v, void *p)) {
    printf("[\n");
    for (int i = 0; i < vv->size; i++) {
        vector *v = (vector *)vv->data[i];
        printf("  [");
        for (int j = 0; j < v->size; j++) {
            printFunc(v, v->data[j]);
            if (j != v->size - 1)
                printf(",");
        }
        printf("],");
        printf("\n");
    }
    printf("]\n");
}

#ifdef __cplusplus
}
#endif

#endif // VECTOR_H
