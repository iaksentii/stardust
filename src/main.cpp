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
int main(int argc, char *argv[])
{
    QApplication app(argc, argv);

    QQmlApplicationEngine engine;
    GraphicManager  p(".");

    GameConsole console;

    Translator translator(&app, "../data/languages");
    translator.addTranslation("English", "starDust_en.qm");
    translator.addTranslation("Русский", "starDust_ru.qm");
    translator.addTranslation("Українська", "starDust_ua.qm");

    engine.rootContext()->setContextProperty("ScreenManager", ScreenManager::Instance());
    engine.rootContext()->setContextProperty("graphicEngine", &p);
    engine.rootContext()->setContextProperty("profileManager", ProfileManager::Instance());
    engine.rootContext()->setContextProperty("gameConsolee", &console);
    engine.rootContext()->setContextProperty("translator", &translator);
    engine.load(QUrl::fromLocalFile ("../data/main.qml"));
    qmlRegisterType<SolarSystem>("galaxy.engine", 1, 0,"GalaxyEngine");

    return app.exec();
}
