---
comments: true
---

# Algorithms Are Everywhere

Every time you see the word "algorithm", you probably think of mathematics. But in fact, complex mathematics aren't found in most algorithms. What is more common is basic logic, which we can see everywhere in our daily lives.

Before diving into the details of algorithms, I want to tell you something interesting: **In fact, you have already learned many algorithms in the past, and you have been accustomed to applying them to daily life.** Next, I will introduce two vivid examples to prove this.

**Example 1: Building LEGO.** When you buy a set of LEGO, in addition to the various components, you will also receive a detailed assembly instruction. By following the instructions step by step, you can build a complex LEGO model.

Think of this from a data structure and algorithm perspective. The various *LEGO blocks* are data structures, and the series of steps on the *assembly instructions* are algorithms.

**Example 2: Looking up a dictionary.** In a dictionary, English words are sorted in alphabetical order. If we want to look up a word starting with letter $r$ in the dictionary, we usually do it like this:

1. Open the dictionary up in the middle, and check the first letter of the page (assume it is $m$ );
2. Since $r$ is after $m$ in the English alphabet, we should exclude the first half of the dictionary, and our search range is only the second half now;
3. Repeat step 1-2 until we find the page with the first letter of the word we are looking for ($r$) and stop.

=== "Step 1"
    ![look_up_dictionary_step_1](algorithms_are_everywhere.assets/look_up_dictionary_step_1.png)
=== "Step 2"
    ![look_up_dictionary_step_2](algorithms_are_everywhere.assets/look_up_dictionary_step_2.png)
=== "Step 3"
    ![look_up_dictionary_step_3](algorithms_are_everywhere.assets/look_up_dictionary_step_3.png)
=== "Step 4"
    ![look_up_dictionary_step_4](algorithms_are_everywhere.assets/look_up_dictionary_step_4.png)
=== "Step 5"
    ![look_up_dictionary_step_5](algorithms_are_everywhere.assets/look_up_dictionary_step_5.png)

Something as simple as looking up a dictionary is actually a real life application of the famous *binary search*. From a data structure perspective, we can view the dictionary as a sorted *array*; from an algorithm perspective, we can view the series of steps for looking up a dictionary as the *binary search* algorithm.

From simple tasks like cooking, to complex tasks like interstellar travel, almost no problem can be solved without algorithms. The birth of computers allows us to write code to store data structures in computer memory, and to use CPU and GPU to execute algorithms, so that we can abstract the problems in our daily lives into computers programs, and solve complex problems more efficiently.

!!! tip

    Up to this point, if you feel that you are not familiar with the concepts of data structures, algorithms, arrays, binary search, etc., then that's great! Because that's the very thing that this book is here to help you with. From now on, we will guide you step by step through the world of data structures and algorithms.
