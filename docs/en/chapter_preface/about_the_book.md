---
comments: true
---

# About the Book

Something happened 5 years ago became the pivoting point of my career. At that time, I was a graduate student at SJTU, and I knew nothing about getting a job in tech companies. But I still applied for a Microsoft software engineer internship. The interviewer asked me to write the "quick sort" code on a whiteboard. I timidly wrote a "bubble sort", and I even got that wrong ` (ToT) `. From the interviewer's face, the only two words I saw were "Game Over".

The hit I took this time forced me to start crawling through algorithm questions. I used the "minesweeper" method of learning, with my eyes closed and my head covered, crawling through the questions, and when I encountered something I couldn't solve, I would look it up and "remove the mine". Combined with periodic summaries, I gradually formed a knowledge map of data structures and algorithms. Fortunately, I got multiple offers from big tech companies in the autumn recruitment.

When I looked back on my own experience of being blown up in the "minesweeper" method of learning, with my mind jiggling about it for a long time, and I realized that a "must-read" book for the "newbies" can help them avoid many detours. The desire to write came in like a wrecking ball, so let's get started:

<h4 align="center"> Hello，Algorithm！ </h4>

## Audience

!!! success "Prerequisites"

    You should know how to write and read simple code in at least one programming language.

If you are an **algorithm beginner**, you have never touched algorithms before, or you have accumulated some algorithm experience, but you only have a vague understanding of data structures and algorithms, and you are constantly jumping between "know" and "don't know", then this book is for you! This book can bring you:

- An understanding of **data structures** required to go through algorithm questions, including common operations, advantages and disadvantages, typical applications, and implementation methods.
- Learning all sorts of **algorithms**, introducing the design ideas, running efficiency, advantages and disadvantages, and implementation methods of algorithms.
- A **code repository** that can be run with one click, including detailed comments to help you deepen your understanding through practice.

If you are an **algorithm proficient**, you have accumulated a certain amount of algorithm experience, and have been exposed to most types of questions, then the content of this book may be slightly basic for you, but it can still bring you the following value:

- The book is not long, which can help you review your algorithm knowledge in a nutshell.
- The book contains many comparative and summary algorithm contents, which can help you sort out your algorithm knowledge system.
- The code in the book implements various classic data structures and algorithms, which can be used as a "algorithms questions library".

