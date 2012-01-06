TEMPLATE = app

QT += declarative dbus core
CONFIG += meegotouch link_pkgconfig

PKGCONFIG += qdeclarative-boostable \
             accounts-qt \
             AccountSetup
INCLUDEPATH += d:/QtSDK/Madde/sysroots/harmattan_sysroot_10.2011.34-1_slim/usr/include/telepathy-1.0
LIBS += -ltelepathy-qt4

target.path = /opt/extraplugins/bin
INSTALLS += target

CONFIG += qdeclarative-boostable
SOURCES += main.cpp qmlapplicationviewer.cpp
HEADERS += qmlapplicationviewer.h

invoker.files = invoker/*
invoker.path = /opt/extraplugins/bin
INSTALLS += invoker

# Register to accounts
accountsprovider.files = *.provider
accountsprovider.path = /usr/share/accounts/providers
accountsservice.files = *.service
accountsservice.path = /usr/share/accounts/services
INSTALLS += accountsprovider accountsservice

png.files = *.png
png.path = /usr/share/themes/blanco/meegotouch/icons
INSTALLS += png

OTHER_FILES += \
    invoker/* \
    *.provider \
    *.service




