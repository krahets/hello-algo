=begin
File: vertex.rb
Created Time: 2024-04-25
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

### 정점 클래스 ###
class Vertex
  attr_accessor :val

  def initialize(val)
    @val = val
  end
end

### 값의 리스트 vals를 입력받아 정점 리스트 vets 반환 ###
def vals_to_vets(vals)
  Array.new(vals.length) { |i| Vertex.new(vals[i]) }
end

### 정점 리스트 vets를 입력받아 값의 리스트 vals 반환 ###
def vets_to_vals(vets)
  Array.new(vets.length) { |i| vets[i].val }
end
