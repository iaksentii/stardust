#ifndef GAMECONFIG_H
#define GAMECONFIG_H

#include <QObject>
#include <QVector>
#include <QDebug>

class GameConfig: public QObject
{
    Q_OBJECT
    Q_PROPERTY(int columns READ columns WRITE setcolumns NOTIFY columnsChanged)
    Q_PROPERTY(int rows READ rows WRITE setRows NOTIFY rowsChanged)
    Q_PROPERTY(int elementScore READ elementScore WRITE setElementScore NOTIFY elementScoreChanged)
    Q_PROPERTY(int minScore READ minScore WRITE setMinScore NOTIFY minScoreChanged)
    Q_PROPERTY(int maxMoves READ maxMoves WRITE setMaxMoves NOTIFY maxMovesChanged)
    Q_PROPERTY(int moves READ moves WRITE setMoves NOTIFY movesChanged)
    Q_PROPERTY(int score READ score WRITE setScore NOTIFY scoreChanged)
    Q_PROPERTY(bool isVictory READ isVictory WRITE setIsVictory NOTIFY isVictoryChanged)
    Q_PROPERTY(QString propertyAnim READ propertyAnim WRITE setPropertyAnim NOTIFY propertyAnimChanged)

public:

    GameConfig();
    GameConfig(const GameConfig &);
    int columns() const;
    int rows() const;
    int elementScore() const;
    int minScore() const;
    int maxMoves() const;
    int moves()const;
    int score()const;
    void isLevelCompleted();
    QVector<int> types() const;
    void setTypes(const QVector<int> &types);
    GameConfig & operator =(const GameConfig &);
    bool isVictory() const;
    QString propertyAnim() const;
    int invisibleSize();
    int brickSize();
    int getInvisible(int index);
    int getBrick(int index);
    void addResourses(int type, int count);
    Q_INVOKABLE int getResourses(int type);

public slots:

    void setcolumns(int columns);
    void setRows(int rows);
    void setElementScore(int elementScore);
    void setMinScore(int minScore);
    void setMaxMoves(int maxMoves);
    void setMoves(int moves);
    void setScore(int score);
    void setIsVictory(bool isVictory);

    void setPropertyAnim(QString propertyAnim);

signals:

    void columnsChanged(int columns);
    void rowsChanged(int rows);
    void elementScoreChanged(int elementScore);
    void minScoreChanged(int minScore);
    void maxMovesChanged(int maxMoves);
    void movesChanged(int moves);
    void scoreChanged(int score);
    void isVictoryChanged(bool isVictory);
    void propertyAnimChanged(QString propertyAnim);

private:

    int m_columns;
    int m_rows;
    int m_elementScore;
    int m_minScore;
    int m_maxMoves;
    QVector<int> m_types;
    int m_moves;
    int m_score;
    bool m_isVictory;
    QVector<int> m_brick;
    QVector<int> m_invisible;
    QString m_propertyAnim;
    int m_resourses[5];
};



#endif // GAMECONFIG_H
