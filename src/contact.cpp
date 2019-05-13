#include "contact.h"

Contact::Contact(QObject* parent)
    : QObject{parent}
{}

Contact::Contact(
    const QString& name,
    const QString& phoneNo,
    const QString& email,
    QObject* parent)
    : QObject{parent}
    , _name{name}
    , _phone_no{phoneNo}
    , _email{email}
{}

QUuid Contact::uuid() const
{
    return _uuid;
}

QString Contact::name() const
{
    return _name;
}

QString Contact::phoneNo() const
{
    return _phone_no;
}

QString Contact::email() const
{
    return _email;
}

void Contact::setUuid(QUuid const& uuid)
{
    if (_uuid == uuid) return;
    _uuid = uuid;
    emit uuidChanged(uuid);
}

void Contact::setName(QString const& name)
{
    if (_name == name) return;
    _name = name;
    emit nameChanged(name);
}

void Contact::setPhoneNo(QString const& phoneNo)
{
    if (_phone_no == phoneNo) return;
    _phone_no = phoneNo;
    emit phoneNoChanged(phoneNo);
}

void Contact::setEmail(QString const& email)
{
    if (_email == email) return;
    _email = email;
    emit emailChanged(email);
}
