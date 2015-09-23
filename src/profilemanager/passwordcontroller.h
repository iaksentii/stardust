#ifndef PASSWORDCONTROLLER_H
#define PASSWORDCONTROLLER_H

#include <QObject>

class PasswordController : public QObject
{
    Q_OBJECT
    Q_PROPERTY(QString checkedPlayer READ checkedPlayer WRITE setCheckedPlayer NOTIFY checkedPlayerChanged)
public:
    explicit PasswordController(QObject *parent = 0);

    Q_INVOKABLE bool confirmPassword(const QString &password);
    bool setPassword(const QString &player, const QString &password);

    QString gen(const QString &password);

    QString checkedPlayer() const;
    void setCheckedPlayer(const QString &checkedPlayer);

signals:
    void checkedPlayerChanged();

private:
    QString encrypt(const QString &password);
    QString decrypt(const QString &password);

private:
    QString m_checkedPlayer;
};

#endif // PASSWORDCONTROLLER_H
