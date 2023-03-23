git init 
$VERSION = "v1.77.0"
$REPO = "https://github.com/antonbabenko/pre-commit-terraform" 


$raw = @"
repos:
- repo: $REPO
  rev: $VERSION # Get the latest from: $REPO/releases
  hooks:
    - id: terraform_fmt
    # - id: terraform_validate not working in Windows
    - id: terraform_checkov
      args:
        - --args=--skip-check CKV_SECRET_13 # Secrets json under project dir - in gitignore.
        - --args=--skip-check CKV_AZURE_9 # RDP is used for study project to open Artifactory
        - --args=--skip-check CKV_AZURE_151 # Encryption Not used in studying project
        - --args=--skip-check CKV_AZURE_10  # Allow ssh for Ansible to linux host
    - id: terraform_tflint
      args:
        - --args=--enable-rule=terraform_deprecated_interpolation
        - --args=--enable-rule=terraform_deprecated_index
        - --args=--enable-rule=terraform_empty_list_equality
        - --args=--enable-rule=terraform_module_pinned_source
        - --args=--enable-rule=terraform_module_version
        - --args=--enable-rule=terraform_required_providers
        - --args=--enable-rule=terraform_required_version
        - --args=--enable-rule=terraform_typed_variables
        - --args=--enable-rule=terraform_unused_declarations
        - --args=--enable-rule=terraform_unused_required_providers
        - --args=--enable-rule=terraform_workspace_remote
    - id: terraform_docs
      args:
        - --hook-config=--path-to-file=README.md        # Valid UNIX path. I.e. ../TFDOC.md or docs/README.md etc.
        - --hook-config=--add-to-existing-file=true     # Boolean. true or false
        - --hook-config=--create-file-if-not-exist=true # Boolean. true or false
    - id: infracost_breakdown
      args:
        - --args=--path=.
        - --hook-config='.totalHourlyCost|tonumber > 0.1'
        - --hook-config='.projects[].diff.totalHourlyCost|tonumber <= 2'
        - --hook-config='.projects[].diff.totalMonthlyCost|tonumber <= 160'
        - --hook-config='.currency == "USD"'
"@ 

Write-Output  $raw | Set-Content -Encoding UTF8 .\.pre-commit-config.yaml -Force