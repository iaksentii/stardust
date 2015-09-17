#ifndef PROFILEMANAGER_H
#define PROFILEMANAGER_H

#include "playerdata.h"

#include <QObject>
#include <QMap>
#include <QString>
#include <QSharedPointer>
#include <QStringListModel>

class ProfileManager : public QObject
{
    Q_OBJECT
    Q_PROPERTY(QStringListModel* playersListModel READ playersListModel NOTIFY playersListModelChanged)
    Q_PROPERTY(int currentPlayerIndex READ currentPlayerIndex NOTIFY currentPlayerIndexChanged)

public:
    explicit ProfileManager(QObject *parent = 0);

    QStringListModel* playersListModel();
    void setPlayersListModel(const QStringList &playersListModel);

    Q_INVOKABLE void newPlayer(const QString &newPlayer);
    Q_INVOKABLE void deletePlayer(QString delPlayer);
    Q_INVOKABLE void loadPlayer(QString playerName);

    Q_INVOKABLE QString currentPlayer() const;
    void setCurrentPlayer(const QString &playerName);

    Q_INVOKABLE int currentPlayerIndex() const;

signals:
    void playersListModelChanged();
    void currentPlayerIndexChanged(int index);

private:
    bool validName(QString playerName);
    QString pathToProfile(QString playerName);

    QSharedPointer<PlayerData> extractData(const QJsonObject &jsonObject);
    QJsonObject packData(const QSharedPointer<PlayerData> playerData);

private:
    QMap<QString, QSharedPointer<PlayerData> > m_playersList;
    QSharedPointer<QStringListModel> m_playersListModel;
    QString m_currentPlayer;
    int m_currentPlayerIndex;
    QString m_pathToProfiles;
};

#endif // PROFILEMANAGER_H
