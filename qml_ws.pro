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

DISTFILES += \
    android/AndroidManifest.xml \
    android/gradle/wrapper/gradle-wrapper.jar \
    android/gradlew \
    android/res/values/libs.xml \
    android/build.gradle \
    android/gradle/wrapper/gradle-wrapper.properties \
    android/gradlew.bat

contains(ANDROID_TARGET_ARCH,armeabi-v7a) {
    ANDROID_PACKAGE_SOURCE_DIR = \
        $$PWD/android
}
