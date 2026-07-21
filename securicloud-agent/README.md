# Securicloud Agent

**Remote access to Home Assistant without port forwarding, a public IP, domain setup, or VPN switching.**

Securicloud Agent is a Home Assistant app (formerly called an add-on) that creates an encrypted outbound connection to the Securicloud service. It does not open a new inbound Internet port or require router and firewall changes.

## Highlights

- No app configuration
- No port forwarding
- No public IP or dynamic DNS requirement
- No VPN switching before opening Home Assistant
- Explicit installation registration
- Instance-bound Access Tokens managed in the Securicloud Control Panel
- Integrated Home Assistant Ingress Web UI

Securicloud Basic is currently free to use and does not require payment details.

## Getting started

1. Install and start **Securicloud Agent**.
2. Open **Web UI**.
3. Select **Register Installation**.
4. Complete registration with a new or existing Securicloud account.
5. Open the **Securicloud Control Panel** to use and manage the automatically created Access Token.

No remote access is enabled until registration is completed.

## Important

**Reset Instance ID is not a troubleshooting action.** Use it only when this Home Assistant installation must be detached completely from the Securicloud account that registered it, such as before transferring the Home Assistant box to another owner.

For setup, usage, access management, removal, and troubleshooting, see the [full app documentation](DOCS.md).

Securicloud is not affiliated with or endorsed by Home Assistant.
