# ✅ IBM App Connect Engineer Mode - Verification Guide

## Setup Verification Checklist

Use this checklist to verify that the IBM App Connect Engineer mode is properly configured and ready to use.

### 1. Mode Configuration ✓

**File:** `.bob/custom_modes.yaml`

- [x] Mode entry added with slug `app-connect`
- [x] Mode name set to "🔗 IBM App Connect Engineer"
- [x] Role definition includes App Connect expertise
- [x] Tool groups configured (read, edit, command, browser, mcp)

**Verification:**
```bash
# Check if mode is in configuration
grep -A 5 "slug: app-connect" .bob/custom_modes.yaml
```

### 2. Documentation Files ✓

**Created Files:**
- [x] `.bob/APP_CONNECT_SETUP.md` - Complete setup guide
- [x] `.bob/APP_CONNECT_QUICK_REFERENCE.md` - Quick reference guide
- [x] `.bob/APP_CONNECT_VERIFICATION.md` - This verification guide

**Verification:**
```bash
# List App Connect documentation files
ls -la .bob/APP_CONNECT_*.md
```

### 3. README Updated ✓

**File:** `README.md`

- [x] App Connect mode listed in Available Modes section
- [x] Key features documented
- [x] Links to setup guide and quick reference added

**Verification:**
```bash
# Check README includes App Connect
grep "App Connect" README.md
```

## How to Activate the Mode

### In VS Code with Bob:

1. **Open Bob Panel**
   - Click the Bob icon in the sidebar
   - Or use the command palette: `Cmd/Ctrl + Shift + P` → "Bob: Open"

2. **Select Mode**
   - Click on the current mode name at the top of the Bob panel
   - Scroll to find **🔗 IBM App Connect Engineer**
   - Click to activate

3. **Verify Activation**
   - The mode name should appear at the top of the Bob panel
   - You should see "🔗 IBM App Connect Engineer" displayed

### Alternative: Command Palette

1. Open Command Palette: `Cmd/Ctrl + Shift + P`
2. Type: "Bob: Switch Mode"
3. Select: **🔗 IBM App Connect Engineer**

## Test the Mode

### Quick Test 1: Simple Question

**Ask:**
```
What is IBM App Connect Enterprise?
```

**Expected Response:**
- Clear explanation of ACE
- Key features and capabilities
- Use cases

### Quick Test 2: Create a Simple Flow

**Ask:**
```
Create a simple message flow that accepts HTTP POST requests
```

**Expected Response:**
- Message flow design
- HTTP Input node configuration
- Basic processing logic
- Response handling

### Quick Test 3: Data Transformation

**Ask:**
```
How do I transform JSON to XML in App Connect?
```

**Expected Response:**
- Transformation approaches (ESQL, Mapping)
- Code examples
- Best practices

## Troubleshooting

### Mode Not Appearing

**Problem:** App Connect mode doesn't appear in mode list

**Solutions:**
1. Restart VS Code
2. Verify `.bob/custom_modes.yaml` syntax is correct
3. Check for YAML formatting errors
4. Ensure file is saved

**Verify YAML syntax:**
```bash
# Install yamllint if needed
pip install yamllint

# Check YAML syntax
yamllint .bob/custom_modes.yaml
```

### Mode Activates But Doesn't Work

**Problem:** Mode activates but doesn't provide App Connect-specific responses

**Solutions:**
1. Verify the roleDefinition in custom_modes.yaml
2. Check that all tool groups are enabled
3. Restart VS Code after making changes
4. Clear Bob's cache if available

### Documentation Not Found

**Problem:** Links to documentation files return 404

**Solutions:**
1. Verify files exist in `.bob/` directory
2. Check file names match exactly (case-sensitive)
3. Ensure files are committed to repository

## Configuration Details

### Mode Slug
```yaml
slug: app-connect
```
- Used internally by Bob
- Must be unique across all modes
- Lowercase with hyphens only

### Mode Name
```yaml
name: 🔗 IBM App Connect Engineer
```
- Displayed in UI
- Includes emoji for visual identification
- User-friendly description

### Tool Groups
```yaml
groups:
  - read      # Read files and documentation
  - edit      # Modify files
  - command   # Execute commands
  - browser   # Use browser for testing
  - mcp       # Use MCP servers
```

## Next Steps

After verification:

1. ✅ **Read the Setup Guide**
   - Open [`.bob/APP_CONNECT_SETUP.md`](.bob/APP_CONNECT_SETUP.md)
   - Understand capabilities and use cases

2. ✅ **Review Quick Reference**
   - Open [`.bob/APP_CONNECT_QUICK_REFERENCE.md`](.bob/APP_CONNECT_QUICK_REFERENCE.md)
   - Familiarize yourself with common patterns

3. ✅ **Try Example Tasks**
   - Create a simple REST API
   - Build a data transformation flow
   - Implement error handling

4. ✅ **Explore Advanced Features**
   - Security configuration
   - Performance optimization
   - Deployment strategies

## Success Criteria

Your setup is complete when:

- ✅ Mode appears in Bob's mode selector
- ✅ Mode activates without errors
- ✅ Mode provides App Connect-specific responses
- ✅ Documentation files are accessible
- ✅ Test questions return relevant answers

## Getting Help

If you encounter issues:

1. **Check Documentation**
   - Review setup guide
   - Consult quick reference
   - Read this verification guide

2. **Verify Configuration**
   - Check YAML syntax
   - Verify file locations
   - Ensure proper permissions

3. **Restart VS Code**
   - Close all windows
   - Reopen project
   - Reactivate mode

4. **Ask the Mode**
   - Once activated, ask: "How do I use this mode?"
   - Request specific help: "I'm having trouble with [issue]"

## Additional Resources

- **IBM App Connect Documentation**: https://www.ibm.com/docs/en/app-connect
- **IBM App Connect Enterprise**: https://www.ibm.com/docs/en/app-connect/12.0
- **IBM Developer**: https://developer.ibm.com/integration/
- **Bob Documentation**: Check Bob's official documentation for mode creation

---

## Verification Complete! 🎉

If all checks pass, your IBM App Connect Engineer mode is ready to use!

**Start building integrations with:**
```
Create a REST API that [your requirement]
```

**Made with Bob** 🤖