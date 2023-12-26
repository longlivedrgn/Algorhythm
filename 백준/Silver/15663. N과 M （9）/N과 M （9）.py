n, m = map(int, input().split())
nums = list(map(int, input().split()))
nums.sort()

lst = []
visited = [False] * n
numSet = set()

def DFS():
    if len(lst) == m:
        temp = " ".join(map(str, lst))
        if temp not in numSet:
            print(temp)
            numSet.add(temp)
        return
    for i in range(0, n):
        if not visited[i]:
            lst.append(nums[i])
            visited[i] = True
            DFS()
            lst.pop()
            visited[i] = False
DFS()