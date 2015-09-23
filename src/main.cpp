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
#include "translator.h"
#include "match3/modellist.h"
#include "match3/gameconfig.h"


int main(int argc, char *argv[])
{
    QApplication app(argc, argv);

    GameConfig config;
    ModelList model(config);
    QQmlApplicationEngine engine;
    GraphicManager graphicManager(".");
    GameConsole console;
    SolarSystem galaxyEngine;

    Translator translator(&app, "../data/languages");
    translator.addTranslation("English", "starDust_en.qm");
    translator.addTranslation("Русский", "starDust_ru.qm");
    translator.addTranslation("Українська", "starDust_ua.qm");

    engine.rootContext()->setContextProperty("myModel", &model);
    engine.rootContext()->setContextProperty("graphicEngine", &graphicManager);
    engine.rootContext()->setContextProperty("ScreenManager", ScreenManager::Instance());
    engine.rootContext()->setContextProperty("profileManager", ProfileManager::Instance());
    engine.rootContext()->setContextProperty("gameConsolee", &console);
    engine.rootContext()->setContextProperty("translator", &translator);
    engine.rootContext()->setContextProperty("galaxyEngine", &galaxyEngine);
    engine.load(QUrl::fromLocalFile ("../data/main.qml"));
//    qmlRegisterType<SolarSystem>("galaxy.engine", 1, 0,"GalaxyEngine");

    return app.exec();
}