If you are an **algorithm expert**, then you have my respect! I hope you can take the time to provide some advice and suggestions, or [join us to collaborate](https://www.hello-algo.com/chapter_preface/contribution/), and help algorithms learners by producing better materials, thank you!

## Book Structure

The main content of this book is divided into three parts: complexity analysis, data structures, and algorithms.

![mindmap](index.assets/mindmap.png)

<p align="center"> Fig. Mind Map of Key Points </p>

### Complexity Analysis

We will first introduce the evaluation factors of data structures and algorithms, the evaluation methods of algorithm efficiency, and the concept of computational complexity.

Then, from the **asymptotic upper bound of functions** , we will introduce **time complexity** and **space complexity** respectively, including calculation methods, common types, examples, etc. At the same time, we will analyze the relationship and difference between the **worst, best, and average** time complexity.

### Data Structures

We will first introduce the **basic data types** that are commonly used, and how they are stored in memory.

Then, we will introduce two **data structure classification methods**, including logical structure and physical structure.

After that, we will introduce **array, linked list, stack, queue, hash table, tree, heap, graph** and other data structures, and we will focus on the following content:

- Basic definitions: the designing ideas, and the purposes served by these data structures;
- Primary characteristics: the pros and cons of various data operations;
- Common operations: such as access, update, insert, delete, traversal, search, etc.;
- Common types: the common types encountered in algorithm questions or engineering practice;
- Typical applications: typical algorithms that are often used with these data structures;
- Implementations: for important data structures, we will provide complete implementation examples;

### Algorithms

Including **searching algorithms, sorting algorithms, searching and backtracking, dynamic programming, and divide-and-conquer algorithms**, containing the following:

- Basic definitions: the designing ideas of algorithms;
- Primary characteristics: the preconditions, pros and cons of each algorithm;
- Algorithm efficiency: worst and average time complexity, space complexity;
- Implementations: complete algorithm implementations, and optimization measures;
- Example questions: adding example questions to deepen your understanding;

## Code Repository

The complete code repository is hosted on [GitHub](https://github.com/krahets/hello-algo), you can run the code with one click!

!!! tip "Preparation"

    1. [Install your coding environment](https://www.hello-algo.com/chapter_preface/installation/), if you have already installed it, please skip this step
    2. See [How to use this book](https://www.hello-algo.com/chapter_preface/suggestions/#_4) for code download and usage instructions

## Style Guide

- The * symbol trailing the title indicates that it is an optional chapter. If you are short on time, you can skip these chapters first.
- Important syllables will be marked as italic, such as *Array*. Mixing up the syllables will cause unnecessary ambiguity, so it is best to remember these syllables, so that they can be used when reading related materials in the future.
- Important content, summary sentences will be marked as **bold**, this kind of text is worth special attention.
- The names of proprietary nouns and words with specific meanings will be marked with " ", to avoid ambiguity.
- In engineering practice, each language has its own comment conventions; while this book gives up some of the comment conventions in order to achieve a more compact content layout. The comments are divided into three types: header comments, content comments, and multi-line comments.

=== "Java"

    ```java title=""
    /* header comments, used to mark functions, classes, test cases, etc. */
    
    // content comments, used to explain code

    /**
     * multi-line
     * comments
     */
    ```

=== "C++"

    ```cpp title=""
    /* header comments, used to mark functions, classes, test cases, etc. */
    
    // content comments, used to explain code

    /**
     * multi-line
     * comments
     */
    ```

=== "Python"

    ```python title=""
    """ header comments, used to mark functions, classes, test cases, etc. """
    
    # content comments, used to explain code

    """
    multi-line
    comments
    """
    ```

=== "Go"

    ```go title=""
    /* header comments, used to mark functions, classes, test cases, etc. */
    
    // content comments, used to explain code

    /**
     * multi-line
     * comments
     */
    ```

=== "JavaScript"

    ```js title=""
    /* header comments, used to mark functions, classes, test cases, etc. */
    
    // content comments, used to explain code

    /**
     * multi-line
     * comments
     */
    ```

=== "TypeScript"

    ```typescript title=""
    /* header comments, used to mark functions, classes, test cases, etc. */
    
    // content comments, used to explain code

    /**
     * multi-line
     * comments
     */
    ```

=== "C"

    ```c title=""
    /* header comments, used to mark functions, classes, test cases, etc. */
    
    // content comments, used to explain code

    /**
     * multi-line
     * comments
     */
    ```

=== "C#"

    ```csharp title=""
    /* header comments, used to mark functions, classes, test cases, etc. */
    
    // content comments, used to explain code

    /**
     * multi-line
     * comments
     */
    ```

## Key Features of This Book *

??? abstract "Default collapsed, can be skipped"

    **Practice comes first.** We know that it is far from enough to just read books when learning English. We need to listen, speak, and write more, and practice in order to cultivate language sense and accumulate experience. Programming languages are also languages, so the learning method should be similar, and we need to be accustomed to walking through elegant code, writing more code and thinking about the logic behind the code.
    
    The theoretical part of this book is relatively concise, mainly divided into two categories: one is the basic and necessary concepts, to cultivate the reader's intuitive understanding of algorithms; the second is essential classifications, comparisons or summaries, which is to give you a "god view" and hard overview of all the key points, so that you can form your own subconscious understanding.
    
    The practice part is mainly made up of examples and code. The code is accompanied by brief comments, and complex examples will be presented as visually as possible. I strongly recommend that the readers type out the code themselves, if time is limited, at least read, copy and run the code line by line, and combine with the explanation to digest the code.
    
    **Visualized learning.** Since the dawn of the information age, the endeavor of visualizing information has never ended. The media has transformed from text messages, to emails with text and image, to GIFs, to short (long) videos, interactive Web, and 3D games. The magnitude of information visualization is getting higher than ever, they are more unified with human senses, and the efficiency of spreading information has skyrocketed. The tech industry is also moving towards visualization, take the iPhone as an example, it is a highly visualized product compared to conventional devices, with articulately designed fonts, themes, and animations, etc.
    
    In the past several years, short videos have become one of the most popular form of media, capable of delivering highly dense information, and can provide a comfortable consumption experience. Reading is different, there is a natural "distance" between the reader and the book, we will get tired, distracted, and will think about other things while reading, we will mark the sentences we like, and think about the meaning of a paragraph, this "distance" gives us a sense of freedom and the capability of stopping for a moment and think about what we just read.
    
    As a beginner's guide, I wish to maintain the "slow pace" of books, but also to avoid putting too much "distance" between the reader and the book, and to try to sink the knowledge into that clever little brain of yours. I will utilize visualization techniques (e.g. illustrations, animations), and try to explain complex concepts and abstract examples as clearly as possible.

    **Simplified contents.** Most classic textbooks try to cover almost every aspect of the subject, and the thoroughness is the reason why they are popular. However, for beginners who want to get started quickly, the practicality of these textbooks is quite poor. This book will avoid introducing unnecessary concepts, terms, definitions, etc., and will avoid unnecessary theoretical analysis, after all, this is not a hardcore textbook, our main goal is to get you started as rapidly as possible.
    
    When introducing some fun examples from real life, which are quite suitable as a prelude to key content, or as a supplement to the explanation. However, we will try to keep the content as concise as possible, and avoid adding too many extra elements, which may make the reader lose focus and miss the key points, which is also something this book should avoid.
    
    Coding is like writing, they should both pursue "beauty". This book tries to make the code beautiful, and ensure the consistency of variable naming, uniform spacing and line breaks, aligned indentation, and neat comments, etc.

## Acknowledgements

本书的成书过程中，我获得了许多人的帮助，包括但不限于：

- 感谢我的女朋友泡泡担任本书的首位读者，从算法小白的视角为本书的写作提出了许多建议，使这本书更加适合算法初学者来阅读。
- 感谢腾宝、琦宝、飞宝为本书起了个响当当的名字，好听又有梗，直接唤起我最初敲下第一行代码 "Hello, World!" 的回忆。
- 感谢我的导师李博，在小酌畅谈时您告诉我“觉得适合、想做就去做”，坚定了我写这本书的决心。
- 感谢苏潼为本书设计了封面和 LOGO ，我有些强迫症，前后多次修改，谢谢你的耐心。
- 感谢 @squidfunk ，包括 [Material-for-MkDocs](https://github.com/squidfunk/mkdocs-material/tree/master) 顶级开源项目以及给出的写作排版建议。

在写作过程中，我阅读了许多与数据结构与算法的书籍材料，学习到了许多知识，感谢前辈们的精彩创作。

感谢父母，你们一贯的支持与鼓励给了我自由度来做这些有趣的事。

## About the Author

![profile](about_the_book.assets/profile.png){: .center}

<h2 align="center"> Krahets </h2>

<h5 align="center"> 大厂高级算法工程师、算法爱好者 </h5>

<p align="center"> 力扣（LeetCode）全网阅读量最高博主 </p>
<p align="center"> 分享近百道算法题解，累积回复数千读者的评论问题 </p>
<p align="center"> 创作 LeetBook《图解算法数据结构》，已免费售出 22 万本 </p>
