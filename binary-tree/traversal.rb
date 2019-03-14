=begin

These are the solutions I provided on leetcode.com for their traversing a tree chapter

***Set-up for all challenges***
Definition for a binary tree node.
class TreeNode
    attr_accessor :val, :left, :right
    def initialize(val)
        @val = val
        @left, @right = nil, nil
    end
end

@param {TreeNode} root
@return {Integer[]}

=end


def rcrv_preorder(root)
    # recursive traversal solution
    return [] if !root
    [root.val] + rcrv_preorder(root.left) + rcrv_preorder(root.right)
end

def itr_preorder()
    # iterative solution
    unresolved = []
    answer = []
    while root
        answer << root.val
        unresolved << root.right if root.right
        root = root.left
        root ||= unresolved.pop
    end
    answer
end