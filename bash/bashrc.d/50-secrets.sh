# API tokens for MCP servers/tools — values live in KWallet (Secret Service), looked up via
# libsecret's secret-tool; NOT stored in this public repo. Store one with:
#   secret-tool store --label=<name> service <name>
# Empty if the wallet is locked (e.g. SSH without a desktop session) — nothing breaks.
_secret() { secret-tool lookup service "$1" 2>/dev/null; }

# Rhinara MCP
export RHINARA_YOUTRACK_TOKEN="$(_secret rhinara-youtrack-token)"
# Lectera MCP
export LECTERA_SENTRY_ACCESS_TOKEN="$(_secret lectera-sentry-token)"
export LECTERA_GITLAB_TOKEN=""
export LECTERA_JIRA_TOKEN=""
export LECTERA_CONFLUENCE_TOKEN=""
# WEC MCP (other project)
export WEC_SENTRY_ACCESS_TOKEN="$(_secret wec-sentry-token)"
export WEC_GITLAB_TOKEN=""
export WEC_JIRA_TOKEN=""
export WEC_CONFLUENCE_TOKEN=""
export GITHUB_PAT="$(_secret github-pat)"
# Steam Games MCP
export STEAM_API_KEY="$(_secret STEAM_API_KEY)"
export STEAM_ID="$(_secret STEAM_ID)"
# TMDB MCP
export TMDB_API_TOKEN="$(_secret tmdb-api-token)"
export OMDB_API_KEY="$(_secret omdb-api-key)"
# MAL (MyAnimeList) MCP
export MAL_CLIENT_ID="$(_secret mal-client-id)"
export MAL_REFRESH_TOKEN="$(_secret mal-refresh-token)"
# AniList MCP
export ANILIST_CLIENT_ID="$(_secret anilist-client-id)"
export ANILIST_CLIENT_SECRET="$(_secret anilist-client-secret)"
export ANILIST_ACCESS_TOKEN="$(_secret anilist-mcp-token)"
# NAS TOS god password is NOT exported — used per call via `secret-tool lookup service
# nas-tos-password | ssh nas ...` (see ~/Documents/nas/docs/ssh-tos.md).

unset -f _secret
