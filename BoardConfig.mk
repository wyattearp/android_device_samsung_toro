# Use the non-open-source part, if present
-include vendor/samsung/toro/BoardConfigVendor.mk

# Use the part that is common between all tunas
include device/samsung/tuna/BoardConfig.mk

BOARD_USERDATAIMAGE_PARTITION_SIZE := 30691799040
BOARD_INVENSENSE_APPLY_COMPASS_NOISE_FILTER := true
