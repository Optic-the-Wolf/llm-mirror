local result = get("readystate")
local user = get("contentsuser")
local ai = get("contentsai")
local query = get("message")

get("send").on_click(function()
	result.set_content("Generating...")
	local input = query.get_content();
	user.set_content(input)
	local res = fetch({
		url = "https://bobcat-lucky-publicly.ngrok-free.app/chatgpt?input=hi",
		method = "GET"
		-- headers = { ["Content-Type"] = "application/json" },  -- Uncomment if needed
		-- body = "{ \"key\": \"value\" }",  -- Uncomment and adjust if needed
	})
	
	if res and res.status then
		ai.set_content(res["message"])
		result.set_content("Done!")
	end
end)
