local result = get("readystate")
local user = get("contentsuser")
local ai = get("contentsai")
local query = get("message")

get("send").on_click(function()
	result.set_content("Generating...")
	local input = query.get_content();
	user.set_content(input)
	local res = fetch({
		url = "https://llm-mirror.loophole.site/chatgpt?input=" .. input,
		method = "GET",
            	headers = { },
            	body = ""
	})
	
	if res and res.status then
		ai.set_content(res["message"])
		result.set_content("Done!")
	end
end)
