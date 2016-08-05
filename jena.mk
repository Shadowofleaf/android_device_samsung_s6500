# Copyright (C) 2013 The CyanogenMod Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

DEVICE_PACKAGE_OVERLAYS += device/samsung/jena/overlay

include device/samsung/msm7x27a-common/msm7x27a.mk

## NFC
PRODUCT_PACKAGES += \
    libnfc \
    libnfc_jni \
    Nfc \
    nfc.default \
    Tag 

# NFCEE access control

ifeq ($(TARGET_BUILD_VARIANT),user)
NFCEE_ACCESS_PATH := device/samsung/jena/nfc/nfcee_access.xml
else
NFCEE_ACCESS_PATH := device/samsung/jena/nfc/nfcee_access_debug.xml
endif
 
PRODUCT_COPY_FILES += \
    	$(NFCEE_ACCESS_PATH):system/etc/nfcee_access.xml
 
## NFC permissions
PRODUCT_COPY_FILES += \
     frameworks/base/nfc-extras/com.android.nfc_extras.xml:system/etc/permissions/com.android.nfc_extras.xml \
    frameworks/native/data/etc/com.nxp.mifare.xml:system/etc/permissions/com.nxp.mifare.xml \
    frameworks/native/data/etc/android.hardware.nfc.xml:system/etc/permissions/android.hardware.nfc.xml \

ifndef BUILD_RECOVERY
## Splash screen
PRODUCT_COPY_FILES += \
    device/samsung/jena/ramdisk/init.rle:root/GT-S6500.rle
else
## Recovery splash screen
PRODUCT_COPY_FILES += \
    device/samsung/jena/ramdisk/init-cwm.rle:root/GT-S6500.rle
endif

$(call inherit-product, vendor/samsung/jena/blobs.mk)
$(call inherit-product, vendor/samsung/jena/blobs-nfc.mk)
