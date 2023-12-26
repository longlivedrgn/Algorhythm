n, m = map(int, input().split())

lst = []

def DFS(depth):
    if len(lst) == m:
        print(" ".join(lst))
        return
    for i in range(depth, n+1):
        if str(i) not in lst:
            lst.append(str(i))
            DFS(i+1)
            lst.pop()

DFS(1)