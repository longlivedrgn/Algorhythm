directions = {
    'L': [-1, 0], # c, r
    'R' : [1, 0],
    "U" : [0, -1],
    "D" : [0, 1]
}


def solution(dirs):
    answer = 0
    dirs_set = set()
    current = [0,0]
    for dir in dirs:
        d_c = directions[dir][0]
        d_r = directions[dir][1]
        
        n_c = d_c + current[0]
        n_r = d_r + current[1]
        if  -5 <= n_c <= 5 and -5 <= n_r <= 5:
            if (current[0], current[1], n_c, n_r) not in dirs_set:
                dirs_set.add((current[0], current[1], n_c, n_r))
                dirs_set.add((n_c, n_r, current[0], current[1]))
                answer += 1
            current = [n_c, n_r]

    return answer