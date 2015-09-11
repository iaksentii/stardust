#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>

#include "screenmanager.h"

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;

    ScreenManager manager;

    engine.rootContext()->setContextProperty("ScreenManager", &manager);
    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));

    return app.exec();
}
