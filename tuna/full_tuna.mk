# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base.mk)
# Inherit from tuna device
$(call inherit-product, device/samsung/toro/tuna/device.mk)

# Set those variables here to overwrite the inherited values.
PRODUCT_NAME := full_tuna
PRODUCT_DEVICE := tuna
PRODUCT_BRAND := Android
PRODUCT_MODEL := Full AOSP on Tuna
