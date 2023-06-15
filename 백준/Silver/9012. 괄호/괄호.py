for _ in range(int(input())):
    stack = []
    m = str(input())
    for n in m:
        if n == "(":
            stack.append(n)
        else:
            if len(stack) == 0:
                stack.append(n)
            else:
                if stack[-1] == "(":
                    stack.pop()
    if len(stack) == 0:
        print("YES")
    else:
        print("NO")
