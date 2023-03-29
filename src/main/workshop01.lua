print("Hello Lua!")

local function calcFactorial()
end

local func = calcFactorial
local cor = coroutine.create(calcFactorial)

calcFactorial()

print(type(nil)) -- nil
print(type(true)) -- boolean
print(type(false)) -- boolean
print(type(2)) -- number
print(type(2.0)) -- number
print(type(2.1)) -- number
print(type({})) -- table
print(type({1, 2, 3})) -- table
print(type(func)) -- function
print(type("")) -- string
print(type("hello")) -- string
print(type(cor)) -- thread

if type(calcFactorial) == "boolean" then
	print("OK")
end

local f = function(x) print("TEST", x) end

f(2)

local x = 0
print(x)
x = nil
if x then
	print(nil, "True")
else
	print(nil, "False")
end

local values = { true, false, 0, 1, "", "Test", nil, nil, 10, 11}
values[2] = nil
for i, v in pairs(values) do
	if v then
		print(i, v, "TRUE")
	else
		print(i, v, "FALSE")
	end
end

print(#values, "length")

for i = 1, 10 do
	print(i, values[i])
end

local tMixed = { ["Name"] = "Theo", "First index", [33] = 9, 44, ["x"] = false }
for k, v in pairs(tMixed) do
	print(k, v)
end
for i, v in ipairs(tMixed) do
	print(i, v)
end

local tDict = { ["Name"] = "Theo", [33] = 9, [22] = 44, ["x"] = false }
for k, v in pairs(tDict) do
	print(k, v)
end

local z = 30
local tDict2 = { Name = "Franz", [z] = 340}
print(tDict2.Name, tDict2[z], tDict2.z)

-- 22	44
-- x	false
-- Name	Theo
-- 33	9

print(#values, #tMixed, #tDict)

local h = nil
local text = "Start" .. 43 .. " Mitte " .. "a\97  \252ber \120 x" .. tostring(h)
print(string.format("Der Text '%s', hat %d Zeichen", text, #text))
print([[Dieser Tesxt
  erstreckt \252ber
	  3 Zeilen.]])
print("Der geht \nauch so\n   so.")

print(10 or 20)
print(10 or error())
print(nil or "a")
print(nil and 10)
print(false and error())
print(false and nil)
print(10 and 20)

local isOk = true
local g = isOk and 1 or 2
print(g)

isOk = false
g = isOk and 1 or 2
print(g)

local u = nil
local y = isOk and u or 2
print(y)

-- If uncommented, the next line will result in an error and end the execution of this script:
-- print(nil or error("323"))

local a, b, c = 7, 2 * 4, 3 ^ 2
print(a, b, c)

a, b = b, a
print(a, b)

local o = 2
while o < 100 do
	print(o)
	o = o * o
end

repeat
	print(o)
	o = o + o
until o > 1000

for i = 10, 1, -1 do
	print(i)
end


--[[ Aufgabe:
CalcFactorial implementieren:
0! = 1, 1! = 0! * 1, 2! = 1! * 2

Beispiel-Ausgabe:
fact of	0	is	1
fact of	1	is	1
fact of	2	is	2
fact of	3	is	6
fact of	4	is	24
fact of	5	is	120
fact of	6	is	720
fact of	7	is	5040
fact of	8	is	40320
fact of	9	is	362880
fact of	10	is	3628800
fact of	11	is	39916800
----- ]]

-- Lösung von Heiko Müller:

local function fact(n)
  if type(n) ~= "number" or n < 0 then
    return nil, "not a natural number"
  end

  if n == 0 then
    return 1
  end

  return n * fact(n-1)
end

print("Beispiel fact")

for i = 0, 11 do
  print("fact(" .. i .. ") = " .. fact(i))
end

print("finish")


local util = require('workshop_01.util')

local p = util.Test1()
print(p)

p = util.Test1()
print(p)

local myUp = util.MakeCounter()
local myUp2 = util.MakeCounter()
myUp()
myUp()
myUp2()

