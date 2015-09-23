#ifndef PROFILEMANAGER_H
#define PROFILEMANAGER_H

#include "playerdata.h"
#include "passwordcontroller.h"

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
    Q_PROPERTY(bool hasPlayers READ hasPlayers NOTIFY hasPlayersChanged)
    Q_PROPERTY(PasswordController* passwordCtrl READ passwordController NOTIFY passwordControllerChanged)

    ProfileManager(QObject *parent = 0);
    ProfileManager(const ProfileManager& val);
    ProfileManager& operator=(const ProfileManager& val);

public:
    static ProfileManager *Instance();

    QStringListModel* playersListModel();
    void setPlayersListModel(const QStringList &playersListModel);

    Q_INVOKABLE void newPlayer(const QString &newPlayer, const QString &password);
    Q_INVOKABLE void deletePlayer(QString delPlayer);
    Q_INVOKABLE void loadPlayer(QString playerName);
    Q_INVOKABLE void saveCurrentPlayer();

    QSharedPointer<PlayerData> loadPlayerData(const QString &playerName);

    Q_INVOKABLE QString currentPlayer() const;
    void setCurrentPlayer(const QString &playerName);

    int currentPlayerIndex() const;
    PlayerData* currentPlayerData() const;
    QSharedPointer<PlayerData> getPlayerData(const QString &playerName) const;

    bool hasPlayers();
    PasswordController *passwordController() const;

signals:
    void playersListModelChanged();
    void currentPlayerIndexChanged(int index);
    void currentPlayerDataChanged();
    void hasPlayersChanged();
    void passwordControllerChanged();

private:
    bool validName(QString playerName);
    QString pathToProfile(QString playerName);

private:
    QMap<QString, QSharedPointer<PlayerData> > m_playersList;
    QSharedPointer<QStringListModel> m_playersListModel;

    QString m_currentPlayer;
    int m_currentPlayerIndex;

    QString m_pathToProfiles;

    QSharedPointer<PasswordController> m_passwordController;
};

#endif // PROFILEMANAGER_H
