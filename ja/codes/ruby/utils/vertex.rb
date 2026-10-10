=begin
File: vertex.rb
Created Time: 2024-04-25
Author: Xuan Khoa Tu Nguyen (ngxktuzkai2000@gmail.com)
=end

### 頂点クラス ###
class Vertex
  attr_accessor :val

  def initialize(val)
    @val = val
  end
end

### 値リスト vals を入力し、頂点リスト vets を返す ###
def vals_to_vets(vals)
  Array.new(vals.length) { |i| Vertex.new(vals[i]) }
end

### 頂点リスト vets を入力し、値リスト vals を返す ###
def vets_to_vals(vets)
  Array.new(vets.length) { |i| vets[i].val }
end
