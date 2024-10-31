def solution(files):
    # 중요한 포인트!...
    # 먼저 파일명을 head, number, tail로 split하는거!.. 그걸 어떤 식으로 할 지(flag 활용)
    # 그리고 그걸 다시 리스트로 묶어서 람다함수를 활용해서 sorting하기!..
    # sorting하는 방법 꼭꼭 기억하기!.. 
    answer = []
    splitted = []
    for file in files:
        head = ""
        number = ""
        tail = ""
        is_number_checked = False
        for i in range(len(file)):
            if file[i].isdigit():
                is_number_checked = True
                number += file[i]
            elif is_number_checked == False:
                head += file[i]
            else:
                tail = file[i:]
                break
        splitted.append([head, number, tail])
    splitted.sort(key = lambda x: (x[0].lower(), int(x[1])))
    for s in splitted:
        answer.append("".join(s))
    return answer