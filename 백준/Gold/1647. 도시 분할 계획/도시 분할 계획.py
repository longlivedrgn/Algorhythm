

def find_root(root, a):
    if root[a] != a:
        root[a] = find_root(root, root[a])
    return root[a]

def union_root(root, a, b):
    a = find_root(root, a)
    b = find_root(root, b)

    if a < b:
        root[b] = a
    else:
        root[a] = b

paths = []
n, m = map(int, input().split())
root = [0] * (n+1)

for i in range(1, n+1):
    root[i] = i

for _ in range(m):
    a, b, cost = map(int, input().split())
    paths.append((cost, a, b))

paths.sort()

result = 0
last = 0 # 최소 신장 트리에 포함되는 간선 중에서 가장 비용이 큰 간선

for path in paths:
    cost, a, b = path
    if find_root(root, a) != find_root(root, b):
        union_root(root, a, b)
        result += cost
        last = cost

print(result - last)