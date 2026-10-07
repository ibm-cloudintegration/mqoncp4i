# IBM Technology Zone Content Engineer Mode

## Overview

The **IBM Technology Zone Content Engineer** mode is a specialized AI assistant designed to help Content Developers create high-quality environment definitions for IBM Technology Zone following official standards and practices.

This mode provides expert guidance in five primary areas:
1. **Creating Ansible Playbooks** for post-deploy customization
2. **Generating Manifests** for service provisioning
3. **Answering How-To Questions** about IBM Technology Zone environment definitions
4. **Debugging OpenShift Environments** using the `openshift-mcp` server
5. **Generating Deployer custom_values Overrides** for TechZone environment definitions

## Features

### 🎯 Core Use Cases

#### 1. Create Ansible Playbooks
Generate Ansible playbooks for post-deploy customization across multiple platforms:
- **IBM Cloud Services**: watsonx SaaS Shared, Account Vending
- **Base VMs**: OCPV Single/Multi-VM, IBM Cloud VPC VM
- **OpenShift Clusters**: OpenShift with Post-Deployer

Each platform has specific variable contexts and infrastructure requirements that are automatically handled.

#### 2. Create Manifests
Generate manifests for:
- **VPC Multi-VM**: Define multiple VMs in IBM Cloud VPC (YAML)
- **OCPV Multi-VM**: Define multiple VM specifications (YAML)
- **watsonx SaaS Shared**: Configure watsonx services (JSON)
- **Account Vending**: Provision IBM Cloud accounts with services (JSON)

Manifests include proper service definitions, access policies, authorizations, and identity provider settings.

#### 3. Answer How-To Questions
Get expert answers about:
- Environment definition structure and configuration
- Platform-specific requirements
- Variable handling and post-deploy contexts
- Best practices and troubleshooting

#### 4. Debug OpenShift Environments
Investigate TechZone OpenShift clusters and troubleshoot deployment issues with:
- **TechZone Request Lookup** via `techzone-request-mcp`
- **Cluster Health Inspection** via `openshift-mcp`
- **Operator, Node, Pod, and Event Analysis**
- **Interactive follow-up debugging** without manual kubeconfig management

#### 5. Generate Deployer custom_values Overrides
Generate deployer-oriented `custom_values` structures for environment definitions:
- **Tekton pipeline mode** configurations
- **Ansible job mode** configurations
- **Post-deployment chaining** structures
- **Environment definition integration** guidance for `infrastructure.custom_values`

### 🔒 Security & Compliance

- **Never displays sensitive information** (API keys, deploy keys, account IDs)
- **Validates all generated content** against IBM Technology Zone standards
- **Enforces security best practices** in all generated code
- **Stays within authorized scope** - only IBM Technology Zone content development

### 📚 Documentation Integration

- **Always fetches latest documentation** from `techzone-documentation-mcp`
- **Never relies on cached information** - ensures current standards
- **References official sources** in all responses
- **Retrieves example environment definitions** via `techzone-request-mcp`
- **Uses `openshift-mcp`** for OpenShift cluster debugging workflows

## Prerequisites

Before using this mode, ensure you have:

1. **IBM Technology Zone Access**
   - IBM w3id account
   - Access to https://techzone.ibm.com

2. **TechZone API Token Configuration** (REQUIRED)
   
   The mode requires your TechZone API token to access official documentation and examples.
   Configure the TechZone token in `.bob/mcp.json` or in your global MCP settings file.

   **Step 1: Get Your Token**
   - Navigate to https://techzone.ibm.com/my/profile
   - Click "Show Token"
   - Copy the token

   **Step 2: Update MCP Configuration**
   - Open the file: `.bob/mcp.json`
   - Find the `techzone-documentation-mcp` section
   - Locate the `Authorization` header
   - Ensure it uses `Bearer ${TECHZONE_API_TOKEN}` or your configured token source
   - Repeat for the `techzone-request-mcp` section
   - Save the file, or configure the same token in `~/.bob/settings/mcp_settings.json`

   Example:
   ```json
   {
     "mcpServers": {
       "github": {
         "command": "podman",
         "args": [
           "run",
           "-i",
           "--rm",
           "-e",
           "GITHUB_PERSONAL_ACCESS_TOKEN",
           "-e",
           "GITHUB_HOST",
           "ghcr.io/github/github-mcp-server"
         ],
         "env": {
           "GITHUB_PERSONAL_ACCESS_TOKEN": "${GITHUB_PERSONAL_ACCESS_TOKEN}",
           "GITHUB_HOST": "https://github.ibm.com"
         },
         "disabled": false,
         "alwaysAllow": []
       },
       "techzone-documentation-mcp": {
         "type": "streamable-http",
         "url": "https://documentation-mcp.techzone.ibm.com/mcp",
         "headers": {
           "Authorization": "Bearer ${TECHZONE_API_TOKEN}"
         },
         "disabled": false,
         "alwaysAllow": []
       },
       "techzone-request-mcp": {
         "type": "streamable-http",
         "url": "https://request-mcp.techzone.ibm.com/mcp",
         "headers": {
           "Authorization": "Bearer ${TECHZONE_API_TOKEN}"
         },
         "disabled": false,
         "alwaysAllow": []
       }
     }
   }
   ```

   **Step 3: Restart VS Code**
   - Close and reopen VS Code for the changes to take effect

   **Important Notes:**
   - 🔒 Keep your MCP settings secure - do not commit real tokens to repositories
   - 🔄 If sharing the mode, use `${TECHZONE_API_TOKEN}` placeholders rather than raw tokens

