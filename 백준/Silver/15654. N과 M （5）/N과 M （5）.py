n, m = map(int, input().split())
nums = list(map(int, input().split()))
nums.sort()

lst = []

def DFS():
    if len(lst) == m:
        print(" ".join(lst))
        return
    for i in nums:
        if str(i) not in lst:
            lst.append(str(i))
            DFS()
            lst.pop()

DFS()