 
    module("luci.controller.test", package.seeall)  

    function index()  
    entry({"admin", "network", "802.1x"}, cbi("test"), _("TEST"), 100).dependent=false 
    end  