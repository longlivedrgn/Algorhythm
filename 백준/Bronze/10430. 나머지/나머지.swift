var nums = readLine()!.split(separator: " ").map {Int($0)!}

var A = nums[0]
var B = nums[1]
var C = nums[2]

print((A+B)%C)
print(((A%C)+(B%C))%C)
print((A*B)%C)
print(((A%C)*(B%C))%C)