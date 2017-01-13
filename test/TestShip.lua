package.path = package.path .. ';../?.lua'
local lu = require 'luaunit'
require 'ship'


-- Test classes must start with "Test" to be seen by luaunit
-- A gotcha is that the unit tests are ran in alphabetical order except for setUp
TestShip = {}
	function TestShip:setUp()
		battleship = Ship:new{location = {"A1", "B1", "C1", "D1"}}
	end

	function TestShip:test1Init()
		lu.assertEquals(battleship:length() , 4)
		lu.assertFalse(battleship:isSunk())
		lu.assertEquals(#battleship.hitLocations, 0)
	end

	function TestShip:test2Hits()
		lu.assertTrue(battleship:isHit("A1"))
		lu.assertEquals(#battleship.hitLocations, 1)
		lu.assertEquals(battleship.hitLocations[1], "A1")
		lu.assertFalse(battleship:isSunk())
	end

	function TestShip:test3Misses()
		lu.assertFalse(battleship:isHit("A2"))
		lu.assertEquals(#battleship.hitLocations, 1)
		lu.assertFalse(battleship:isSunk())
	end

	function TestShip:test4Sinking()
		lu.assertTrue(battleship:isHit("B1"))
		lu.assertEquals(#battleship.hitLocations, 2)
		lu.assertEquals(battleship.hitLocations[2], "B1")
		lu.assertFalse(battleship:isSunk())

		lu.assertTrue(battleship:isHit("C1"))
		lu.assertEquals(#battleship.hitLocations, 3)
		lu.assertEquals(battleship.hitLocations[3], "C1")
		lu.assertFalse(battleship:isSunk())

		lu.assertTrue(battleship:isHit("D1"))
		lu.assertEquals(#battleship.hitLocations, 4)
		lu.assertEquals(battleship.hitLocations[4], "D1")
		lu.assertTrue(battleship:isSunk())
	end

local runner = lu.LuaUnit.new()
runner:setOutputType("tap")
os.exit( runner:runSuite() )