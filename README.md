C:\Users\brand\AppData\Roaming\helix
```bash
# If these exist, back them up (they’ll override the packaged runtime/queries)
mv ~/.config/helix/runtime ~/.config/helix/runtime.bak 2>/dev/null || true
mv ~/.config/helix/languages.toml ~/.config/helix/languages.toml.bak 2>/dev/null || true
# clear cached grammars
rm -rf ~/.cache/helix
```
