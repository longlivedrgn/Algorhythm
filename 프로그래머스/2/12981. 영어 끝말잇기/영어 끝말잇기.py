def solution(n, words):
    wordSet = set()
    answer = []
    cnt = 1
    current = words[0]
    wordSet.add(current)
    for i in range(1, len(words)):
        cnt += 1
        word = words[i]
        if word[0] != current[-1] or word in wordSet:
            turn = cnt // n
            surplus = cnt % n
            if surplus == 0:
                return [n, turn]
            else:
                return [surplus, turn+1]
        current = word
        wordSet.add(current)
    return [0, 0]