3. **Additional Environment Variables** (Optional)
   ```bash
   export GITHUB_PERSONAL_ACCESS_TOKEN="your_github_token"  # For publishing to GitHub
   export AWS_ACCESS_KEY_ID="your_s3_access_key"            # For S3 operations
   export AWS_SECRET_ACCESS_KEY="your_s3_secret_key"        # For S3 operations
   export AWS_REGION="us-east-1"                            # For S3 operations
   ```

4. **MCP Server Configuration**
   - GitHub MCP server for repository operations
   - TechZone Documentation MCP for official documentation (requires token)
   - TechZone Request MCP for example environment definitions and reservation lookups (requires token)
   - OpenShift MCP server for cluster debugging and health checks
   - S3 MCP for object storage operations

## Quick Start

### Starting a Session

When you activate this mode, you'll be presented with the primary task options:

```
Welcome! I'm your IBM Technology Zone Content Engineer. 
Which task would you like help with today?

1. Create an Ansible Playbook for post-deploy customization
2. Create a Manifest for watsonx SaaS Shared, Account Vending, or Multi-VM
3. Debug an OpenShift environment or cluster
4. Generate deployer custom_values for an environment definition
```

### Example: Creating an Ansible Playbook

1. **Select Use Case**: Choose "Create an Ansible Playbook"
2. **Specify Platform**: Indicate your platform (e.g., "OCPV Single VM")
3. **Describe Requirements**: Explain what you want to install/configure
4. **Review Generated Content**: The mode will generate:
   - Complete Ansible playbook following platform standards
   - Environment definition variables showing integration
   - Post-deploy output configuration

### Example: Creating a Manifest

1. **Select Use Case**: Choose "Create a Manifest"
2. **Specify Platform**: Choose from VPC Multi-VM, OCPV Multi-VM, watsonx SaaS Shared, or Account Vending
3. **Specify Requirements**:
   - For VPC/OCPV Multi-VM: Describe VM specifications, OS types, compute profiles
   - For IBM Cloud Services: List which services to provision
4. **Review Generated Content**: The mode will generate:
   - Complete manifest (JSON for services, YAML for VMs) with all required sections
   - Service definitions with programmatic names (for IBM Cloud services)
   - VM specifications with proper image names and profiles (for Multi-VM)
   - Access policies and authorizations (for IBM Cloud services)
   - Integration instructions and complete environment definition example

### Example: Getting Help

1. **Select Use Case**: Choose "Answer how-to questions"
2. **Ask Your Question**: e.g., "How do I pass variables to my VM playbook?"
3. **Receive Comprehensive Answer**: Including:
   - Direct answer to your question
   - Context and explanation
   - Code examples
   - References to official documentation

### Example: Debugging an OpenShift Cluster

1. **Select Use Case**: Choose "Debug an OpenShift environment or cluster"
2. **Provide Identifier**: Supply a TechZone request ID or environment ID
3. **Inspect Cluster Health**: The mode will use `techzone-request-mcp` and `openshift-mcp`
4. **Review Findings**: The mode summarizes operator, node, pod, and event health

### Example: Generating Deployer custom_values

1. **Select Use Case**: Choose "Generate deployer custom_values for an environment definition"
2. **Provide Deployer Inputs**: Specify `repoName`, `release`, `parameters`, and optional Ansible or `postDeployment` values
3. **Review Generated Structure**: The mode will generate:
   - A deployer-aligned `custom_values` JSON structure
   - Guidance for placing it under `infrastructure.custom_values`
   - Notes on Tekton mode, Ansible mode, or chained post-deployment flows

## Supported Platforms

### IBM Cloud Services
- **watsonx SaaS Shared**: Shared watsonx.ai, watsonx.data, and watsonx.governance
- **Account Vending**: IBM Cloud account provisioning with services

