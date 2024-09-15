input_strings = input()
a_count = input_strings.count("a")
answer = 1001

new_strings = input_strings + input_strings # 원형이므로 옆으로 이어준다!

for i in range(0, len(new_strings) - a_count+1):
    temp = new_strings[i:i+a_count]
    answer = min(answer, temp.count("b"))

print(answer)

