require 'lep'

print("## Mathematical tests: \n")
print("Round pi to 2 decimal houses: " .. math.round(math.pi, 2))
print("Pseudo random number: " .. math.prandom(0, 10))
print("Random sign number: " .. 3*math.rsign())
print("-3 is a :" .. math.sign(-3) .. " number")
print("linear interpolation of 15, 30, 0.5: " .. math.lerp(15, 30, 0.5))
print("clamp 256 to 0-255: " .. math.clamp(256, 0, 255))
print("multiply of 32 most approach of 144: " .. math.multiply(144, 32))
print("lenght from the vector 1, 1: " .. math.vect2Lenght(1, 1))
print("normalized vector 32, 16: " .. math.normalize(32, 16) .. "\n")

print("## String tests: \n")

tokenzined = string.tokenzine("hello-world", "-")

print("split string hello-world, token: -")
for _, token in ipairs(tokenzined) do
    print(token)
end

print("\nGet all string between '1' and '1' text(\"the smart 1fox1 jump the lazy dog\"): \n")

stringsBetweenTheOne = string.between("the smart 1fox1 jump the lazy dog", "1")

for _, str in ipairs(stringsBetweenTheOne) do
    print(str)
end

print("\nstring is only spaces: " .. tostring(string.isOnly("     ", "%s")))

print("Get all stribg from a tablr: ")
testTable = {
    "Ipsum",
    3,
    "dolor",
    "emit"
}
for _, str in ipairs(string.get(testTable)) do
    print(str)
end

print("\n## Table tests: \n")
numbers = {
    1, 
    5, 
    6
}
print("display content of the table numbers: " .. table.displayContent(numbers))
print("Get a random number from a table: " .. table.random(numbers))
print("reverse ipairs: ")
for _, number in ripairs(numbers) do
    print(number)
end