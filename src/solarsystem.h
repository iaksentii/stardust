#ifndef SOLARSYSTEM_H
#define SOLARSYSTEM_H

#include <QObject>
#include <QList>
#include <QQmlListProperty>
#include "graphicmanager.h"
#include "planet.h"

class SolarSystem : public GraphicManager
{
    Q_OBJECT

public:
    explicit SolarSystem();

    Q_INVOKABLE QString getPlanetsName(int index) const;
    Q_INVOKABLE void setPlanetsName(const int index, const QString value);

    Q_INVOKABLE int getResourcesCount(int index) const;
    Q_INVOKABLE void setResourcesCount(const int index, const int value);

    Q_INVOKABLE void addResourses();

    Q_INVOKABLE QString getPlanetsSlot(int index) const;
    Q_INVOKABLE void setPlanetsSlot(const int index, const QString value);

    Q_PROPERTY(QString planet1 READ planet1 WRITE setPlanet1 NOTIFY planet1Changed)
    Q_PROPERTY(QString planet2 READ planet2 WRITE setPlanet2 NOTIFY planet2Changed)
    Q_PROPERTY(QString planet3 READ planet3 WRITE setPlanet3 NOTIFY planet3Changed)
    Q_PROPERTY(QString planet4 READ planet4 WRITE setPlanet4 NOTIFY planet4Changed)
    Q_PROPERTY(QString planet5 READ planet5 WRITE setPlanet5 NOTIFY planet5Changed)
    Q_PROPERTY(QString planet6 READ planet6 WRITE setPlanet6 NOTIFY planet6Changed)
    Q_PROPERTY(QString planet7 READ planet7 WRITE setPlanet7 NOTIFY planet7Changed)
    Q_PROPERTY(QString planet8 READ planet8 WRITE setPlanet8 NOTIFY planet8Changed)

    Q_PROPERTY(QString planetName1 READ planetName1 WRITE setPlanetName1 NOTIFY planetName1Changed)
    Q_PROPERTY(QString planetName2 READ planetName2 WRITE setPlanetName2 NOTIFY planetName2Changed)
    Q_PROPERTY(QString planetName3 READ planetName3 WRITE setPlanetName3 NOTIFY planetName3Changed)
    Q_PROPERTY(QString planetName4 READ planetName4 WRITE setPlanetName4 NOTIFY planetName4Changed)
    Q_PROPERTY(QString planetName5 READ planetName5 WRITE setPlanetName5 NOTIFY planetName5Changed)
    Q_PROPERTY(QString planetName6 READ planetName6 WRITE setPlanetName6 NOTIFY planetName6Changed)
    Q_PROPERTY(QString planetName7 READ planetName7 WRITE setPlanetName7 NOTIFY planetName7Changed)
    Q_PROPERTY(QString planetName8 READ planetName8 WRITE setPlanetName8 NOTIFY planetName8Changed)

    Q_PROPERTY(int resource1 READ resource1 WRITE setResource1 NOTIFY resource1Changed)
    Q_PROPERTY(int resource2 READ resource2 WRITE setResource2 NOTIFY resource2Changed)
    Q_PROPERTY(int resource3 READ resource3 WRITE setResource3 NOTIFY resource3Changed)
    Q_PROPERTY(int resource4 READ resource4 WRITE setResource4 NOTIFY resource4Changed)
    Q_PROPERTY(int resource5 READ resource5 WRITE setResource5 NOTIFY resource5Changed)

    QString planet1() const;
    void setPlanet1(const QString &planet1);
    QString planet2() const;
    void setPlanet2(const QString &planet2);
    QString planet3() const;
    void setPlanet3(const QString &planet3);
    QString planet4() const;
    void setPlanet4(const QString &planet4);
    QString planet5() const;
    void setPlanet5(const QString &planet5);
    QString planet6() const;
    void setPlanet6(const QString &planet6);
    QString planet7() const;
    void setPlanet7(const QString &planet7);
    QString planet8() const;
    void setPlanet8(const QString &planet8);

    QString planetName1() const;
    void setPlanetName1(const QString &planet1);
    QString planetName2() const;
    void setPlanetName2(const QString &planet2);
    QString planetName3() const;
    void setPlanetName3(const QString &planet3);
    QString planetName4() const;
    void setPlanetName4(const QString &planet4);
    QString planetName5() const;
    void setPlanetName5(const QString &planet5);
    QString planetName6() const;
    void setPlanetName6(const QString &planet6);
    QString planetName7() const;
    void setPlanetName7(const QString &planet7);
    QString planetName8() const;
    void setPlanetName8(const QString &planet8);

    int resource1() const;
    void setResource1(const int &resource1);
    int resource2() const;
    void setResource2(const int &resource2);
    int resource3() const;
    void setResource3(const int &resource3);
    int resource4() const;
    void setResource4(const int &resource4);
    int resource5() const;
    void setResource5(const int &resource5);

private:

    QList<Planet> m_planet;
    QList <int> m_resourcesCount;

signals:
    void planet1Changed();
    void planet2Changed();
    void planet3Changed();
    void planet4Changed();
    void planet5Changed();
    void planet6Changed();
    void planet7Changed();
    void planet8Changed();

    void planetName1Changed();
    void planetName2Changed();
    void planetName3Changed();
    void planetName4Changed();
    void planetName5Changed();
    void planetName6Changed();
    void planetName7Changed();
    void planetName8Changed();

    void resource1Changed();
    void resource2Changed();
    void resource3Changed();
    void resource4Changed();
    void resource5Changed();
};
#endif // SOLARSYSTEM_H
