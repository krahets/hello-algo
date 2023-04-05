/**
 * @file macro_fun.h
 * @author DANIEL HU (shady030314@gmail.com)
 * @date 2023-04-05
 * @note Inspired by NJU-ICS 
 */

#define _Log(...)        \
  do {                   \
    printf(__VA_ARGS__); \
  } while (0)

/**
 * @brief Log() is an upgraded version of printf()
 * which is specially used to output debugging information:
 * source file, line number and function where Log() is used
 */
#define Log(format, ...)                                                       \
  _Log("\33[1;34m[%s,%d,%s] " format "\33[0m\n", __FILE__, __LINE__, __func__, \
       ##__VA_ARGS__)

/**
 * @brief Assert() is an upgraded version of assert()
 * when the condition is false, it can output some information before assertion
 * fail
 */
#define Assert(cond, ...)           \
  do {                              \
    if (!(cond)) {                  \
      fflush(stdout);               \
      fprintf(stderr, "\33[1;31m"); \
      fprintf(stderr, __VA_ARGS__); \
      fprintf(stderr, "\33[0m\n");  \
      assert(cond);                 \
    }                               \
  } while (0)

/**
 * @brief panic() is upgraded version of assert(0)
 * which can output some infomation before exit program
 */
#define panic(...) Assert(0, __VA_ARGS__)
