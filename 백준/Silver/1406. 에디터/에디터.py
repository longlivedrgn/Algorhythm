import sys
stack = list(sys.stdin.readline().rstrip())
stack_new = []

for _ in range(int(input())):
    b = list(sys.stdin.readline().split())
    if b[0] == "L":
        if stack:
            stack_new.append(stack.pop())
    elif b[0] == "D":
        if stack_new:
            stack.append(stack_new.pop())
    elif b[0] == "B":
        if stack:
            stack.pop()
    elif b[0] == "P":
        stack.append(b[1])


stack_new.reverse()
lst = stack + stack_new
print("".join(lst))