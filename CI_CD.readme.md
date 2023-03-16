# CI/CD pipeline docs

## Codemagic

As of 20230313, we are using CodeMagic to control our CI/CD [pipeline](https://codemagic.io/apps).

The config yaml can be found @ `./codemagic.yaml`, documentation for how to configure codemagic.yaml can be found at [CodeMagic Flutter Quick Start guide](https://docs.codemagic.io/yaml-quick-start/building-a-flutter-app/).

### Accounts

#### Google

<!-- TODO: fill out steps to enable Google Play publishing -->
[Google Play Console](https://play.google.com/console/u/0/developers/6443463758289469480/app/4976145265421419016/app-dashboard?timespan=thirtyDays)

#### iOS
<!-- TODO: fill out steps to enable iOS publishing -->
- [App Store Connect](https://appstoreconnect.apple.com/apps/1579608365/appstore/ios/version/inflight)
- Add App Store provisioning profile using these instructions: [Create an App Store provisioning profile](https://developer.apple.com/help/account/manage-profiles/create-an-app-store-provisioning-profile)
- Added iOS distribution cert
