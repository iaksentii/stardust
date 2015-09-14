#include <QApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include <QDir>
#include <QDebug>

#include "screenmanager.h"
#include "graphicmanager.h"
int main(int argc, char *argv[])
{
    QApplication app(argc, argv);

    QQmlApplicationEngine engine;
    GraphicManager p("../stardust");

    ScreenManager manager;

    engine.rootContext()->setContextProperty("ScreenManager", &manager);
    engine.rootContext()->setContextProperty("graphicEngine", &p);
    engine.load(QUrl::fromLocalFile ("../stardust/main.qml"));

    return app.exec();
}
