# Gemini CLI Profiles Directory

## Directory Overview
This directory (`~/.gemini/profiles/`) is responsible for managing user profiles and authentication states for the Gemini CLI and associated tools. It is a configuration and state directory, not a software code project. Each subdirectory represents a distinct user profile or environment configuration (e.g., `daripper891`, `theripper81791`), allowing the CLI to quickly switch contexts and maintain separate authentication credentials for different Google accounts.

## Key Files
Within each profile subdirectory, you will typically find the following files:

*   **`google_accounts.json`**:
    *   **Purpose:** Tracks the email addresses associated with the profile.
    *   **Content:** Contains an `active` key denoting the currently signed-in Google account (e.g., `daripper891@gmail.com`) and an `old` array tracking previously used accounts to streamline profile switching.
*   **`oauth_creds.json`**:
    *   **Purpose:** Stores the OAuth 2.0 credentials required to authenticate API requests to Google services (such as Google Cloud Platform and Gemini APIs).
    *   **Content:** Contains sensitive authentication data, including the `access_token` (Bearer token), `refresh_token`, `id_token`, granted `scope` URLs, and token `expiry_date`. 

## Usage
The contents of this directory are automatically generated and maintained by the Gemini CLI's authentication workflows (such as running `gemini auth login` or `gemini auth logout`). 

*   **Do not edit manually:** Users should generally avoid manually editing these JSON files. Corrupting the JSON structure or modifying the tokens will result in authentication failures.
*   **Profile Management:** Use the official CLI commands to manage these profiles and their associated authentication states.
*   **Troubleshooting:** If the CLI is experiencing persistent authentication errors, a common troubleshooting step is to safely delete or move the `oauth_creds.json` file for the active profile to force a fresh re-authentication prompt.

## ⚠️ Security Warning
**This directory contains highly sensitive, live authentication credentials.**
*   **Never** commit the contents of this directory to version control.
*   **Never** share or paste the contents of `oauth_creds.json` into chat interfaces, forums, or bug reports.
*   Protect this directory with strict file permissions to prevent unauthorized access by other users on the system.