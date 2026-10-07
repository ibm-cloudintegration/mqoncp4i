---
name: github-token-retrieval
description: Automatically retrieve GitHub Personal Access Token before making GitHub MCP calls
---

# GitHub Token Retrieval Skill

This skill MUST be activated BEFORE making ANY MCP tool call to the GitHub MCP server.

## Token Retrieval Process

Follow these steps in order to retrieve the GitHub Personal Access Token:

<Steps>
<Step>
**Check `.env` First, Then Shell Environment Variables**

First inspect [`.env`](.env) for [`GITHUB_PERSONAL_ACCESS_TOKEN`](.env) without printing the token value. Use a command that only checks whether the key exists and captures the value internally for later use.

If [`.env`](.env) contains a non-empty token value, use this token and skip to Step 4.

If [`.env`](.env) does not contain the token, inspect the shell environment for [`GITHUB_PERSONAL_ACCESS_TOKEN`](shell:1) without printing the token value. Read it internally and use it if present.

If the shell environment contains a non-empty token value, use this token and skip to Step 4.

Never use commands that print token values to terminal output when performing these checks.
</Step>

<Step>
**Fallback to .bob/mcp.json**

If neither [`.env`](.env) nor the shell environment contains the token, read the MCP configuration file:

```
<read_file>
<args>
<file>
<path>.bob/mcp.json</path>
</file>
</args>
</read_file>
```

Look for the GITHUB_PERSONAL_ACCESS_TOKEN environment variable reference in the github server configuration:
- `mcpServers.github.env.GITHUB_PERSONAL_ACCESS_TOKEN`

The format will typically be an environment variable reference or direct token value.
</Step>

<Step>
**Extract Token Value**

Extract the token value. Unlike TechZone tokens, GitHub tokens typically don't have a "Bearer " prefix in the configuration.

If you see an environment variable reference like `${GITHUB_PERSONAL_ACCESS_TOKEN}`, resolve it by first checking [`.env`](.env) and then the shell environment as described in Step 1.
</Step>

<Step>
**Use Token in GitHub MCP Call**

GitHub MCP server uses the token through environment variables, not as a parameter. The token should already be configured in the MCP server's environment.

For GitHub operations, the token is automatically used by the MCP server if properly configured.

If you need to verify the token is available, check all configured sources in this order:
1. [`.env`](.env)
2. shell environment variable
3. [`.bob/mcp.json`](.bob/mcp.json) github server env section

Do not print the token value while verifying availability.
</Step>

<Step>
**Handle Missing Token**

If token is not found in [`.env`](.env), shell environment variables, OR [`.bob/mcp.json`](.bob/mcp.json), inform the user:

"The GitHub Personal Access Token is not configured. Please configure it in one of these locations, in this order of precedence:

1. Add [`GITHUB_PERSONAL_ACCESS_TOKEN`](.env) to [`.env`](.env):
   ```
   GITHUB_PERSONAL_ACCESS_TOKEN=your_token_here
   ```

2. Set the shell environment variable:
   ```
   export GITHUB_PERSONAL_ACCESS_TOKEN=your_token_here
   ```

3. Add it to [`.bob/mcp.json`](.bob/mcp.json) at:
   ```
   mcpServers.github.env.GITHUB_PERSONAL_ACCESS_TOKEN
   ```

You can generate a token from: https://github.com/settings/tokens

Required scopes: repo, read:org, read:user"

NEVER ask the user to provide the token directly in the chat.
</Step>
</Steps>

## Critical Rules

1. **NEVER Skip Token Retrieval**: Always verify the token is configured before GitHub operations
2. **NEVER Hardcode Tokens**: Always retrieve fresh from [`.env`](.env), shell environment variables, or [`.bob/mcp.json`](.bob/mcp.json)
3. **NEVER Ask for Token in Chat**: Only ask user to configure it in proper location if missing
4. **Check `.env` First**: This is the preferred lookup source for this workflow
5. **Check Shell Environment Variables Second**: Only after [`.env`](.env) is checked
6. **NEVER Print Tokens to Terminal Output**: Read and use token values internally only
7. **GitHub MCP Uses Environment Variables**: Unlike TechZone MCP, GitHub MCP reads the token from its environment configuration, not as a parameter

## Authentication Failure Handling

If authentication fails after verifying the token is configured, inform the user:

"GitHub authentication failed. Please verify:
1. Your token is valid and not expired
2. The token has the required scopes: repo, read:org, read:user
3. You may need to regenerate it from https://github.com/settings/tokens"

## Applies To

This skill must be used for the GitHub MCP server when performing operations that require authentication.

## Pre-Flight Checklist

Before making GitHub MCP calls that require authentication, verify:

- [ ] Have I checked [`.env`](.env) for [`GITHUB_PERSONAL_ACCESS_TOKEN`](.env)?
- [ ] If [`.env`](.env) was empty, have I checked the shell environment variable without printing it?
- [ ] If both were empty, have I read [`.bob/mcp.json`](.bob/mcp.json)?
- [ ] Have I verified the token is configured in the GitHub MCP server environment?
- [ ] If token not found anywhere, have I informed the user where to configure it?