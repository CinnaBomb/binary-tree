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
		top_node = Node.new(array[0])
		parent_node = top_node
		node_placed = false
		for i in (1...array.length)
			while node_placed == false

				if array[i] >= parent_node.value 
					if parent_node.right_child == nil
						parent_node.right_child = Node.new(array[i], parent_node)
						node_placed = true
					else
						parent_node = parent_node.right_child
					end

				elsif array[i] < parent_node.value 
					if parent_node.left_child == nil
						parent_node.left_child = Node.new(array[i], parent_node)
						node_placed = true
					else
						parent_node = parent_node.left_child
					end
				end

			end
			node_placed = false
		end

end

array = [1, 7, 4, 23, 8, 9, 4, 3, 5, 7, 9, 67, 6345, 324]

b = BinaryTree.new
b.build_tree(array)
puts b