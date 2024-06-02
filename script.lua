local result = get("readystate")
local modelelem = get("modelname")
local modelelem2 = get("model")
local user = get("contentsuser")
local ai = get("contentsai")
local query = get("message")

local gpt35 = get("model1")
local gpt4o = get("model2")
local gpt4t = get("model3")
local claudeinst = get("model4")
local claude2 = get("model5")
local claude3h = get("model6")
local claude3s = get("model7")
local llama3 = get("model8")
local mixtral = get("model9")

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

claudeinst.on_click(function()
	modelelem.set_content("Claude v1.2")
	modelelem2.set_content("Claude v1.2")
	model = "1.2"
end)

claude2.on_click(function()
	modelelem.set_content("Claude v2.0")
	modelelem2.set_content("Claude v2.0")
	model = "2.0"
end)

claude3h.on_click(function()
	modelelem.set_content("Claude 3 Haiku")
	modelelem2.set_content("Claude 3 Haiku")
	model = "3h"
end)

claude3s.on_click(function()
	modelelem.set_content("Claude 3 Sonnet")
	modelelem2.set_content("Claude 3 Sonnet")
	model = "3s"
end)

llama3.on_click(function()
	modelelem.set_content("LLaMA 3 70b")
	modelelem2.set_content("LLaMA 3 70b")
	model = "l3"
end)

mixtral.on_click(function()
	modelelem.set_content("Mixtral 8x22b")
	modelelem2.set_content("Mixtral 8x22b")
	model = "m22"
end)

get("send").on_click(function()
	result.set_content("Generating...")
	local input = query.get_content();
	user.set_content(input)
	input = string.gsub(input, "&", "%%26").gsub(input, "?", "%%3F").gsub(input, "=", "%%3D")
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
