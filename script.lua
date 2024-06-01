local result = get("readystate")
local modelelem = get("modelname")
local modelelem2 = get("model")
local user = get("contentsuser")
local ai = get("contentsai")
local query = get("message")

local gpt35 = get("model1")
local gpt4o = get("model2")
local gpt4t = get("model3")

local model = "3.5"

gpt35.on_click(function()
	modelelem.set_content("GPT-3.5 Turbo")
	modelelem2.set_content("GPT-3.5 Turbo")
	model = "3.5"
end)

gpt4o.on_click(function()
	modelelem.set_content("GPT-4o")
	modelelem2.set_content("GPT-4o")
	model = "4o"
end)

gpt4t.on_click(function()
	modelelem.set_content("GPT-4 Turbo")
	modelelem2.set_content("GPT-4 Turbo")
	model = "4t"
end)

get("send").on_click(function()
	result.set_content("Generating...")
	local input = query.get_content();
	user.set_content(input)
	local res = fetch({
		url = "https://llm-mirror.loophole.site/chatgpt?model=" .. model .. "&input=" .. input,
		method = "GET",
		headers = { },
		body = ""
	})
	while true do
		if res then
			ai.set_content(res["message"])
			result.set_content("Done!")
			break
		end
	end
end)
