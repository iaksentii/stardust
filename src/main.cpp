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

int main(int argc, char *argv[])
{
    QApplication app(argc, argv);

    QQmlApplicationEngine engine;
    GraphicManager p(".");

    ScreenManager manager;

    ProfileManager profileManager;

    engine.rootContext()->setContextProperty("ScreenManager", &manager);
    engine.rootContext()->setContextProperty("graphicEngine", &p);
    engine.rootContext()->setContextProperty("profileManager", &profileManager);
    engine.load(QUrl::fromLocalFile ("../data/main.qml"));
    qmlRegisterType<SolarSystem>("galaxy.engine", 1, 0,"GalaxyEngine");

    return app.exec();
}
