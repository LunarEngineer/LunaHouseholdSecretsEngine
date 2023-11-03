# LunaHouseholdSecretsEngine

This sets up connectivity with the secrets engine.

This exposes a data structure with temporary credentials stored in the LunaHousehold Bitwarden account.

This uses the environment variables `BW_EMAIL`, `BW_PASSWORD`, `BW_CLIENTID`, `BW_CLIENTSECRET` (or other appropriate credentials) to define connectivity for the provider.

This identifies a set of secrets (vars.tf) to pull into data structures (main.tf) in order to expose outputs (output.tf).

To get a secret id:

`bw list items --search "MyHappySecret" | jq  '.[] .id'`

When accessing a secret you may use the patterns in the examples here which demonstrate how to extract both sensitive (`hidden`), and non-sensitive (`text`), values into output.