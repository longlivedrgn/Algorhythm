
var num = Int(readLine()!)!
var tree = Array(repeating: [Int](), count: num+1)

// 일단 tree에는 서로 중복되는 간선도 넣어준다!..
for _ in 0..<(num-1) {
    var nums = readLine()!.split(separator: " ").map { Int(String($0))! }
    tree[nums[0]].append(nums[1])
    tree[nums[1]].append(nums[0])
}
// [[], [2, 3], [1, 4], [1, 5, 6], [2, 7, 8], [3, 9, 10], [3, 11, 12], [4], [4], [5], [5], [6], [6]]

var visited = Array(repeating: false, count: num+1)
var queue = [Int]()
queue.append(1)
visited[1] = true
var parent = Array(repeating: -1, count: num+1)

func BFS(node: Int) {
    while !queue.isEmpty {
        let popped = queue.removeLast()

        // 트리는 이미 방문했다고 찍어놨기에 다시 방문하지 않는다!
        for m in tree[popped] {
            if !visited[m] {
                parent[m] = popped
                queue.append(m)
                visited[m] = true
            }
        }
    }
}

BFS(node: 1)

for (m,n) in parent.enumerated() {
    if m > 1 {
        print(n)
    }
}