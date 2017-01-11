testTable={1,2,3};
mymap(testTable,function (x)
    -- body
    return x*x;
end);
for i,v in ipairs(testTable) do
    print("i ==",i," v ==",v)
end