**Post-Deploy Type**: Terraform GitOps Post-Deploy

### Base VMs
- **OCPV Base VM**: Single or Multi-VM on OpenShift Virtualization (Primary choice)
- **IBM Cloud VPC VM**: VPC-based virtual machines (Alternative)

**Post-Deploy Type**: Terraform OS Post-Deploy

### OpenShift Clusters
- **OpenShift with Post-Deployer**: GitOps-based application deployment

**Post-Deploy Type**: Terraform Post-Deployer

## Platform-Specific Features

### Variable Contexts

Each platform has specific variable contexts available in playbooks:

**IBM Cloud Services**:
- `account_variables`: IBM Cloud account information
- `environment_variables`: Environment-specific settings
- `service_instance_variables`: Provisioned service details
- `group_variables`: Access group information

**Base VMs**:
- `infrastructure_variables`: VM IP, hostname, resource group
- `request_variables`: Requester ID, reservation ID
- `authentication_variables`: API keys, SSH keys

**OpenShift Clusters**:
- `cluster_variables`: Cluster name, ID, API URL
- `authentication_variables`: Kubeconfig, admin token
- `gitops_variables`: Git repo URL, branch, ArgoCD namespace

### Service Name Resolution

The mode automatically resolves marketing names to programmatic names:

| Marketing Name | Programmatic Name | Plan |
|----------------|-------------------|------|
| Watson Machine Learning | `pm-20` | `v2-standard` |
| Watson Studio | `data-science-experience` | `professional-v1` |
| Cloud Object Storage | `cloud-object-storage` | `standard` |
| watsonx.data intelligence | `datacatalog` | `essentials` |
| watsonx.governance | `aiopenscale` | `essentials` |

## Best Practices

### For Ansible Playbooks

1. **Use Hard-Coded Defaults** (VM platforms)
   ```yaml
   # ✅ Correct
   vars:
     db2_version: "11.5.9.0"
   
   # ❌ Incorrect
   vars:
     db2_version: "{{ db2_version | default('11.5.9.0') }}"
   ```

2. **Include Retry Logic**
   ```yaml
   - name: Install package
     ansible.builtin.dnf:
       name: package-name
       state: present
     register: result
     retries: 3
     delay: 5
     until: result is succeeded
   ```

3. **Generate Post-Deploy Output**
   Always create `post_deploy_text_output.txt` with HTML-formatted results

4. **Use Secure Practices**
   ```yaml
   - name: Set API key
     set_fact:
       api_key: "{{ account_apikey }}"
     no_log: true
   ```

### For Manifests

1. **Use Programmatic Names**
   ```json
   {
     "service": "pm-20",
     "plan": "v2-standard"
   }
   ```

2. **Boolean as Strings**
   ```json
   {
     "lock": "true",
     "enable": "true"
   }
   ```

3. **Empty Values**
   ```json
   {
     "region": "",
     "parameters": {}
   }
   ```

4. **Include Default Policies**
   Always include default access and resource ownership policies

## File Structure

```
modes/itz-content-developer-mvp/
├── custom_modes.yaml               # Mode configuration
├── mcp.json                        # MCP server configuration (root)
├── README.md                       # This file
└── .bob/
    ├── mcp.json                    # MCP server configuration (mode-specific)
    └── rules-itz-content-engineer/
        ├── 1_workflow.xml          # Main workflow instructions
        ├── 2_platform_guidance.xml # Platform-specific guidance
        ├── 3_ansible_playbooks.xml # Ansible playbook generation
        ├── 4_manifest_generation.xml # Manifest generation
        ├── 5_how_to_questions.xml  # How-to question handling
        ├── 6_security_rules.xml    # Security and validation rules
        ├── 7_platform_mapping.xml  # Platform ID mappings
        ├── 8_testing_playbooks.xml # Testing procedures
        ├── 9_mcp_configuration.xml # MCP configuration rules
        ├── 10_openshift_debugging.xml # OpenShift debugging skill
        └── 11_deployer_custom_values.xml # Deployer custom_values skill
```

## Security & Validation

### Security Rules (CRITICAL)

1. **Never Display Sensitive Information**
   - API keys, deploy keys, authentication tokens
   - Account IDs, CRNs, user identifiers
   - Passwords, secrets, private keys

2. **No Malicious Code**
   - Only install software from official repositories
   - Follow principle of least privilege
   - No unauthorized access tools or backdoors

3. **Stay Within Scope**
   - Only IBM Technology Zone content development
   - No operations on production systems
   - No unauthorized service tier provisioning

### Validation Checks

