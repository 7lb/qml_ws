#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include <QQuickStyle>

#include "models/contact_model.h"

void registerQmlTypes()
{
    qmlRegisterUncreatableType<ContactModel>(
        "models",
        1,
        0,
        "ContactModel",
        "ContactModels cannot be created from QML");

    qmlRegisterType<Contact>("appTypes", 1, 0, "Contact");
}

int main(int argc, char* argv[])
{
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
    QQuickStyle::setStyle("Material");

    QGuiApplication app{argc, argv};
    QQmlApplicationEngine engine;

    registerQmlTypes();

    // in a real app this would not scale
    ContactModel contact_model{};
    engine.rootContext()->setContextProperty("appContactModel", &contact_model);

    engine.load("qrc:/main.qml");

    // could not load root qml item
    if (engine.rootObjects().isEmpty()) return -1;
    return app.exec();
}
