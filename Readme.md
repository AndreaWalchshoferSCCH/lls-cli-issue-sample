# Sample Repo for demonstrating configuration issue

Usage:
Extract a lua-language-server.zip into language-server directory, so that the `language-server.exe` can be found at `language-server/bin/lua-language-server.exe`
Then run `call-lls.ps1` or use command in script to call the check

Expected: No problems found, as all diagnostics are turned off
Actual: `cast-local-type` diagnostic for src/main/workshop01.lua