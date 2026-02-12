# My Dotfiles

Collection of my config files.

In this repositories are my config for:

- zsh
- WezTerm
- Helix

## zsh

Install oh-my-zsh with

```sh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

and just copy the `.zshrc` into the `~/` folder.

## WezTerm

I mainly use it for Helix for its good cli API and config files.

Download with brew

```sh
brew install --cask wezterm
```

and put the `.wezterm.lua` file in the `~/`. After reopening it should be ok.

## Helix

This is mainly for julia/python development, so most configs and extras are built for those in mind.

Im using a fork by [gj118 in GitHub](https://github.com/gj1118/helix?tab=readme-ov-file).

For building Helix, Rust is required, install *rustup* with

```sh
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
```

and follow instructions on screen for finalizing.

After that we can build the Helix project and initialize the grammars for treesitter

```sh
cargo install --path helix-term --locked
cp -R runtime ~/.config/helix/
hx -g fetch
hx -g build
```

Remenber to run this commands from inside the folder of Helix.

We can check the status of this installation with something like `hx --health julia`, we can change julia for
whatever language we prefer. The output should be as follows

```sh
> hx --health julia
Configured language servers:
  ✓ jetls: /Users/eduardo/.julia/bin/jetls
Configured debug adapter: None
Configured formatter:
  ✓ /Users/eduardo/.juliaup/bin/julia
Tree-sitter parser: ✓
Highlight queries: ✓
Textobject queries: ✓
Indent queries: ✓
Tags queries: ✘
Rainbow queries: ✘
```

The important part here is the parser, highlighter, etc, on a clear install lsp and formatter aren't installed.
Later I'll show the process for it.

This should have the editor already in a functional state. The config files go in `~/.config/helix`

For applying my customization lets first download the lsp and formatter for julia. Currently I'm using JETLS.jl
and JuliaFormatter.jl, we can add them by

```sh
julia -e 'using Pkg; Pkg.Apps.add(; url="https://github.com/aviatesk/JETLS.jl", rev="release")'
julia --project=@juliaformatter --startup-file=no -e 'using Pkg; Pkg.add("JuliaFormatter")'
```

With that done we can them copy this config files, *.toml*, to the helix folder in `~/.config/helix`, you can
follow the exact structure in the helix folder from this repository.

After that it should work out of the box.

### Troubleshoot

If the multipane command doesn't work check if the script has permission i.e. `chmod +x helix/helix-run-repl.zsh`.

- https://tonisagrista.com/blog/2024/on-neovim-and-helix/
- https://maurow.bitbucket.io/notes/helix-julia-latex-setup.html
