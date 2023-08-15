var num = Int(readLine()!)!
var tree: [String: [String]] = [:]
for _ in 0..<num {
    var nums = readLine()!.split(separator: " ").map { String($0) }
    tree.updateValue([nums[1], nums[2]], forKey: nums[0])
}
// ["D": [".", "."], "G": [".", "."], "B": ["D", "."], "A": ["B", "C"], "C": ["E", "F"], "E": [".", "."], "F": [".", "G"]]

// 전위 순회 -> 내가 방문된 후에 자손들이 방문된다.
var result = ""
func preOrderDFS(node: String) {
    if node == "." {
        return
    }
    result += node

    for i in tree[node]! {
        preOrderDFS(node: i)
    }

}

preOrderDFS(node: "A")
print(result)

// 중위 순회 -> 왼쪽부터 오른쪽으로 스캔!
result = ""
func inOrderDFS(node: String) {
    if tree[node]![0] != "." {
        inOrderDFS(node: tree[node]![0])
    }
    result += node

    if tree[node]![1] != "." {
        inOrderDFS(node: tree[node]![1])
    }
}
inOrderDFS(node: "A")
print(result)

// 후위 순회 -> 내 자손들이 다 방문되어야지 내가 방문된다.
result = ""
func postOrder(node: String) {
    if node == "." {
        return
    }

    for i in tree[node]! {
        postOrder(node: i)
    }

    result += node
}
postOrder(node: "A")
print(result)
