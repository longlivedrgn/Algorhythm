n, m = map(int, input().split())
nums = list(map(int, input().split()))
nums.sort()

lst = []

def DFS():
    if len(lst) == m:
        print(" ".join(map(str, lst)))
        return
    for i in range(0, n):
        # if nums[i] not in lst:
        lst.append(nums[i])
        DFS()
        lst.pop()

DFS()