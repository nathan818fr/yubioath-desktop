# Debian Buster Support

- Downgrade Qt (5.12 -> 5.11)
  - Don't set the `TextField.placeholderTextColor` property
  - Replace the `SystemTrayIcon.icon.source` property by `SystemTrayIcon.iconSource`
  - Don't set the `SystemTrayIcon.icon.mask` property
- Downgrade QtQml (2.12 -> 2.11)
  - Replace lambdas by functions :'(
  - Set default arguments values manually
  - Replace `Array.includes(valueToFind)` by `Arrays.indexOf(valueToFind) !== -1`
- Downgrade Qt.labs.platform (1.1 -> 1.0)
