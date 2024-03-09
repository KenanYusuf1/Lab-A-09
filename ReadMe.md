# Terraform GitHub Actions Example

## Overview

This project demonstrates the use of GitHub Actions to automate the verification of Terraform scripts for creating and managing infrastructure. It specifically showcases a workflow that checks Terraform file formatting (`terraform fmt`) and validates Terraform configurations (`terraform validate`) upon pull requests targeting the main or master branches.

## GitHub Actions Workflow

The GitHub Actions workflow defined in `.github/workflows/action-terraform-verify.yml` performs the following checks:

1. **Terraform Format Check**: Ensures all Terraform files (*.tf) adhere to the standard formatting conventions.
2. **Terraform Validation**: Validates the syntax and configuration of Terraform files to ensure they are correctly structured.

## Issues Encountered and Resolutions

### Issue 1: Line Endings Conflict

- **Problem**: Encountered warnings about LF will be replaced by CRLF in `.husky/pre-commit` and other files, which could potentially cause issues in script execution across different operating systems.
- **Resolution**: Configured a `.gitattributes` file with specific rules (`* text=auto eol=lf`) to enforce consistent line endings for shell scripts and Terraform files.

### Issue 2: Large File Block

- **Problem**: Received an error regarding a large file (`terraform-provider-azurerm_v3.95.0_x5.exe`) exceeding GitHub's file size limit when attempting to push changes.
- **Resolution**: Removed the `.terraform` directory from version control and updated `.gitignore` to exclude it and other unnecessary files, such as `*.tfstate`, `*.tfvars`, and `terraform.tfstate.backup`.

### Issue 3: GitHub Actions Workflow Failures

- **Problem**: Initially, the GitHub Actions workflow failed to correctly execute Terraform commands due to misconfiguration and path issues.
- **Resolution**: Adjusted the GitHub Actions workflow file to correctly setup Terraform and specify the working directory. Ensured that Terraform and `tflint` were correctly installed and accessible in the GitHub Actions runner environment.

## Conclusion

This project serves as a practical example of integrating Terraform with GitHub Actions to automate infrastructure code verification. It highlights the importance of CI/CD practices in infrastructure as code (IaC) management and the effectiveness of using GitHub Actions for such purposes.

