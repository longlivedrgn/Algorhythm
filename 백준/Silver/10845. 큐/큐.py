import sys
input = sys.stdin.readline
stack = []
for _ in range(int(input())):
    lst = list(input().split())
    m = lst[0]
    if m == "push":
        stack.append(lst[1])
    elif m == "pop":
        if len(stack) == 0:
            print(-1)
        else:
            print(stack.pop(0))
    elif m == "size":
        print(len(stack))
    elif m == "empty":
        if len(stack) == 0:
            print(1)
        else:
            print(0)
    elif m == "front":
        if len(stack) == 0:
            print(-1)
        else:
            print(stack[0])
    elif m == "back":
        if len(stack) == 0:
            print(-1)
        else:
            print(stack[-1])