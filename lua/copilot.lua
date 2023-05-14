local function set_copilot_enabled()
  local f = vim.fn.getfsize(vim.fn.expand("<afile>"))
  if f > 100000 or f == -2 then
    vim.b.copilot_enabled = false
  end
end

vim.g["copilot_no_tab_map"] = true
vim.g["copilot_assume_mapped"] = true
vim.g["copilot_filetypes"] = {
  xml = false,
  sql = false,
  json = false,
  txt = false,
  markdown = true
}

vim.api.nvim_create_autocmd({
  event = "BufReadPre",
  pattern = "*",
}, set_copilot_enabled)
