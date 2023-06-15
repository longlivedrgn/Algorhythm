for _ in range(int(input())):
    lst = list(input().split())
    for word in lst:
        for letter in word[::-1]:
            print(letter, end="")
        print(" ", end="")