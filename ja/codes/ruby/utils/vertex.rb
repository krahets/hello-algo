=begin
File: vertex.rb
Created Time: 2024-04-25
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

### 頂点を表すクラス ###
class Vertex
  attr_accessor :val

  def initialize(val)
    @val = val
  end
end

### 値のリスト vals を受け取り、頂点のリスト vets を返す ###
def vals_to_vets(vals)
  Array.new(vals.length) { |i| Vertex.new(vals[i]) }
end

### 頂点のリスト vets を受け取り、値のリスト vals を返す ###
def vets_to_vals(vets)
  Array.new(vets.length) { |i| vets[i].val }
end
