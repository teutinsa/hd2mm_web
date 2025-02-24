@echo off

CALL flutter pub get
CALL flutter gen-l10n
CALL flutter run