All generated content is validated for:
- ✅ Platform-specific structure requirements
- ✅ Valid YAML/JSON syntax
- ✅ Programmatic service and plan names
- ✅ Proper naming conventions
- ✅ Security best practices
- ✅ Complete implementation (no placeholders)

## Troubleshooting

### Authentication Issues

If you encounter authentication errors or cannot access documentation:

1. **Verify Token Configuration**
   - Open `.bob/mcp.json` or `~/.bob/settings/mcp_settings.json`
   - Check that the `Authorization` header is configured correctly
   - Ensure the token uses the `Bearer ` prefix
   - Confirm both `techzone-documentation-mcp` and `techzone-request-mcp` are configured

2. **Regenerate Token if Needed**
   - Go to https://techzone.ibm.com/my/profile
   - Generate or reveal a new token
   - Update both TechZone MCP server entries
   - Restart VS Code

3. **Check Network Connectivity**
   - Ensure you can access https://techzone.ibm.com
   - Verify no firewall or proxy issues

### OpenShift MCP Issues
+
+If OpenShift debugging is not working:
+
+1. **Verify OpenShift MCP Configuration**
+   - Open `.bob/mcp.json`
+   - Confirm the `openshift-mcp` server is present
+   - Verify the `podman` command and mounted kubeconfig path are correct
+   - Ensure the image `ghcr.io/openshift/openshift-mcp-server:latest` is accessible
+
+2. **Verify Kubeconfig Availability**
+   - Confirm `/tmp/openshift-debug-kubeconfig` exists when debugging a cluster
+   - Ensure the mounted kubeconfig is valid and readable by the MCP container
+
+3. **Retry with TechZone Environment Lookup**
+   - Use a valid TechZone request ID or environment ID
+   - Confirm the reservation is still active and the cluster is in `Ready` status
+
+### Documentation Not Found

If specific documentation cannot be retrieved:
1. The mode automatically searches documentation - no permission needed
2. Try alternative search terms or rephrase your question
3. Contact IBM Technology Zone support if issue persists

### Platform Unclear

If the mode asks for platform clarification:
- Provide specific platform name (e.g., "OCPV Single VM")
- Mention your use case to help identify the right platform
- Refer to the Supported Platforms section above

### Generated Content Issues

If generated content doesn't work:
1. Verify you're using the correct platform
2. Check that all required variables are defined
3. Validate JSON/YAML syntax
4. Review error messages for specific issues
5. Ask the mode for help with the specific error

## Examples

### Example 1: VM Playbook for DB2 Installation

**Request**: "Create a playbook to install DB2 on an OCPV VM"

**Generated Output**:
- Complete Ansible playbook with DB2 installation tasks
- Proper variable handling for OCPV platform
- Post-deploy output showing installation status
- Environment definition variables for integration

### Example 2: watsonx SaaS Shared Manifest

**Request**: "Create a manifest for watsonx.ai Studio and Cloud Object Storage"

**Generated Output**:
- JSON manifest with services section
- Programmatic service names (`pm-20`, `cloud-object-storage`)
- Access policies with appropriate roles
- Default policies included
- Integration instructions

### Example 3: VPC Multi-VM Manifest

**Request**: "Create a manifest for VPC Multi-VM with RHEL web server and Windows app server"

**Generated Output**:
- Complete YAML manifest with infrastructure and VM definitions
- Proper image names for RHEL 9.6 and Windows Server 2022
- Compute profiles (bx2-4x16) and storage specifications
- Security group configuration with required ports
- Post-deploy automation (patching, hardening, DNS)
- Complete environment definition example
- Integration guide with access information

### Example 4: Multi-VM Configuration Question

**Request**: "How do I configure two RHEL VMs with different roles?"

**Generated Answer**:
- Explanation of Multi-VM manifest structure
- Example showing two VM definitions
- How to assign different specifications
- Reference to official Multi-VM documentation

## Additional Resources

- **Setup Guide**: [00-setup-guide.md](modes/itz-content-developer/.bob/ibm-technology-zone/00-setup-guide.md)
- **IBM Technology Zone**: https://techzone.ibm.com
- **IBM Cloud Catalog**: https://cloud.ibm.com/catalog
- **IBM Cloud Global Catalog API**: https://globalcatalog.cloud.ibm.com/api/v1

## Support

For issues or questions:
1. Use the mode's how-to question feature
2. Refer to official IBM Technology Zone documentation
3. Contact IBM Technology Zone support team
4. Submit issues to the mode repository

## Version Information

- **Mode Version**: 1.1.0
- **Last Updated**: 2026-04-27
- **Compatibility**: IBM Technology Zone current standards with OpenShift MCP debugging and deployer custom_values workflows

## License

This mode is provided for use with IBM Technology Zone content development.

---

**Made with Bob** 🤖