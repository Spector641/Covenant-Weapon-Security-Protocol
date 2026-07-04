# Changelog

All notable changes to Covenant Weapon Security Protocol (CWSP) will be documented in this file.

The format is based on Keep a Changelog and the project follows Semantic Versioning.

---

## [0.4.0] - Audio Integration

### Added
- Modular audio system (`fn_playAudio`).
- Audio cues for each stage of the failsafe sequence:
  - Warning
  - Biometric scan
  - Countdown
  - Activation

### Changed
- Integrated audio playback into the failsafe workflow while keeping the gameplay logic independent from the sound system.

---

## [0.3.0] - System Refactor

### Added
- Modular warning display system (`fn_showWarning`).
- Dedicated effects handler (`fn_playEffects`).

### Changed
- Refactored the failsafe sequence into reusable functions.
- Improved code readability and maintainability.

### Fixed
- Preserved final biometric verification logic during the refactor.

---

## [0.2.1] - Hotfix: Final Verification

### Fixed
- Added a final biometric verification before activation.
- Fixed an issue where the failsafe could still activate after the weapon was dropped during the final activation stage.
- Improved the cancellation flow to ensure players can safely abort the failsafe before final activation.

---

## [0.2.0] - Biometric Scan

### Added
- Multi-stage biometric authentication sequence.
- Biometric scan countdown.
- Covenant weapon whitelist system.
- BLUFOR authorization check.
- Multiplayer-compatible architecture.
- Failsafe cancellation by dropping the weapon.

### Changed
- Replaced weapon prefix detection with a configurable weapon list.
- Improved warning messages with a more immersive authentication flow.

---

## [0.1.0] - First Contact

### Added
- Initial Covenant weapon detection.
- Automatic failsafe activation for unauthorized users.
- Basic 3-second countdown.
- Initial explosion effect.
- First working prototype.
