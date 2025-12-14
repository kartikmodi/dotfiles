# AI Assistant Guide

This guide explains what the AI assistant can do for this dotfiles repository and how to provide effective context for tasks.

## What I Can Do

As an AI assistant for this repository, I can help you with:

### 1. **Code and Configuration Changes**
- Modify Ansible playbooks and roles
- Update Nix configurations (flake.nix, home.nix)
- Edit shell scripts in the `bin/` directory
- Update inventory files and configuration

### 2. **Documentation**
- Create and update documentation in the `docs/` folder
- Improve README files
- Write usage guides and tutorials
- Document setup procedures

### 3. **Automation and Scripts**
- Create new Ansible roles for system configuration
- Write shell scripts for automation tasks
- Set up new development tools and environments
- Configure software installations

### 4. **Repository Maintenance**
- Update dependencies in requirements.yml
- Organize and restructure files
- Add .gitignore rules
- Set up CI/CD workflows

### 5. **Troubleshooting**
- Debug Ansible playbook issues
- Fix Nix configuration problems
- Resolve script errors
- Investigate setup failures

## How to Provide Context

To get the best results, provide clear context in these ways:

### 1. **Be Specific About the Goal**
✅ Good: "Add a new Ansible role to install and configure Docker with docker-compose"
❌ Poor: "Fix Docker"

### 2. **Describe the Current Problem**
If something isn't working, explain:
- What you tried to do
- What you expected to happen
- What actually happened
- Any error messages you received

Example:
```
I ran `ansible-playbook main.yml` and got an error about missing package 'docker-ce'.
I expected Docker to be installed but the task failed at the installation step.
Error: "Package docker-ce is not available"
```

### 3. **Specify Your Environment**
When relevant, mention:
- Operating system (Ubuntu, Debian, Arch, macOS, etc.)
- Architecture (x86_64, ARM64/Asahi, etc.)
- Existing configuration state

### 4. **Include Relevant Files**
Point to specific files or sections:
- "Update the zsh configuration in roles/shell/tasks/main.yml"
- "Modify the neovim setup in home.nix"

### 5. **Share Constraints or Preferences**
Let me know if you have:
- Preferred tools or methods
- Compatibility requirements
- Performance considerations
- Style preferences

## Example Tasks

Here are examples of well-defined tasks:

### Example 1: New Software Installation
```
Add Terraform to the Nix configuration in home.nix with version 1.6.0+.
Also create an Ansible role to configure Terraform with AWS credentials
from environment variables.
```

### Example 2: Documentation Update
```
Create a guide in docs/usage-guide/ explaining how to set up PostgreSQL
using the existing Ansible roles. Include connection examples and common
troubleshooting steps.
```

### Example 3: Script Creation
```
Create a shell script in bin/ that backs up my dotfiles to a specified
directory. It should create timestamped backups and keep only the last
5 backups.
```

### Example 4: Configuration Fix
```
The bluetooth setup guide in docs/bluetooth.md references outdated commands.
Update it to work with PipeWire instead of PulseAudio on Ubuntu 22.04+.
```

### Example 5: Role Enhancement
```
Enhance the existing vim/neovim role to include LSP configuration for
Python, JavaScript, and Go. Use modern plugin managers like lazy.nvim.
```

## Working with This Repository

### Repository Structure
- `roles/` - Ansible roles for different tools and configurations
- `docs/` - Documentation and guides
- `bin/` - Utility scripts
- `home.nix` - Nix home-manager configuration
- `flake.nix` - Nix flake for reproducible environments
- `main.yml` - Main Ansible playbook
- `inventory.yml` - Ansible inventory

### Common Workflows

1. **Adding New Tool Configuration**
   - Create new role in `roles/`
   - Include role in `main.yml`
   - Test with specific tags
   - Document in `docs/`

2. **Updating Nix Packages**
   - Modify `home.nix`
   - Test with `nix build`
   - Update documentation if needed

3. **Creating New Scripts**
   - Add to `bin/` directory
   - Make executable
   - Document usage in comments or docs

## Tips for Best Results

1. **One task at a time**: Focus on a single clear objective
2. **Provide examples**: Show what success looks like
3. **Reference existing patterns**: Point to similar existing code/configs
4. **Test incrementally**: Ask for changes that can be tested in steps
5. **Review suggestions**: I can explain my changes if needed

## What I Cannot Do

- I cannot push directly to your repository (I work via Pull Requests)
- I cannot access external services or APIs during execution
- I cannot make changes to your live system (only to repository files)
- I cannot access private credentials or secrets

## Getting Started

To start working with me:

1. **Describe your goal**: Tell me what you want to achieve
2. **Provide context**: Share relevant details about your setup
3. **Review my plan**: I'll outline what I'll do before making changes
4. **Iterate**: We can refine the approach based on your feedback

## Questions?

If you're unsure how to phrase a request, you can:
- Start with a high-level goal and I'll ask clarifying questions
- Show me an example from another project
- Describe the manual steps you would take
- Ask me to explore the repository first to understand the context

Feel free to be conversational - I can help translate your ideas into specific, actionable tasks!
