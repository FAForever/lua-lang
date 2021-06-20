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
