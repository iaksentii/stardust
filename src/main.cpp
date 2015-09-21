#include <QApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include <QDir>
#include <QtQml>
#include <QDebug>

#include "screenmanager.h"
#include "graphicmanager.h"
#include "solarsystem.h"
#include "profilemanager.h"
#include "gameconsole.h"

int main(int argc, char *argv[])
{
    QApplication app(argc, argv);

    QQmlApplicationEngine engine;
    GraphicManager p(".");

    GameConsole console;

    engine.rootContext()->setContextProperty("ScreenManager", ScreenManager::Instance());
    engine.rootContext()->setContextProperty("graphicEngine", &p);
    engine.rootContext()->setContextProperty("profileManager", ProfileManager::Instance());
    engine.rootContext()->setContextProperty("gameConsolee", &console);

    engine.load(QUrl::fromLocalFile ("../data/main.qml"));
    qmlRegisterType<SolarSystem>("galaxy.engine", 1, 0,"GalaxyEngine");

    return app.exec();
}
