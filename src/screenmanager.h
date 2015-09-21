#ifndef SCREENMANAGER_H
#define SCREENMANAGER_H

#include <QObject>
#include <QMap>
#include <QString>

class ScreenManager : public QObject
{
    Q_OBJECT
private:
    explicit ScreenManager(QObject *parent = 0);
    ScreenManager(const ScreenManager& root);
    ScreenManager& operator=(const ScreenManager&);

    QMap<QString,QString> mapOfFiles;

    void initMap();

public:
    static ScreenManager *Instance();

    Q_INVOKABLE void loadWindow(const QString &windowName);
    Q_INVOKABLE void closeWindow();

signals:
    void openWindowSignal(QString windowName);
    void closeWindowSignal();

public slots:
};

#endif // SCREENMANAGER_H
