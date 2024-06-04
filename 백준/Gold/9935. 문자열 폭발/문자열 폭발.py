input_string = input()
bomb = input()
bomb_length = len(bomb)
stack = []

for i in range(len(input_string)):
    stack.append(input_string[i])
    if ''.join(stack[-bomb_length:]) == bomb:
        for _ in range(bomb_length):
            stack.pop()

# 결과 출력
if stack:
    print(''.join(stack))
else:
    print('FRULA')