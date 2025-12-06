return {
	"milanglacier/minuet-ai.nvim",
	dependencies = { "nvim-lua/plenary.nvim" },
	enabled = vim.env.OPENROUTER_API_KEY_AUTOCOMPLETE ~= nil,
	event = "BufReadPre",
	opts = function()
		local system_prompt = [[
You are an AI code-completion engine.
Task: produce only the next few code tokens that should appear immediately after the <cursorPosition> marker.

Guidelines:
1) Preserve the user's whitespace and indentation exactly, THIS IS REALLY IMPORTANT! Follow the indentation and tab style given in the header.
2) Do NOT close scopes/functions/blocks for the user unless the closing token is the very next token that must appear.
3) Output raw code only. No explanations, no markdown fences.
4) Keep each completion minimal and concise: one line or a very short snippet. Stop early when a blank line or a closing token would follow.
5) Do NOT REPEAT CODE that already exists near <cursorPosition>.
6) When multiple plausible solutions exist, return multiple options separated by <endCompletion>.
7) Always follow the best practices recommended for the language and framework used.
    ]]

		local few_shots = {
			{
				role = "user",
				content = [[
# language: python
<contextBeforeCursor>
def greet(name):
    if not name:
        return "Hi"
    <cursorPosition>
<contextAfterCursor>
print(greet("Ada"))
]],
			},
			{
				role = "assistant",
				content = [[return f"Hello, {name}!"
<endCompletion>
message = f"Hello, {name}!"
return message
]],
			},

			{
				role = "user",
				content = [[
# language: javascript
<contextBeforeCursor>
function sum(arr) {
  let s = 0;
  for (const n of arr) {
    <cursorPosition>
<contextAfterCursor>
  return s;
}
]],
			},
			{
				role = "assistant",
				content = [[s += n;
<endCompletion>
if (typeof n === "number") s += n;
]],
			},

			{
				role = "user",
				content = [[
# language: typescript
<contextBeforeCursor>
type User = {
  id: string;
  name: string;
};

function getDisplayName(u: User) {
  <cursorPosition>
<contextAfterCursor>
export {}
]],
			},
			{
				role = "assistant",
				content = [[return u.name ?? "Unknown";
<endCompletion>
const n = u.name?.trim() || "Unknown";
return n;
]],
			},
		}

		local prefix_first_template =
			"{{{language-and-tab}}}\n<contextBeforeCursor>\n{{{context_before_cursor}}}<cursorPosition>\n<contextAfterCursor>\n{{{context_after_cursor}}}"

		return {
			provider = "openai_compatible",
			request_timeout = 6,
			context_window = 12000,
			throttle = 200,
			debounce = 80,
			notify = "warn",

			virtualtext = {
				auto_trigger_ft = { "*" },
				auto_trigger_ignore_ft = {
					"TelescopePrompt",
					"alpha",
					"neo-tree",
					".env",
					"env",
					".enc.yaml",
					".enc.yml",
					"lazy",
					"NvimTree",
					"Trouble",
					"lir",
					"Outline",
					"undotree",
					"fugitive",
					"DiffviewFiles",
					"toggleterm",
				},
				keymap = {
					accept = "<C-y>",
					accept_line = "<C-l>",
					accept_n_lines = "<C-j>",
					prev = "<A-[>",
					next = "<A-]>",
					dismiss = "<C-d>",
				},
				show_on_completion_menu = false,
			},

			provider_options = {
				openai_compatible = {
					api_key = "OPENROUTER_API_KEY_AUTOCOMPLETE",
					end_point = "https://openrouter.ai/api/v1/chat/completions",
					-- model = "google/gemini-2.5-flash-lite",
					-- model = "moonshotai/kimi-linear-48b-a3b-instruct",
					model = "qwen/qwen3-next-80b-a3b-instruct",
					name = "OpenRouter",
					system = { prompt = system_prompt },
					few_shots = few_shots,
					chat_input = { template = prefix_first_template },
					stream = true,
					optional = {
						max_tokens = 256,
						top_p = 0.95,
						temperature = 0.5,
						stop = { "\n\n", "<endCompletion>", "};" },
						provider = {
							sort = "throughput",
						},
						reasoning = {
							enabled = false,
							exclude = true,
							effort = "minimal",
						},
					},
				},
			},
		}
	end,
}
