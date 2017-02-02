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

	attr_accessor :top_node

	def build_tree(array)
		@top_node = Node.new(array[0])
		parent_node = @top_node
		node_placed = false
		for i in (1...array.length)
				#puts ""
				#puts "num: #{array[i]}"
			while node_placed == false


				if array[i] >= parent_node.value 
					#puts "#{array[i]} >= #{parent_node.value}"
					if parent_node.right_child.nil?
						parent_node.right_child = Node.new(array[i], parent_node)
						node_placed = true
					else
						parent_node = parent_node.right_child
					end

				elsif array[i] < parent_node.value 
					#puts "#{array[i]} < #{parent_node.value}"
					if parent_node.left_child.nil?
						parent_node.left_child = Node.new(array[i], parent_node)
						node_placed = true
					else
						parent_node = parent_node.left_child
					end
				end

			end
			node_placed = false
			parent_node = @top_node
		end
	end

	def breadth_first_search(value)
		#trav = []
		q = []
		current_node = @top_node
		#trav.push(current_node.value)
		while !current_node.nil?
			#puts current_node.value
			return current_node if current_node.value == value
			q.push current_node.left_child if !current_node.left_child.nil?
			q.push current_node.right_child if !current_node.right_child.nil?
			current_node = q.shift
			#trav.push(current_node.value)
		end

	end

	def depth_first_search(value)

	end

	def dfs_rec(value)

	end

end

array = [1, 7, 4, 23, 8, 9, 4, 3, 5, 7, 9, 67, 6345, 324]

b = BinaryTree.new
b.build_tree(array)
#b.to_s
puts b.breadth_first_search(6345).value
puts b.breadth_first_search(6345).left_child.value
