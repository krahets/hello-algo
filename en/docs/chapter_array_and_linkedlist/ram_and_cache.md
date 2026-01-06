# Random-Access Memory and Cache *

In the first two sections of this chapter, we explored arrays and linked lists, two fundamental and important data structures that represent "contiguous storage" and "distributed storage" as two physical structures, respectively.

In fact, **physical structure largely determines the efficiency with which programs utilize memory and cache**, which in turn affects the overall performance of algorithmic programs.

## Computer Storage Devices

Computers include three types of storage devices: <u>hard disk</u>, <u>random-access memory (RAM)</u>, and <u>cache memory</u>. The following table shows their different roles and performance characteristics in a computer system.

<p align="center"> Table <id> &nbsp; Computer Storage Devices </p>

|                | Hard Disk                                                     | RAM                                              | Cache                                                          |
| -------------- | ------------------------------------------------------------- | ------------------------------------------------ | -------------------------------------------------------------- |
| Purpose        | Long-term storage of data, including operating systems, programs, and files | Temporary storage of currently running programs and data being processed | Storage of frequently accessed data and instructions to reduce CPU's accesses to memory |
| Volatility     | Data is not lost after power-off                             | Data is lost after power-off                    | Data is lost after power-off                                  |
| Capacity       | Large, on the order of terabytes (TB)                        | Small, on the order of gigabytes (GB)           | Very small, on the order of megabytes (MB)                    |
| Speed          | Slow, hundreds to thousands of MB/s                          | Fast, tens of GB/s                              | Very fast, tens to hundreds of GB/s                           |
| Cost (USD/GB)  | Inexpensive, fractions of a dollar to a few dollars per GB   | Expensive, tens to hundreds of dollars per GB   | Very expensive, priced as part of the CPU package             |

We can imagine the computer storage system as a pyramid structure as shown in the diagram below. Storage devices closer to the top of the pyramid are faster, have smaller capacity, and are more expensive. This multi-layered design is not by accident, but rather the result of careful consideration by computer scientists and engineers.

- **Hard disk cannot be easily replaced by RAM**. First, data in memory is lost after power-off, making it unsuitable for long-term data storage. Second, memory is tens of times more expensive than hard disk, which makes it difficult to popularize in the consumer market.
- **Cache cannot simultaneously achieve large capacity and high speed**. As the capacity of L1, L2, and L3 caches increases, their physical size becomes larger, and the physical distance between them and the CPU core increases, resulting in longer data transmission time and higher element access latency. With current technology, the multi-layered cache structure represents the best balance point between capacity, speed, and cost.

![Computer Storage System](ram_and_cache.assets/storage_pyramid.png)

!!! tip

    The storage hierarchy of computers embodies a delicate balance among speed, capacity, and cost. In fact, such trade-offs are common across all industrial fields, requiring us to find the optimal balance point between different advantages and constraints.

In summary, **hard disk is used for long-term storage of large amounts of data, RAM is used for temporary storage of data being processed during program execution, and cache is used for storage of frequently accessed data and instructions**, to improve program execution efficiency. The three work together to ensure efficient operation of the computer system.

As shown in the diagram below, during program execution, data is read from the hard disk into RAM for CPU computation. Cache can be viewed as part of the CPU, **it intelligently loads data from RAM**, providing the CPU with high-speed data reading, thereby significantly improving program execution efficiency and reducing reliance on slower RAM.

![Data Flow Among Hard Disk, RAM, and Cache](ram_and_cache.assets/computer_storage_devices.png)

## Memory Efficiency of Data Structures

In terms of memory space utilization, arrays and linked lists each have advantages and limitations.

On one hand, **memory is limited, and the same memory cannot be shared by multiple programs**, so we hope data structures can utilize space as efficiently as possible. Array elements are tightly packed and do not require additional space to store references (pointers) between linked list nodes, thus having higher space efficiency. However, arrays need to allocate sufficient contiguous memory space at once, which may lead to memory waste, and array expansion requires additional time and space costs. In comparison, linked lists perform dynamic memory allocation and deallocation on a "node" basis, providing greater flexibility.

On the other hand, during program execution, **as memory is repeatedly allocated and freed, the degree of fragmentation of free memory becomes increasingly severe**, leading to reduced memory utilization efficiency. Arrays, due to their contiguous storage approach, are relatively less prone to memory fragmentation. Conversely, linked list elements are distributed in storage, and frequent insertion and deletion operations are more likely to cause memory fragmentation.

## Cache Efficiency of Data Structures

Although cache has much smaller space capacity than memory, it is much faster than memory and plays a crucial role in program execution speed. Since cache capacity is limited and can only store a small portion of frequently accessed data, when the CPU attempts to access data that is not in the cache, a <u>cache miss</u> occurs, and the CPU must load the required data from the slower memory.

Clearly, **the fewer "cache misses," the higher the efficiency of CPU data reads and writes**, and the better the program performance. We call the proportion of data that the CPU successfully obtains from the cache the <u>cache hit rate</u>, a metric typically used to measure cache efficiency.

To achieve the highest efficiency possible, cache employs the following data loading mechanisms.

- **Cache lines**: The cache does not store and load data on a byte-by-byte basis, but rather as cache lines. Compared to byte-by-byte transmission, cache line transmission is more efficient.
- **Prefetching mechanism**: The processor attempts to predict data access patterns (e.g., sequential access, fixed-stride jumping access, etc.) and loads data into the cache according to specific patterns, thereby improving hit rate.
- **Spatial locality**: If a piece of data is accessed, nearby data may also be accessed in the near future. Therefore, when the cache loads a particular piece of data, it also loads nearby data to improve hit rate.
- **Temporal locality**: If a piece of data is accessed, it is likely to be accessed again in the near future. Cache leverages this principle by retaining recently accessed data to improve hit rate.

In fact, **arrays and linked lists have different efficiencies in utilizing cache**, manifested in the following aspects.

- **Space occupied**: Linked list elements occupy more space than array elements, resulting in fewer effective data in the cache.
- **Cache lines**: Linked list data are scattered throughout memory, while cache loads "by lines," so the proportion of invalid data loaded is higher.
- **Prefetching mechanism**: Arrays have more "predictable" data access patterns than linked lists, making it easier for the system to guess which data will be loaded next.
- **Spatial locality**: Arrays are stored in centralized memory space, so data near loaded data is more likely to be accessed soon.

Overall, **arrays have higher cache hit rates, thus they usually outperform linked lists in operation efficiency**. This makes data structures implemented based on arrays more popular when solving algorithmic problems.

It is important to note that **high cache efficiency does not mean arrays are superior to linked lists in all cases**. In practical applications, which data structure to choose should be determined based on specific requirements. For example, both arrays and linked lists can implement the "stack" data structure (which will be discussed in detail in the next chapter), but they are suitable for different scenarios.

- When solving algorithm problems, we tend to prefer stack implementations based on arrays, because they provide higher operation efficiency and the ability of random access, at the cost of needing to pre-allocate a certain amount of memory space for the array.
- If the data volume is very large, the dynamic nature is high, and the expected size of the stack is difficult to estimate, then a stack implementation based on linked lists is more suitable. Linked lists can distribute large amounts of data across different parts of memory and avoid the additional overhead produced by array expansion.
