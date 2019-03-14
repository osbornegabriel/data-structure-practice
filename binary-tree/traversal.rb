# These are solutions I provided on leetcode.com for their traverse a tree chapter

# Definition for a binary tree node.
# class TreeNode
#     attr_accessor :val, :left, :right
#     def initialize(val)
#         @val = val
#         @left, @right = nil, nil
#     end
# end

# @param {TreeNode} root
# @return {Integer[]}

def rcrv_preorder_trav(root)
    # recursive solution
    return [] if !root
    [root.val] + rcrv_preorder_trav(root.left) + rcrv_preorder_trav(root.right)
end