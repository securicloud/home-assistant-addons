# Securicloud Agent documentation

Securicloud Agent provides remote access to Home Assistant through an encrypted outbound connection to Securicloud. It avoids the need for port forwarding, a public IP address, dynamic DNS, domain and certificate setup, or VPN switching.

## Requirements

- Home Assistant OS with support for Apps
- Working outbound Internet access
- A Securicloud account created during registration, or an existing account

No app options or network parameters need to be configured.

## Install the app

If the Securicloud repository is not already installed, add:

```text
https://github.com/securicloud/home-assistant-addons
```

In current Home Assistant versions:

1. Open **Settings → Apps → App store**.
2. Open the menu in the upper-right corner.
3. Select **Repositories**.
4. Add the repository URL.
5. Select **Securicloud Agent** from the App store.
6. Install and start the app.

## Register the Home Assistant installation

Starting the app creates an installation-specific **Instance ID** and establishes the outbound connection to Securicloud. This does not enable remote access by itself.

To enable remote access:

1. Open the app's **Web UI**.
2. Select **Register Installation**.
3. A Securicloud page opens in a new browser tab.
4. Sign in to an existing Securicloud account or create a new one.
5. Complete the registration.

Registration automatically creates:

- an **Instance** representing this Home Assistant installation;
- a default **Access Token** bound to that Instance.

You can also use the installation registration URL shown in the app logs if the Web UI cannot open the registration page.

## Connect remotely

1. Open the app's **Web UI**.
2. Select **Securicloud Control Panel**.
3. Open the Access Token created during registration.
4. Use its access link as the external Home Assistant address.

Test the connection from outside the home network, for example by disabling Wi-Fi on a phone and connecting through mobile data.

The same remote address can be used as the external URL in the Home Assistant Companion App.

## Manage access

Securicloud separates the Home Assistant installation from the credentials used to reach it:

- **Instance ID** identifies this app installation.
- **Instance** represents the exposed Home Assistant service in Securicloud.
- **Access Token** grants remote access to that Instance.

Access Tokens are instance-bound. They can be enabled, disabled, or deleted from the Securicloud Control Panel without changing the app's Instance ID.

Use Access Token management for ordinary access revocation.

## Reset the Instance ID

**Do not reset the Instance ID as routine troubleshooting.**

Reset is intended when the installation must be detached completely from the Securicloud account that registered it. The main example is transferring or selling a Home Assistant box on which Securicloud Agent was previously installed.

Before transferring the box:

1. Open the Securicloud Agent **Web UI**.
2. Select **Reset Instance ID**.
3. Confirm the reset.
4. Wait for the app to restart and display a new Instance ID.
5. Uninstall the app if the new owner will not use Securicloud.

Resetting:

- terminates remote connections associated with the previous identity;
- invalidates Access Tokens associated with the previous installation identity;
- removes the previous local Instance ID;
- generates a new Instance ID after restart;
- requires registration again before remote access can be restored.

## What the app stores

The app stores the Instance ID in:

```text
/share/ha_instance_id.json
```

It does not store your Securicloud email address, password, or Access Tokens.

## Network and security model

- The app initiates the connection from the Home Assistant system to Securicloud.
- The tunnel connection uses TLS.
- No new inbound Internet port is opened by the app.
- The management Web UI is provided through Home Assistant Ingress.
- Remote access is not enabled until explicit registration.
- Access is controlled using Instance-bound Access Tokens.

Remote Home Assistant traffic passes through the Securicloud service. Remote access therefore depends on Internet connectivity and availability of Securicloud.

Local Home Assistant access remains independent of Securicloud.

## Logs

A healthy connection includes this message:

```text
[IDLE] Connected. The service is running…
```

The app also prints the installation registration URL during startup.

Enable the `debug` option only when additional diagnostic output is needed.

## Troubleshooting

### The app does not connect

1. Confirm that the Home Assistant host has working Internet and DNS access.
2. Restart Securicloud Agent.
3. Check the app logs for connection errors.
4. Confirm that the healthy connection message appears.

The app automatically retries the primary and backup Securicloud tunnel endpoints.

### The installation is connected but remote access does not work

1. Confirm that registration was completed.
2. Open the Securicloud Control Panel.
3. Confirm that the Home Assistant Instance is enabled.
4. Confirm that the Access Token is enabled.
5. Test the access link from a browser outside the local network.

### Registration did not open

Use the installation registration URL printed in the app logs.

### The Companion App does not connect remotely

1. Confirm that the same access link works in a normal browser over mobile data.
2. Enter that address as the external URL in the Home Assistant Companion App.
3. Keep the normal local Home Assistant URL as the internal URL.

### Do not reset for ordinary failures

Resetting the Instance ID destroys the existing installation identity and requires registration again. It is not expected to fix ordinary connectivity, browser, token, or Companion App configuration problems.

## Stop or remove Securicloud access

To stop ordinary remote access while keeping the installation registered:

1. Disable or delete its Access Tokens in the Securicloud Control Panel.
2. Optionally stop the app.

To remove the app:

1. Revoke the Access Tokens that should no longer work.
2. Stop and uninstall Securicloud Agent.
3. Remove the custom repository from Home Assistant if it is no longer needed.

When ownership of the Home Assistant box changes, reset the Instance ID before uninstalling the app.

## Support

- Documentation: <https://securicloud.me/docs/home-assistant>
- Email: <support@securicloud.me>

When requesting support, include the relevant app log messages but do not send passwords or Access Tokens.

Securicloud is not affiliated with or endorsed by Home Assistant.
