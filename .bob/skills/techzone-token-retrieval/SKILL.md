---
name: techzone-token-retrieval
description: Automatically retrieve TechZone API bearer tokens before making MCP calls to TechZone servers
---

# TechZone Token Retrieval Skill

This skill MUST be activated BEFORE making ANY MCP tool call to TechZone MCP servers (techzone-documentation-mcp, techzone-request-mcp, techzone-environment-mcp).

## Token Retrieval Process

Follow these steps in order to retrieve the bearer token:

<Steps>
<Step>
**Check `.env` First, Then Shell Environment Variables**

First inspect [`.env`](.env) for [`TECHZONE_API_TOKEN`](.env) without printing the token value. Use a command that only checks whether the key exists and captures the value internally for later use.

Example approach:
- read [`.env`](.env)
- find the last [`TECHZONE_API_TOKEN=`](.env) entry
- store the value internally
- do not print the token to terminal output

If [`.env`](.env) contains a non-empty token value, use this token and skip to Step 4.

If [`.env`](.env) does not contain the token, inspect the shell environment for [`TECHZONE_API_TOKEN`](shell:1) without printing the token value. Read it internally and use it if present.

If the shell environment contains a non-empty token value, use this token and skip to Step 4.

Also check for [`GITHUB_PERSONAL_ACCESS_TOKEN`](shell:1) if GitHub operations are needed, using the same precedence:
1. [`.env`](.env)
2. shell environment variable

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

Look for the Authorization header in the appropriate server configuration:
- `mcpServers.techzone-documentation-mcp.headers.Authorization`
- `mcpServers.techzone-request-mcp.headers.Authorization`
- `mcpServers.techzone-environment-mcp.headers.Authorization`

The format will be: `"Authorization": "Bearer [token_value]"`
</Step>

<Step>
**Extract Token Value**

Extract ONLY the token value after "Bearer " (remove the "Bearer " prefix).

Example:
- Full value: `"Bearer abc123xyz456"`
- Extracted token: `abc123xyz456`
</Step>

<Step>
**Use Token in MCP Call**

Pass the extracted token as the `bearerToken` parameter in your MCP tool call:

```
<use_mcp_tool>
<server_name>techzone-request-mcp</server_name>
<tool_name>techzone-get-platform</tool_name>
<arguments>
{
  "platformId": "[platform_id]",
  "bearerToken": "[retrieved_token_value]"
}
</arguments>
</use_mcp_tool>
```

The `bearerToken` parameter is REQUIRED for all TechZone MCP tool calls.
</Step>

<Step>
**Handle Missing Token**

If token is not found in [`.env`](.env), shell environment variables, OR [`.bob/mcp.json`](.bob/mcp.json), inform the user:

"The bearer token for TechZone API is not configured. Please configure it in one of these locations, in this order of precedence:

1. Add [`TECHZONE_API_TOKEN`](.env) to [`.env`](.env):
   ```
   TECHZONE_API_TOKEN=your_token_here
   ```

2. Set the shell environment variable:
   ```
   export TECHZONE_API_TOKEN=your_token_here
   ```

3. Add it to [`.bob/mcp.json`](.bob/mcp.json) at:
   ```
   mcpServers.[server-name].headers.Authorization: "Bearer your_token_here"
   ```

You can generate a token from: https://techzone.ibm.com/my/profile"

NEVER ask the user to provide the token directly in the chat.
</Step>
</Steps>

## Critical Rules

1. **NEVER Skip Token Retrieval**: Always retrieve the token before making TechZone MCP calls
2. **NEVER Hardcode Tokens**: Always retrieve fresh from [`.env`](.env), shell environment variables, or [`.bob/mcp.json`](.bob/mcp.json)
3. **NEVER Ask for Token in Chat**: Only ask user to configure it in proper location if missing
4. **Check `.env` First**: This is the preferred lookup source for this workflow
5. **Check Shell Environment Variables Second**: Only after [`.env`](.env) is checked
6. **NEVER Print Tokens to Terminal Output**: Read and use token values internally only
7. **Remove "Bearer " Prefix**: Only pass the token value, not the full Authorization header

## Authentication Failure Handling

If authentication fails after retrieving the token, inform the user:

"Authentication failed. Please verify your token is valid and not expired. You may need to regenerate it from https://techzone.ibm.com/my/profile"

## Applies To

This skill must be used for these MCP servers:
- techzone-documentation-mcp
- techzone-request-mcp
- techzone-environment-mcp

## Pre-Flight Checklist

Before making any TechZone MCP call, verify:

- [ ] Have I checked [`.env`](.env) for [`TECHZONE_API_TOKEN`](.env)?
- [ ] If [`.env`](.env) was empty, have I checked the shell environment variable without printing it?
- [ ] If both were empty, have I read [`.bob/mcp.json`](.bob/mcp.json)?
- [ ] Have I extracted the bearer token for the target server?
- [ ] Am I including the `bearerToken` parameter in my MCP call?
- [ ] Did I remove the "Bearer " prefix from the token?
- [ ] If token not found anywhere, have I informed the user where to configure it?