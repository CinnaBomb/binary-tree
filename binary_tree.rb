class Node

	attr_accessor :value, :parent, :left_child, :right_child

	def initialize(value=nil, parent=nil, left_child=nil, right_child=nil)
		@value = value
		@parent = parent
		@left_child = left_child
		@right_child = right_child
	end

end

class BinaryTree

	def build_tree(array)
	end

end

array = [1, 7, 4, 23, 8, 9, 4, 3, 5, 7, 9, 67, 6345, 324]