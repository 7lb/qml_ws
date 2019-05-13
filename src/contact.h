#pragma once

#include <QObject>
#include <QString>
#include <QUrl>
#include <QUuid>

class Contact : public QObject
{
    Q_OBJECT

    // clang-format off
    Q_PROPERTY(
        QUuid contactUuid
        READ uuid
        WRITE setUuid
        NOTIFY uuidChanged
    )

    Q_PROPERTY(
        QString contactName
        READ name
        WRITE setName
        NOTIFY nameChanged
    )

    Q_PROPERTY(
        QString contactPhoneNo
        READ phoneNo
        WRITE setPhoneNo
        NOTIFY phoneNoChanged
    )

    Q_PROPERTY(
        QString contactEmail
        READ email
        WRITE setEmail
        NOTIFY emailChanged
    )
    // clang-format on

public:
    Contact(QObject* parent = nullptr);

    Contact(
        QString const& name,
        QString const& phoneNo,
        QString const& email,
        QObject* parent = nullptr);

    QUuid uuid() const;
    QString name() const;
    QString phoneNo() const;
    QString email() const;

    void setUuid(QUuid const& uuid);
    void setName(QString const& name);
    void setPhoneNo(QString const& phoneNo);
    void setEmail(QString const& email);

signals:
    void uuidChanged(QUuid const& newUuid);
    void nameChanged(QString const& newName);
    void phoneNoChanged(QString const& newPhoneNo);
    void emailChanged(QString const& newEmail);

private:
    QUuid _uuid{QUuid::createUuid()};
    QString _name{""};
    QString _phone_no{""};
    QString _email{""};
};
