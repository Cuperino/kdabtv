#ifndef TIMER_H
#define TIMER_H

#include <QObject>
#include <QQmlEngine>
#include <QElapsedTimer>

class Timer : public QObject
{
    Q_OBJECT
    QML_ELEMENT
private:
    QElapsedTimer m_timer;

public:
    explicit Timer(QObject *parent = nullptr);

    Q_INVOKABLE int deltaTime();

signals:
};

#endif // TIMER_H