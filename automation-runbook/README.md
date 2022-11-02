# Automation RunBook

*"Process automation in Azure Automation allows you to create and manage 
PowerShell, PowerShell Workflow, and graphical runbooks."*

You can define a runbook in your automation account using this module. If you 
don't have an automation account yet, you can create one using the 
`automation-account` module.

This module uses a custom file for defining the desired content of the runbook 
(Textual runbooks could be based on PowerShell or Python scripting). You can 
create such a file in the envioronment directory that uses this module. 

As an example, you can look at the custom file that is used by Mordor for 
deleting File shares that are older than X days: `envs/mordor/prod/backups/
automation-runbook-prod/fileshare-rotation-prod.ps1`

You can also define a `job schedule` for your automation runbook, if you set 
the related `count` value for it as `True`.
