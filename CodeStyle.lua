--代码规范

--[[
命名规则
1、是不区分作用域的，太多规则记不过来。
2、类 结构体 枚举 的命名规则一致 （驼峰式 首字符大写）
3、变量：局部变量、参数、成员变量、全局变量还有函数的命名规则一致 （驼峰式 首字母小写）
4、见名识意最好。
--]]
--[[
类
1、首先添加类说明 时间 和创建者。 
2、为导入的类声明为local类型，以免污染环境和内存清理。
3、项目中最好只有类 即使是配置文件也以类的形式给出，比如Config.lua 也是一个类。
4、使用引擎提供的class函数创建类。
5、在 ctor函数中做成员变量的初始化工作。
6、类声明为local 最后return。
--]]

--[[
函数
1、函数开头有函数用途和参数说明，返回值说明
2、定义函数时使用冒号形式。
--]]


--例子如下：
--[[ 
    Filename:    CodeStyle.lua
    Author:      <chengw@ourgame.com> 
    Datetime:    2017-01-06 14:34:00
    Description: File description
--]]

local DependentClass=import("ClassName")

-- 常量定义形式
local NUM=100

-- 枚举定义格式
local ColorEnum = enum({
    "kBlack",
    "kRed",
    }
)

local CodeStyle = class("CodeStyle",SuperClassName)

--[[
    Description: 构造函数。用户初始化变量。
--]]
function CodeStyle:ctor()
    self.userName="";
end 
--[[
    Description: 设置用户名
    userName: 用户名
--]]
function CodeStyle:setUserName(varName)
    self.userName=varName;
end 
--[[
    Description: 获取用户名
    return : 用户名
--]]
local function CodeStyle:getUserName()
    return self.userName
end 
--[[
    Description: 打印用户名
--]]
function CodeStyle:printName()
    -- 局部变量
    local varName = self.userName 
    print("userName == ",varName);
end 
return CodeStyle 