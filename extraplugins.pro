TEMPLATE = subdirs
SUBDIRS =   icqplugin \
            vkplugin \
            msnplugin \
            aolplugin \
            yahooplugin \
            qipplugin \
            odnkplugin \
            jabberplugin \
            libpurple \
            haze \
            translations

qml.files = qml/*.qml
qml.path = /usr/share/extraplugins/qml
INSTALLS += qml

OTHER_FILES += \
    qml/testplugin/*.qml \
    qtc_packaging/debian_harmattan/postinst \
    qtc_packaging/debian_harmattan/links \
    qtc_packaging/debian_harmattan/prerm \
    qtc_packaging/debian_harmattan/rules \
    qtc_packaging/debian_harmattan/README \
    qtc_packaging/debian_harmattan/manifest.aegis \
    qtc_packaging/debian_harmattan/copyright \
    qtc_packaging/debian_harmattan/control \
    qtc_packaging/debian_harmattan/compat \
    qtc_packaging/debian_harmattan/changelog
