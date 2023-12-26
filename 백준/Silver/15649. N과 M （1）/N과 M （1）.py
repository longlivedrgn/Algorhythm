n, m = map(int, input().split())

lst = []

def DFS():
    if len(lst) == m:
        print(" ".join(lst))
        return
    for i in range(1, n+1):
        if str(i) not in lst:
            lst.append(str(i))
            DFS()
            lst.pop()

DFS()