local result = get("readystate")
local user = get("contentsuser")
local ai = get("contentsai")
local query = get("message")

get("send").on_click(function()
	result.set_content("Generating...")
	local input = query.get_content()
	user.set_content(input)
	
	fetch({
		url = "https://llm-mirror.loophole.site/chatgpt?input=" .. input,
		method = "GET",
		headers = { },
		body = ""
	}).then(function(res)
		if res and res.status then
			return res.json()
		else
			error("Request failed")
		end
	end).then(function(data)
		if data and data.message then
			ai.set_content(data.message)
			result.set_content("Done!")
		else
			error("Invalid response data")
		end
	end).catch(function(err)
		result.set_content("Error: " .. tostring(err))
	end)
end)
