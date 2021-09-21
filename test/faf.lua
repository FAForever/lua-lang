-- This is a comment
#  This is another comment
print("passed # comment")

assert(10 != 10 == false)
assert(10 != 9 == true)
print("passed !=")

array = {1, 2, 3}
for i, v in array do
  assert(i == v)
end
print("passed implicit pairs")

i = 0
k = 0
repeat
  i = i + 1
  if math.mod(i, 2) == 0 then
    continue
  end
  k = k + 1
until i == 10
assert(k == 5)
print("passed continue in repeat")

k = 0
for i=1,10 do
  if math.mod(i, 2) == 0 then
    continue
  end
  k = k + 1
end
assert(k == 5)
print("passed continue in fornum")

array = {1, 2, 3, 4, 5, 6, 7, 8, 9}
k = 0
for _, i in array do
  if math.mod(i, 2) == 0 then
    continue
  end
  k = k + 1
end
assert(k == 5)
print("passed continue in forlist")

i = 0
k = 0
while i < 10 do
  i = i + 1
  if math.mod(i, 2) == 0 then
    continue
  end
  k = k + 1
end
assert(k == 5)
print("passed continue in while")

assert(0x0 == 0)
assert(0x1234 == 4660)
assert(0x2p30 == 2147483648)
print("passed hex literal")

assert(1 & 2 == 0)
assert(0xF0 & 0x0F == 0x00)
assert(0x3C & 0xFF == 0x3C)
assert(1 | 2 == 3)
assert(0xF0 | 0x0F == 0xFF)
assert(0x3C | 0xFF == 0xFF)
-- Associativity
assert(8 | 3 & 4 == 0)
assert(2 & 2 * 3 == 6)
print("passed bitwise and/or")

assert(1 >> -3 == 0)
assert(1 << 3 == 8)
assert(2 >> -1 == 0)
assert(1 << 1 == 2)
print("passed bitwise shift")

assert(2 ^ 2 == 0)
assert(2 ^ 30 == 28)
assert(0xF0F0 ^ 0x0F0F == 0xFFFF)
assert(0xFFFF ^ 0x0F0F == 0xF0F0)
print("passed xor")

-- Supcom has some non-conventional operator precedence
assert(2 ^ 30 - 1 == 27)
assert((2 ^ 30) - (1 << 1) == 26)
assert(2 ^ 30 - 1 << 1 == 26)
assert(2 ^ 30 - 1 << 2 == 24)
assert(2 ^ 30 - 1 << 3 == 20)
-- NOTE: SupCom uses floats and therefore encounters rounding errors. Using
-- doubles the answer would actually be -268435428.
assert(2 ^ 30 - 1 << 2 ^ 30 == -268435424)

-- some special cases
-- Does not pass for 0xffffffff (too large)
local c = {0, 1, 2, 3, 10, 0x80000000, 0xaaaaaaaa, 0x55555555, 0x7fffffff}
for _, b in pairs(c) do
  assert(b & 0 == 0)
  assert(b & b == b)
  assert(b & b & b == b)
  assert(b & b & b & b == b)
  assert(b | 0 == b)
  assert(b | b == b)
  assert(b | b | b == b)
  assert(b ^ b == 0)
  assert(b ^ b ^ b == b)
  assert(b ^ b ^ b ^ b == 0)
  assert(b ^ 0 == b)
  print("  passed " .. b)
end
print("passed binary operators")

str = "abcdefghijklmnop"
assert(str:sub(-2) == "op")
assert(str:sub(2) == "bcdefghijklmnop")
assert(str:sub(2, -2) == "bcdefghijklmno")
assert(str:sub(2, 8) == "bcdefgh")

assert(str:lualex() == str)

local string_func_names = {}
local n=0

for k in string do
  n=n+1
  string_func_names[n]=k
end
assert(table.concat(string_func_names) == table.concat({
  "sub",
  "lualex",
  "gfind",
  "rep",
  "gsub",
  "char",
  "dump",
  "find",
  "upper",
  "len",
  "format",
  "byte",
  "lower"
}))

print("passed string library")
