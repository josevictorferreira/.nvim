vim.filetype.add {
  extension = {
    cr = "crystal",
    sql = "sql",
    html = "html",
    snip = "snippet",
    sh = "sh",
    mts = "typescript",
    ftl = "freemarker",
    rbi = "ruby",
    rbs = "ruby",
  },
  filename = {
    ["nginx.conf"] = "nginx",
    ["tmux.conf"] = "tmux",
    ["docker-compose.yml"] = "yaml.docker-compose",
    ["docker-compose.yaml"] = "yaml.docker-compose",
    ["zsh.nix"] = "nix",
  },
  pattern = {
    [".*i3/config"] = "i3config",
    [".*/i3/*/*.config"] = "i3config",
    ["Dockerfile"] = "dockerfile",
    ["docker-compose"] = "yaml.docker-compose",
    [".*/templates/.*%.ya?ml"] = "helm",
    [".*/templates/.*%.tpl"] = "helm",
    [".*ya?ml.gotmpl"] = "helm",
    ["values.ya?ml.tpl"] = "helm",
    ["helmfile.*%.ya?ml"] = "helm",
  }
}
