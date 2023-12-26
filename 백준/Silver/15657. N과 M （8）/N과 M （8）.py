n, m = map(int, input().split())
nums = list(map(int, input().split()))
nums.sort()

lst = []

def DFS(depth):
    if len(lst) == m:
        print(" ".join(map(str, lst)))
        return
    for i in range(depth, n):
        # if nums[i] not in lst:
        lst.append(nums[i])
        DFS(i)
        lst.pop()

DFS(0)