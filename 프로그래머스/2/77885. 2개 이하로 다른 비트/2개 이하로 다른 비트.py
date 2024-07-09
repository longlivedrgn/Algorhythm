def solution(numbers):
    answer = []

    for num in numbers:
        # 짝수일 때
        if num % 2 == 0:
            answer.append(num+1)
        # 홀수일 때
        else:
            # 앞에 0이랑 b 뜯어내기
            binary_number = "0" + bin(num)[2:] 
            z_index = binary_number.rfind("0") # 가장 오른쪽에 있는 0 찾기
            binary_list = list(binary_number)
            binary_list[z_index] = "1" # 가장 오른쪽에 있는 0은 1로 바꾸기
            binary_list[z_index+1] = "0" # 그 옆 칸은 1로 바꾸기
            
            joined_binary = "".join(binary_list) # 다시 string으로 변환하기
            
            answer.append(int(joined_binary, 2)) # 2진수를 10진수로 변경하기
            
                
    return answer