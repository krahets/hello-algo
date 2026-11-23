# Lists

A <u>list</u> is an abstract data structure representing an ordered collection. It supports access, modification, insertion, removal, and traversal without requiring users to manage capacity limits. Lists can be implemented with linked lists or arrays.

- A linked list naturally serves as a list, supporting these operations and flexible dynamic growth.
- An array also supports these operations, but its fixed length makes it a list with a length limit.

When an array implements a list, **its fixed length limits the list's usefulness**. We often cannot predict how much data we will store. Too small an allocation may not meet our needs; too large an allocation wastes memory.

A <u>dynamic array</u> solves this problem. It retains the advantages of an array while allowing capacity to grow during execution.

**Many standard-library lists use dynamic arrays**, including Python's `list`, Java's `ArrayList`, C++'s `vector`, and C#'s `List`. In the discussion that follows, we treat lists and dynamic arrays as equivalent concepts.

## Common list operations

### Initializing a list

We usually initialize a list either without elements or with explicit initial values:

```snippet
init_list
```

??? pythontutor "Visualize execution"

    @tutor init_list_tutor

### Accessing an element

Since the list is based on an array, accessing and updating an element are efficient $O(1)$ operations.

```snippet
access_element
```

??? pythontutor "Visualize execution"

    @tutor access_element_tutor

### Inserting and removing elements

Unlike a fixed array, a list can freely add and remove elements. Appending takes $O(1)$ time, while insertion and removal retain the array's $O(n)$ time complexity.

```snippet
insert_remove_element
```

??? pythontutor "Visualize execution"

    @tutor insert_remove_element_tutor

### Traversing a list

Like an array, a list can be traversed by index or by visiting its elements directly.

```snippet
iterate_list
```

??? pythontutor "Visualize execution"

    @tutor iterate_list_tutor

### Concatenating lists

Given another list `nums1`, we can append its elements to the end of the original list.

```snippet
concat_list
```

??? pythontutor "Visualize execution"

    @tutor concat_list_tutor

### Sorting a list

Once the list is sorted, we can apply binary search and two-pointer algorithms, which often appear in array problems.

```snippet
sort_list
```

??? pythontutor "Visualize execution"

    @tutor sort_list_tutor

## Implementing a list

Many languages, including Java, C++, and Python, provide lists. Their implementations are sophisticated, with carefully chosen parameters such as initial capacity and growth factor. Interested readers can study their source code.

To understand how a list works, let's implement a simplified version with three key design choices.

- **Initial capacity**: Choose a reasonable starting array capacity. We use 10 here.
- **Element count**: Maintain `size`, the number of elements, updating it on insertion and removal. It identifies the list's end and tells us when expansion is needed.
- **Growth mechanism**: If insertion finds the capacity full, allocate a larger array using a growth factor and copy all current elements into it. Here, capacity doubles each time.

```src
[file]{my_list}-[class]{my_list}-[func]{}
```
