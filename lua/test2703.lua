local fun=function ( ... )
    -- body
    local func=newCounter(10)
    print("ff1 ",func());
    print("ff1 ",func());
    print("ff1 ",func());
    func=newCounter(80)
    print("ff2 ",func());
    print("ff2 ",func());
    print("ff2 ",func());

end
fun()