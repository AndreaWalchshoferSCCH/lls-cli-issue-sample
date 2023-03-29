-- ---------------------------
-- Der Klassiker: Hello World!
print("Hello, Lua!")

--[[ Ausgabe:
Hello, Lua!
]]

print(" - - - - - ")

-- --------------
-- Die Datentypen

local function testFunc()
  return 1
end

local func = testFunc
local cor = coroutine.create(testFunc)

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

--[[ Ausgabe:
nil
boolean
boolean
number
number
number
table
table
function
string
string
thread
]]

print(" - - - - - ")

-- ---------------------
-- Bedingungen auswerten
local x = nil
if x then
  print(nil, "True")
else
  print(nil, "False")
end

local values = {true, false, 0, 1, "", "Test"}
for i, v in ipairs(values) do
  if v then
    print(i, v, "True")
  else
    print(i, v, "False")
  end
end

--[[ Ausgabe:
nil	False
1   true   True
2   false  False
3   0      True
4   1      True
5          True
6   Test   True
]]

print(" - - - - - ")

-- --------------
-- Datentyp table

local tArray = {"a", "b", "c"}
for i = 1, #tArray do
  print(i, tArray[i])
end
--[[ Ausgabe:
1   	a
2   	b
3   	c
]]

local tDict = {["a"] = 11, ["b"] = 22, ["c"] = 33}
for key, value in pairs(tDict) do
  print(key, value)
end
--[[ Ausgabe:
                              -- Reihenfolge variiert
c   	33                      c	33
b   	22                      a	11
a   	11                      b	22
]]

local aName = "Theo"
local tMixed = {["Name"] = "Theo", aName = "Sam", [aName] = "Tom", "First index", [33] = 9, 44, ["x"] = false}
for key, value in pairs(tMixed) do
  print(key, value)
end
--[[ Ausgabe:
1   	First index             1	    First index
2   	44                      2	    44
                              -- ab hier variiert die Reihenfolge
Theo    Tom                   Theo    Tom
aName   Sam                   x       false
Name	  Theo                  33      9
33      9                     Name    Theo
x       false                 aName   Sam
]]

print(tArray[2], tDict.c, tMixed[33], tMixed.Name, tMixed[2], tMixed.Theo, tMixed.aName, tMixed[1], tMixed[5])
--[[ Ausgabe:
b   33   9   Theo   44   Tom   Sam   First index   nil
]]

print(#tArray, #tDict, #tMixed, #aName)
--[[ Ausgabe:
3   0   2   4
]]

print(" - - - - - ")

-- -------
-- Datentyp string

local text = "Start " .. 43 .. " Mitte " .. "a\97  \252ber \120 x"
print(string.format("Der Text '%s' hat %d Zeichen.", text, #text))
print([[Dieser Text
  erstreckt sich \252ber
        3 Zeilen.]])
print("Das geht\nauch\n   so.")
for _ = 1, 4 do
  -- %[flags][width][.precision][length]specifier
  print(string.format("Zufallszahl: %06.2f", 1000 * math.random()))
end

local noValue = nil
print("No value: " .. tostring(noValue))

--[[ Ausgabe:
Der Text 'Start 43 Mitte aa  über x x' hat 27 Zeichen.
Dieser Text
  erstreckt sich \252ber
        3 Zeilen.
Das geht
auch
   so.
Zufallszahl: 001.25
Zufallszahl: 563.59
Zufallszahl: 193.30
Zufallszahl: 808.74
No value: nil
]]

print(" - - - - - ")

-- -------------------
-- Logische Operatoren

print(10 or 20)
print(10 or error())
print(nil or "a")
print(nil and 10)
print(false and error())
print(false and nil)
print(false or nil)
print(10 and 20)

-- Ternärer Operator: isOk ? 1 : 2
local isOk = true
local v1 = 1
local v2 = 2
print(isOk and v1 or v2)
isOk = false
print(isOk and v1 or v2)
isOk = true
local v3 = nil
print(isOk and v3 or v2)

--[[ Ausgabe:
10
10
a
nil
false
false
nil
20
1
2
2   -- Hier würden wir beim ternären Operator v1, also nil, erwarten!
]]

print(" - - - - - ")

-- -----------
-- Zuweisungen

local a, b, c = 7, 2 * 4, 3 ^ 2
print(a, b, c)

a, b = b, a
print("a=" .. a, "b=" .. b)

a, b, c = c, a, b
print("a=" .. a, "b=" .. b, "c=" .. c)

--[[ Ausgabe:
7	8	9
a=8	b=7
a=9	b=8	c=7
]]

print(" - - - - - ")

-- ---------
-- Schleifen

local y = 2
while y < 100 do
  print(y)
  y = y * y
end
--[[ Ausgabe:
2
4
16
]]

repeat
  print(y)
  y = y + y
until y > 1000
--[[ Ausgabe:
256
512
]]

for i = 3, 5 do
  print(i)
end
--[[ Ausgabe:
3
4
5
]]

for i = 4, 10, 2 do
  print(i)
end
--[[ Ausgabe:
4
6
8
10
]]

for i = 3, 0, -1 do
  print(i)
end
--[[ Ausgabe:
3
2
1
0
]]

print(" - - - - - ")

-- --------
-- Closures

local closure = require("closure")

print(closure.Test1())
print(closure.Test1())

local myUp1 = closure.MakeCounter()
local myUp2 = closure.MakeCounter()

print(myUp1())
print(myUp1())
print(myUp2())

--[[ Ausgabe:
TEST1  44
45
TEST1  45
46
UP     10
11
UP     11
12
UP     10
11
]]

print(" - - - - - ")

-- -------------
-- Mini-Programm

--[[ Aufgabe
  CalcFactorial implementieren:
  0! = 1, 1! = 1 * 0! = 1, 2! = 2 * 1! = 2, 3! = 3 * 2! = 6,...
]]

local function calcFactorial(n)
  if type(n) ~= "number" or n < 0 then
    return nil, "not a natural number"
  end

  if n == 0 then
    return 1
  end

  return n * calcFactorial(n - 1)
end

local function printFactorial(n)
  local f, err = calcFactorial(n)
  print(err or n .. "! = " .. f)
end

for n = 0, 11 do
  printFactorial(n)
end

printFactorial(-1)

--[[ Ausgabe:
0! = 1
1! = 1
2! = 2
3! = 6
4! = 24
5! = 120
6! = 720
7! = 5040
8! = 40320
9! = 362880
10! = 3628800
11! = 39916800
not a natural number
]]
