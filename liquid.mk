# name
PRODUCT_RELEASE_NAME := GN-CDMA

# phone
$(call inherit-product, vendor/liquid/config/common_phone.mk)

# device
$(call inherit-product-if-exists, device/samsung/toro/full_toro.mk)

# products
PRODUCT_DEVICE := toro
PRODUCT_BRAND := Google
PRODUCT_NAME := liquid_toro
PRODUCT_MODEL := Galaxy Nexus
PRODUCT_MANUFACTURER := Samsung
PRODUCT_PROPERTY_OVERRIDES += ro.modversion=liquid.toro.$(shell date +%m%d%y).$(shell date +%H%M%S)

# overrides
PRODUCT_BUILD_PROP_OVERRIDES += \
    USER=liquid \
    BUILD_ID=IMM30B \
    BUILD_NUMBER=257829 \
    PRODUCT_NAME=mysid \
    TARGET_BUILD_TYPE=user \
    BUILD_VERSION_TAGS=release-keys \
    BUILD_DISPLAY_ID="Liquid ICS Beta 4" \
    PRIVATE_BUILD_DESC="mysid-user 4.0.4 IMM30B 257829 release-keys" \
    BUILD_FINGERPRINT=google/mysid/toro:4.0.4/IMM30B/257829:user/release-keys

# media
PRODUCT_COPY_FILES += \
    vendor/liquid/prebuilt/common/media/xdpi/bootanimation.zip:system/media/bootanimation.zip

