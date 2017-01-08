

--[[test2501
width=100
height=200
--]]

--[[test2502
--BLUE={r=0,g=0,b=1}
background=BLUE
--]]

--[[test2503
function getResult( x,y )
	-- body
	return x+y
end
function f( x,y )
	-- body
	return getResult(x,y);
end

--]]

--[[test2601
-- sin=mysin(180)
-- print(" sin == ",sin);

-- dir,str=mydir("/Users/wen/test")
-- if dir then 
-- 	for i,v in ipairs(dir) do
-- 		print(i,v)
-- 	end
-- else 
-- 	print("error ",str);	
-- end 
--]]


--[[test2701
testTable={1,2,3};
mymap(testTable,function (x)
	-- body
	return x*x;
end);
for i,v in ipairs(testTable) do
	print("i ==",i," v ==",v)
end
--]]
---[[ test2702
strTable=mysplit("I Love You!"," ");
for i,v in ipairs(strTable) do
	print("i ==",i," v ==",v)
end
--]]
