QT += \
    gui \
    qml \
    quick \
    quickcontrols2 \
    svg \
    xml

CONFIG += \
    c++14 \
    qtquickcompiler

INCLUDEPATH += src

HEADERS += \
    src/contact.h \
    src/models/contact_model.h

SOURCES += \
    src/main.cpp \
    src/contact.cpp \
    src/models/contact_model.cpp

RESOURCES += qml.qrc
