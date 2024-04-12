def solution(s):
    answer = ''
    string_list = list(map(int, s.split()))
    string_list.sort()
    
    answer = str(string_list[0]) + " " + str(string_list[-1])
    return answer