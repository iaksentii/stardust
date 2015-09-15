#include <QApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include <QDir>
#include <QtQml>
#include <QDebug>

#include "screenmanager.h"
#include "graphicmanager.h"
#include "solarsystem.h"

int main(int argc, char *argv[])
{
    QApplication app(argc, argv);

    QQmlApplicationEngine engine;
    GraphicManager p("../stardust");

    ScreenManager manager;

    engine.rootContext()->setContextProperty("ScreenManager", &manager);
    engine.rootContext()->setContextProperty("graphicEngine", &p);
    engine.load(QUrl::fromLocalFile ("../stardust/main.qml"));
    qmlRegisterType<SolarSystem>("galaxy.engine", 1, 0,"GalaxyEngine");

    return app.exec();
}
