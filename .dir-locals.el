((c-mode
  (flycheck-gcc-args . ("-mmcu=atmega32m1" "-Os" "-Wall"))
  (flycheck-c/c++-gcc-executable . "/usr/bin/avr-gcc")
  (flycheck-disabled-checkers . (c/c++-clang irony))))
