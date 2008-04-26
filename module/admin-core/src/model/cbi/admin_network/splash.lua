-- ToDo: Translate, Add descriptions and help texts
require("ffluci.model.uci")

m = Map("luci_splash", "Client-Splash", [[Client-Splash ist das Freifunk Hotspot-Authentifizierungs-System.]])

s = m:section(TypedSection, "iface", "Schnittstellen")
s.addremove = true
s.anonymous = true

iface = s:option(ListValue, "network", "Schnittstelle")
for k, v in pairs(ffluci.model.uci.show("network").network) do
	if v[".type"] == "interface" and k ~= "loopback" then
		iface:value(k)
	end
end

s = m:section(TypedSection, "whitelist", "Automatische Freigabe")
s.addremove = true
s.anonymous = true
s:option(Value, "mac", "MAC-Adresse")

s = m:section(TypedSection, "blacklist", "Automatische Sperrung")
s.addremove = true
s.anonymous = true
s:option(Value, "mac", "MAC-Adresse")
	
return m