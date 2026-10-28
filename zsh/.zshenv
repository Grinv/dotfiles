# Always do a full `brew update` check before install/upgrade/tap — the default
# throttle (24h, or 1h after a dev command) was causing `brew upgrade --greedy`
# to silently skip fetching new formulae/cask data.
export HOMEBREW_AUTO_UPDATE_SECS=0

export NVM_DIR="$HOME/.nvm"

# Rhinara MCP tokens
export RHINARA_YOUTRACK_TOKEN="$(security find-generic-password -a "$USER" -s rhinara-youtrack-token -w 2>/dev/null)"

# Lectera MCP tokens — from Keychain, NOT stored in this public repo
export LECTERA_SENTRY_ACCESS_TOKEN="$(security find-generic-password -a "$USER" -s lectera-sentry-token -w 2>/dev/null)"
export LECTERA_GITLAB_TOKEN=""
export LECTERA_JIRA_TOKEN=""
export LECTERA_CONFLUENCE_TOKEN=""

# WEC MCP tokens (other project) — from Keychain, NOT stored in this public repo
export WEC_SENTRY_ACCESS_TOKEN="$(security find-generic-password -a "$USER" -s wec-sentry-token -w 2>/dev/null)"
export WEC_GITLAB_TOKEN=""
export WEC_JIRA_TOKEN=""
export WEC_CONFLUENCE_TOKEN=""

export GITHUB_PAT="$(security find-generic-password -a "$USER" -s github-pat -w 2>/dev/null)"

# Steam Games MCP — from Keychain, NOT stored in this public repo
export STEAM_API_KEY="$(security find-generic-password -a "$USER" -s STEAM_API_KEY -w 2>/dev/null)"
export STEAM_ID="$(security find-generic-password -a "$USER" -s STEAM_ID -w 2>/dev/null)"

# TMDB MCP tokens — from Keychain, NOT stored in this public repo
export TMDB_API_TOKEN="$(security find-generic-password -a "$USER" -s tmdb-api-token -w 2>/dev/null)"
export OMDB_API_KEY="$(security find-generic-password -a "$USER" -s omdb-api-key -w 2>/dev/null)"

# MAL (MyAnimeList) MCP tokens — from Keychain, NOT stored in this public repo
export MAL_CLIENT_ID="$(security find-generic-password -a "$USER" -s mal-client-id -w 2>/dev/null)"
export MAL_REFRESH_TOKEN="$(security find-generic-password -a "$USER" -s mal-refresh-token -w 2>/dev/null)"

# AniList MCP tokens — from Keychain, NOT stored in this public repo
export ANILIST_CLIENT_ID="$(security find-generic-password -a "$USER" -s anilist-client-id -w 2>/dev/null)"
export ANILIST_CLIENT_SECRET="$(security find-generic-password -a "$USER" -s anilist-client-secret -w 2>/dev/null)"
export ANILIST_ACCESS_TOKEN="$(security find-generic-password -a "$USER" -s anilist-mcp-token -w 2>/dev/null)"

# TOS 7 (NAS) session token — from Keychain, NOT stored in this public repo.
# Session token: expires ~24h. Refresh with: tos login --token-only (on the NAS as god),
# then: security add-generic-password -a "$USER" -s nas-tos-token -w '<token>' -U
export TOS_TOKEN="$(security find-generic-password -a "$USER" -s nas-tos-token -w 2>/dev/null)"

# qBittorrent WebUI password (NAS) — from Keychain, NOT in this public repo. Note: the on-box
# canonical script reads /Volume1/ai/apps/qbittorrent/.qbt-cred; this Mac copy is for convenience.
export QBITTORRENT_PASS="$(security find-generic-password -a "$USER" -s nas-qbittorrent-password -w 2>/dev/null)"

# qBittorrent WebUI API key (>=5.2.0, Bearer auth) — from Keychain, NOT in this public repo.
# The on-box canonical scripts read /Volume1/ai/creds/qbittorrent/.qbt-apikey; this Mac copy is
# for convenience. Generate/rotate via WebUI: Preferences -> WebUI -> API Key -> Generate.
export QBITTORRENT_APIKEY="$(security find-generic-password -a "$USER" -s nas-qbittorrent-apikey -w 2>/dev/null)"
