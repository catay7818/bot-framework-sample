# Bot Types

<https://learn.microsoft.com/en-us/azure/bot-service/bot-builder-authentication?view=azure-bot-service-4.0&tabs=userassigned%2Caadv2%2Ccsharp#bot-identity-information>

## User Assigned MSI (`UserAssignedMSI`)

The bot identity is an MSI resource. This does not work in local development since there is no connectivity to the managed identity backend.

## Single-Tenant (`SingleTenant`)

Identity is an app registration in your tenant configured as the Single tenant account type.

## Multi-Tenant (`MultiTenant`)

Identity is an app registration in your tenant configured as the Multitenant account type.

<details>
<summary><h2>Copilot Summary of Comparison</h2></summary>

> "compare single tenant and multi tenant identities for the microsoft bot framework"

Sure! Here's a comparison between single-tenant and multi-tenant identities for the Microsoft Bot Framework:

### Single-Tenant Identity
- **Scope**: Restricted to a single organization.
- **Use Case**: Ideal for bots that will only be used within one organization.
- **Authentication**: The bot is registered in the organization's Azure Active Directory (AAD) tenant. Users must belong to this tenant to authenticate.
- **Security**: Higher control over access and security since it's limited to one tenant.
- **Configuration**: Requires explicit configuration to authenticate against the specific tenant¹(https://learn.microsoft.com/en-us/answers/questions/308518/bot-framework-app-registration-single-tenant-vs-mu)²(https://learn.microsoft.com/en-us/azure/bot-service/bot-service-quickstart-registration?view=azure-bot-service-4.0).

### Multi-Tenant Identity
- **Scope**: Accessible by multiple organizations.
- **Use Case**: Suitable for bots intended for use by users from different organizations.
- **Authentication**: The bot is registered in the Bot Framework tenant, allowing users from any AAD tenant to authenticate.
- **Flexibility**: More flexible as it supports a broader user base.
- **Configuration**: Simplifies the process of making the bot available to a wider audience without needing to configure each tenant separately¹(https://learn.microsoft.com/en-us/answers/questions/308518/bot-framework-app-registration-single-tenant-vs-mu)²(https://learn.microsoft.com/en-us/azure/bot-service/bot-service-quickstart-registration?view=azure-bot-service-4.0).

Would you like more details on how to set up either type of identity?

Source: Conversation with Copilot, 2/11/2025
(1) Bot Framework - App registration - Single tenant vs Multi tenant. https://learn.microsoft.com/en-us/answers/questions/308518/bot-framework-app-registration-single-tenant-vs-mu.
(2) Register a Bot Framework bot with Azure - Bot Service | Microsoft Learn. https://learn.microsoft.com/en-us/azure/bot-service/bot-service-quickstart-registration?view=azure-bot-service-4.0.

</details>
