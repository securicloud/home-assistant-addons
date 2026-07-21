# Securicloud Agent for Home Assistant

**Remote access to Home Assistant without port forwarding, a public IP, domain setup, firewall changes, or VPN switching.**

Securicloud Agent is a Home Assistant app (formerly called an add-on) that creates an encrypted, outbound connection from your Home Assistant installation to the Securicloud service.

No Securicloud access is enabled until you explicitly register the installation. Securicloud Basic is currently free to use and does not require payment details.

[![Add the Securicloud repository to Home Assistant](https://my.home-assistant.io/badges/supervisor_add_addon_repository.svg)](https://my.home-assistant.io/redirect/supervisor_add_addon_repository/?repository_url=https%3A%2F%2Fgithub.com%2Fsecuricloud%2Fhome-assistant-addons)

## Why use it?

- No router port forwarding
- No public IP address or dynamic DNS
- No domain or TLS certificate setup
- No VPN client to enable before opening Home Assistant
- No Securicloud credentials entered into the app
- Remote access can be enabled, disabled, and revoked from the Securicloud Control Panel

The app does not expose a new inbound Internet port. Its management page is available inside Home Assistant through Ingress.

## Requirements

- Home Assistant OS with support for Apps
- Working outbound Internet access
- A free Securicloud account created during registration, or an existing account

Supported architectures:

- `aarch64`
- `amd64`
- `armv7`
- `i386`

## Installation

### One-click repository setup

Use the button above to add this repository to Home Assistant.

Then:

1. Open **Settings → Apps → App store**.
2. Select **Securicloud Agent**.
3. Install and start the app.
4. Open **Web UI**.
5. Select **Register Installation**.

### Manual repository setup

1. Open Home Assistant.
2. Go to **Settings → Apps → App store**.
3. Open the menu in the upper-right corner and select **Repositories**.
4. Add this repository URL:

   ```text
   https://github.com/securicloud/home-assistant-addons
   ```

5. Find and install **Securicloud Agent**.
6. Start the app and open **Web UI**.
7. Select **Register Installation**.

No app configuration is required.

## What registration creates

Registering the Home Assistant installation creates:

- a Securicloud **Instance** representing this Home Assistant installation;
- a default **Access Token** for remote access.

After registration, open the **Securicloud Control Panel** from the app Web UI to manage the Instance and its Access Tokens.

## How it works

```text
Remote browser or Home Assistant Companion App
                      │
                      ▼
              Securicloud service
                      ▲
                      │ encrypted outbound connection
                      │
            Securicloud Agent app
                      │
                      ▼
                Home Assistant
```

1. The app generates an installation-specific **Instance ID**.
2. It establishes an encrypted outbound connection to Securicloud.
3. No remote access is granted by default.
4. You explicitly register the installation with your Securicloud account.
5. An enabled Access Token provides remote access through Securicloud.

Your Home Assistant installation is not made directly reachable through a public inbound port.

## Access and identity

The app stores only its installation-specific Instance ID in:

```text
/share/ha_instance_id.json
```

It does not store your Securicloud email address, password, or Access Tokens.

Access Tokens are managed in the Securicloud Control Panel. Disable or delete an Access Token when ordinary remote access should be revoked.

## Resetting the Instance ID

**Reset Instance ID is not a general troubleshooting action.**

It is intended for cases where the Home Assistant system must be detached completely from the Securicloud account that previously registered it—for example, before transferring the Home Assistant box to a new owner.

Resetting the Instance ID:

- terminates remote connections associated with the previous identity;
- invalidates Access Tokens associated with that installation identity;
- generates a new Instance ID after the app restarts;
- requires the installation to be registered again before remote access can be restored.

For normal access management, use Access Tokens in the Securicloud Control Panel instead.

## Service dependency

Remote access requires both Internet connectivity and availability of the Securicloud service. Local access to Home Assistant does not depend on Securicloud and remains available on the local network.

## Documentation and support

- [Securicloud Home Assistant documentation](https://securicloud.me/docs/home-assistant)
- [App documentation](./securicloud-agent/DOCS.md)
- Support: [support@securicloud.me](mailto:support@securicloud.me)

## Project status

Securicloud Agent is the initial MVP release. The current implementation is intentionally small and has been tested as the active Home Assistant connection method used during development of Securicloud.

Securicloud is not affiliated with or endorsed by Home Assistant.
