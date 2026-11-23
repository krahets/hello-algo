=begin
File: edit_distance.rb
Created Time: 2024-05-29
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

### 편집 거리: 완전 탐색 ###
def edit_distance_dfs(s, t, i, j)
  # s와 t가 모두 비어 있으면 0을 반환한다
  return 0 if i == 0 && j == 0
  # s가 비어 있으면 t의 길이를 반환한다
  return j if i == 0
  # t가 비어 있으면 s의 길이를 반환한다
  return i if j == 0
  # 두 문자가 같으면 두 문자를 바로 건너뛴다
  return edit_distance_dfs(s, t, i - 1, j - 1) if s[i - 1] == t[j - 1]
  # 최소 편집 횟수 = 삽입, 삭제, 교체 세 연산에 대한 최소 편집 횟수 + 1
  insert = edit_distance_dfs(s, t, i, j - 1)
  delete = edit_distance_dfs(s, t, i - 1, j)
  replace = edit_distance_dfs(s, t, i - 1, j - 1)
  # 최소 편집 횟수를 반환한다
  [insert, delete, replace].min + 1
end

def edit_distance_dfs_mem(s, t, mem, i, j)
  # s와 t가 모두 비어 있으면 0을 반환한다
  return 0 if i == 0 && j == 0
  # s가 비어 있으면 t의 길이를 반환한다
  return j if i == 0
  # t가 비어 있으면 s의 길이를 반환한다
  return i if j == 0
  # 기록이 이미 있으면 해당 값을 바로 반환한다
  return mem[i][j] if mem[i][j] != -1
  # 두 문자가 같으면 두 문자를 바로 건너뛴다
  return edit_distance_dfs_mem(s, t, mem, i - 1, j - 1) if s[i - 1] == t[j - 1]
  # 최소 편집 횟수 = 삽입, 삭제, 교체 세 연산에 대한 최소 편집 횟수 + 1
  insert = edit_distance_dfs_mem(s, t, mem, i, j - 1)
  delete = edit_distance_dfs_mem(s, t, mem, i - 1, j)
  replace = edit_distance_dfs_mem(s, t, mem, i - 1, j - 1)
  # 최소 편집 횟수를 기록하고 반환한다
  mem[i][j] = [insert, delete, replace].min + 1
end

### 편집 거리: 동적 계획법 ###
def edit_distance_dp(s, t)
  n, m = s.length, t.length
  dp = Array.new(n + 1) { Array.new(m + 1, 0) }
  # 상태 전이: 첫 번째 행과 첫 번째 열
  (1...(n + 1)).each { |i| dp[i][0] = i }
  (1...(m + 1)).each { |j| dp[0][j] = j }
  # 상태 전이: 나머지 행과 열
  for i in 1...(n + 1)
    for j in 1...(m +1)
      if s[i - 1] == t[j - 1]
        # 두 문자가 같으면 두 문자를 바로 건너뛴다
        dp[i][j] = dp[i - 1][j - 1]
      else
        # 최소 편집 횟수 = 삽입, 삭제, 교체 세 연산에 대한 최소 편집 횟수 + 1
        dp[i][j] = [dp[i][j - 1], dp[i - 1][j], dp[i - 1][j - 1]].min + 1
      end
    end
  end
  dp[n][m]
end

### 편집 거리: 공간을 최적화한 동적 계획법 ###
def edit_distance_dp_comp(s, t)
  n, m = s.length, t.length
  dp = Array.new(m + 1, 0)
  # 상태 전이: 첫 번째 행
  (1...(m + 1)).each { |j| dp[j] = j }
  # 상태 전이: 나머지 행
  for i in 1...(n + 1)
    # 상태 전이: 첫 번째 열
    leftup = dp.first # dp[i-1, j-1]을 임시로 저장한다
    dp[0] += 1
    # 상태 전이: 나머지 열
    for j in 1...(m + 1)
      temp = dp[j]
      if s[i - 1] == t[j - 1]
        # 두 문자가 같으면 두 문자를 바로 건너뛴다
        dp[j] = leftup
      else
        # 최소 편집 횟수 = 삽입, 삭제, 교체 세 연산에 대한 최소 편집 횟수 + 1
        dp[j] = [dp[j - 1], dp[j], leftup].min + 1
      end
      leftup = temp # 다음 반복의 dp[i-1, j-1]로 갱신한다
    end
  end
  dp[m]
end

### 실행 코드 ###
if __FILE__ == $0
  s = 'bag'
  t = 'pack'
  n, m = s.length, t.length

  # 완전 탐색
  res = edit_distance_dfs(s, t, n, m)
  puts "#{s} → #{t} 변경에 필요한 최소 편집 횟수: #{res}"

  # 메모이제이션을 이용한 탐색
  mem = Array.new(n + 1) { Array.new(m + 1, -1) }
  res = edit_distance_dfs_mem(s, t, mem, n, m)
  puts "#{s} → #{t} 변경에 필요한 최소 편집 횟수: #{res}"

  # 동적 계획법
  res = edit_distance_dp(s, t)
  puts "#{s} → #{t} 변경에 필요한 최소 편집 횟수: #{res}"

  # 공간을 최적화한 동적 계획법
  res = edit_distance_dp_comp(s, t)
  puts "#{s} → #{t} 변경에 필요한 최소 편집 횟수: #{res}"
end
