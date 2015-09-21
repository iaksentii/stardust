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
    Q_PROPERTY(PlayerData* currentPlayerData READ currentPlayerData NOTIFY currentPlayerDataChanged)

public:
    explicit ProfileManager(QObject *parent = 0);

    QStringListModel* playersListModel();
    void setPlayersListModel(const QStringList &playersListModel);

    Q_INVOKABLE void newPlayer(const QString &newPlayer);
    Q_INVOKABLE void deletePlayer(QString delPlayer);
    Q_INVOKABLE void loadPlayer(QString playerName);

    Q_INVOKABLE void saveCurrentPlayer();
    Q_INVOKABLE QString currentPlayer() const;
    void setCurrentPlayer(const QString &playerName);

    Q_INVOKABLE int currentPlayerIndex() const;
    Q_INVOKABLE PlayerData* currentPlayerData() const;

signals:
    void playersListModelChanged();
    void currentPlayerIndexChanged(int index);
    void currentPlayerDataChanged();

private:
    bool validName(QString playerName);
    QString pathToProfile(QString playerName);

private:
    QMap<QString, QSharedPointer<PlayerData> > m_playersList;
    QSharedPointer<QStringListModel> m_playersListModel;
    QString m_currentPlayer;
    int m_currentPlayerIndex;
    QString m_pathToProfiles;
};

#endif // PROFILEMANAGER_H
