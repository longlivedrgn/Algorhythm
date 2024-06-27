def solution(files):
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