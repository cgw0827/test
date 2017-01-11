sin=mysin(180)
print(" sin == ",sin);

dir,str=mydir("/Users/wen/test")
if dir then 
    for i,v in ipairs(dir) do
        print(i,v)
    end
else 
    print("error ",str);    
end 