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
    GraphicManager p();

    ScreenManager manager;

    engine.rootContext()->setContextProperty("ScreenManager", &manager);
    engine.rootContext()->setContextProperty("graphicEngine", &p);
    engine.load(QUrl::fromLocalFile ("../starDust/main.qml"));

    return app.exec();
}
