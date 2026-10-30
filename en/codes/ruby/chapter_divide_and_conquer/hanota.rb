=begin
File: hanota.rb
Created Time: 2024-05-13
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

### Move one disk ###
def move(src, tar)
  # Take a disk from the top of src
  pan = src.pop
  # Place the disk on top of tar
  tar << pan
end

### Solve the Tower of Hanoi problem f(i) ###
def dfs(i, src, buf, tar)
  # If only one disk remains to be moved from src, move it directly to tar
  if i == 1
    move(src, tar)
    return
  end

  # Subproblem f(i-1): move the top i-1 disks from src to buf using tar
  dfs(i - 1, src, tar, buf)
  # Subproblem f(1): move the remaining disk in the current subproblem from src to tar
  move(src, tar)
  # Subproblem f(i-1): move the top i-1 disks from buf to tar using src
  dfs(i - 1, buf, src, tar)
end

### Solve the Tower of Hanoi problem ###
def solve_hanota(_A, _B, _C)
  n = _A.length
  # Move the top n disks from A to C using B
  dfs(n, _A, _B, _C)
end

### Driver code ###
if __FILE__ == $0
  # The end of each list represents the top of the peg
  A = [5, 4, 3, 2, 1]
  B = []
  C = []
  puts "Initial state:"
  puts "A = #{A}"
  puts "B = #{B}"
  puts "C = #{C}"

  solve_hanota(A, B, C)

  puts "After moving the disks:"
  puts "A = #{A}"
  puts "B = #{B}"
  puts "C = #{C}"
end
