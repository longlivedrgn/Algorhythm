import sys
word = list(sys.stdin.readline().rstrip()) # 전체 string을 문자 하나씩 list에 넣는데, 맨 마지막 /n을 제거하기!
i = 0
start = 0

while i < len(word):
    if word[i] == "<": # 열린 괄호를 만나면!
        i += 1
        while word[i] != ">": # 닫힌 괄호를 만날 때까지
            i += 1
        i += 1 # 닫힌 괄호를 만난 후 인덱스를 하나 증가시킨다.
    elif word[i].isalnum(): # 숫자나 알파벳을 만나면!..
        start = i
        while i < len(word) and word[i].isalnum(): # 전체 길이보다 작거나, 알파벳, 숫자도 아닐때까지
            i += 1 # i를 계속 더해나간다!
        tmp = word[start:i] # 괄호 안이 아닌 것들을 가져와서
        tmp.reverse() # reverse를 해버린다!
        word[start:i] = tmp # 그리고, 원래 있는 거기에다가 쏙 집어넣기!
    else: # 만약 괄호도 아니고, 알파벳, 숫자도 아니라면? (공백)
        i += 1 # 계속 증가시키기!

print("".join(word))