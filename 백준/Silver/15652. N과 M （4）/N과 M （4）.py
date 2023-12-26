n, m = map(int, input().split())

lst = []

def DFS(depth):
    if len(lst) == m:
        print(" ".join(lst))
        return
    for i in range(depth, n+1):
        lst.append(str(i))
        DFS(i)
        lst.pop()

DFS(1)