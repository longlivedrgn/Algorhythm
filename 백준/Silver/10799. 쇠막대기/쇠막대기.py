import sys

stack = list(sys.stdin.readline().rstrip())

countStack = [] # 갯수를 셀 수 있는 stack 생성
# flag는 현재 앞에 있는 놈이 "("임을 말해준다.
# "("가 보이면 계속 countStack에 넣기
# ")"가 보이면
# 1) 그 전이 "("라면(flag = true) countStack에서 pop하고 남은 거 싹 다 더하기!
# 2) 그 전이 ")"라면(flag = false) 그냥 pop하고 +1만 하기

flag = True
count = 0
for i in stack:
    if i == "(":
        countStack.append(i)
        flag = True # 현재 앞이 "("인가 -> true
    elif i == ")":
        if flag == True: # 앞에 있는 놈이 "("이면!
            countStack.pop()
            count += len(countStack)
            flag = False # 앞에 있는 놈이 ")"라고 알려주자!
        else: # 현재 앞에 있는 놈이 ")"이다!
            countStack.pop() # 그러면 그냥 막대기를 끝내자!
            count += 1
print(count)