-- Copyright 2011 Jo-Philipp Wich <jow@openwrt.org>
-- Licensed to the public under the Apache License 2.0.

local fs = require "nixio.fs"

local f = SimpleForm("firewall",
	translate("Firewall - Custom Rules"),
	translate("Custom rules allow you to execute arbritary iptables commands \
		which are not otherwise covered by the firewall framework. \
		The commands are executed after each firewall restart, right after \
		the default ruleset has been loaded."))

local o = f:field(Value, "_custom")

o.template = "cbi/tvalue"
o.rows = 20

function o.cfgvalue(self, section)
	return fs.readfile("/etc/firewall.user")
end

function o.write(self, section, value)
	value = value:gsub("\r\n?", "\n")
	fs.writefile("/etc/firewall.user", value)
end

return f
