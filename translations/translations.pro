TEMPLATE = subdirs

system ("rm *.qm")
system ("lrelease -markuntranslated '' -idbased *.ts")

qmfiles.files = *.qm
qmfiles.path = /usr/share/l10n/meegotouch
INSTALLS += qmfiles

OTHER_FILES += \
    *.ts

