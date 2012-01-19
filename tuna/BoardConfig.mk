
USE_CAMERA_STUB := true

-include vendor/samsung/tuna/BoardConfigVendor.mk

TARGET_CPU_ABI := armeabi-v7a
TARGET_CPU_ABI2 := armeabi
TARGET_CPU_SMP := true
TARGET_ARCH_VARIANT := armv7-a-neon
ARCH_ARM_HAVE_TLS_REGISTER := true
TARGET_NO_BOOTLOADER := true
BOARD_KERNEL_BASE := 0x80000000

TARGET_NO_RADIOIMAGE := true
TARGET_BOARD_PLATFORM := omap4
TARGET_BOOTLOADER_BOARD_NAME := tuna
TARGET_BOARD_INFO_FILE := device/samsung/toro/tuna/board-info.txt

USE_OPENGL_RENDERER := true
TARGET_RECOVERY_PIXEL_FORMAT := "BGRA_8888"
TARGET_RECOVERY_UI_LIB := librecovery_ui_tuna
BOARD_EGL_CFG := device/samsung/toro/tuna/egl.cfg

TARGET_USERIMAGES_USE_EXT4 := true
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 685768704
BOARD_USERDATAIMAGE_PARTITION_SIZE := 14539537408
BOARD_FLASH_BLOCK_SIZE := 4096

# wifi
BOARD_WPA_SUPPLICANT_DRIVER := NL80211
WPA_SUPPLICANT_VERSION      := VER_0_8_X
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_bcmdhd
BOARD_HOSTAPD_DRIVER        := NL80211
BOARD_HOSTAPD_PRIVATE_LIB   := lib_driver_cmd_bcmdhd
BOARD_WLAN_DEVICE           := bcmdhd
WIFI_DRIVER_FW_PATH_PARAM   := "/sys/module/bcmdhd/parameters/firmware_path"
WIFI_DRIVER_FW_PATH_STA     := "/vendor/firmware/fw_bcmdhd.bin"
WIFI_DRIVER_FW_PATH_P2P     := "/vendor/firmware/fw_bcmdhd_p2p.bin"
WIFI_DRIVER_FW_PATH_AP      := "/vendor/firmware/fw_bcmdhd_apsta.bin"

BOARD_HAVE_BLUETOOTH := true
BOARD_HAVE_BLUETOOTH_BCM := true

BOARD_LIB_DUMPSTATE := libdumpstate.tuna
BOARD_USES_SECURE_SERVICES := true

BOARD_WLAN_DEVICE_REV := bcm4330_b2
WIFI_BAND             := 802_11_ABG
