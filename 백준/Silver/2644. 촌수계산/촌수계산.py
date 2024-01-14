people_number = int(input())
find_chon = list(map(int, input().split()))
relation_count = int(input())

visited = [False for _ in range(people_number+1)]
family_tree = [[] for _ in range(people_number+1)]

for _ in range(relation_count):
    inputs = list(map(int, input().split()))
    family_tree[inputs[0]].append(inputs[1])
    family_tree[inputs[1]].append(inputs[0])

isFound = False

def DFS(start, depth):
    global isFound
    if start == find_chon[1]:
        print(depth)
        isFound = True
    for i in family_tree[start]:
        if visited[i] == False:
            visited[i] = True
            DFS(i, depth+1)

visited[find_chon[0]] = True
DFS(find_chon[0], 0)
if isFound == False:
    print(-1)