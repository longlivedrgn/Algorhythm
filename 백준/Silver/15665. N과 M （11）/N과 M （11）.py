n, m = map(int, input().split())
nums = list(map(int, input().split()))
nums.sort()

lst = []
visited = [False] * n
numSet = set()

def DFS(depth):
    if len(lst) == m:
        temp = " ".join(map(str, lst))
        if temp not in numSet:
            print(temp)
            numSet.add(temp)
        return
    for i in range(0, n):
        lst.append(nums[i])
        visited[i] = True
        DFS(i)
        lst.pop()
        visited[i] = False
DFS(0)