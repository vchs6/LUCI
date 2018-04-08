
    m = Map("test", "test") 
    -- 配置文件中对应的section  
    s = m:section(TypedSection, "interface", "test")  
    -- 不允许增加或删除  
    s.addremove = true  
    -- 不显示Section的名称  
    
    s:option(Value, "user", "youruser")  
    key = s:option(Value, "pass", "your password")  
    key.password = true 

    return m  