#pragma once

#include <QAbstractListModel>

#include "contact.h"

class ContactModel : public QAbstractListModel
{
    Q_OBJECT

public:
    explicit ContactModel(QObject* parent = nullptr);

    int rowCount(QModelIndex const& parent = {}) const override;
    QHash<int, QByteArray> roleNames() const override;
    Qt::ItemFlags flags(QModelIndex const& index) const override;

    QVariant data(QModelIndex const& index, int role = Qt::DisplayRole)
        const override;

    QVariant headerData(
        int section,
        Qt::Orientation orientation,
        int role = Qt::DisplayRole) const override;

    bool setData(
        QModelIndex const& index,
        QVariant const& value,
        int role = Qt::EditRole) override;

    enum ContactRoles
    {
        ContactUuid = Qt::UserRole + 1,
        ContactName,
        ContactPhoneNo,
        ContactEmail,
    };

    Q_INVOKABLE void setContactName(QUuid const& uuid, QString const& name);

    Q_INVOKABLE void setContactPhoneNo(
        QUuid const& uuid,
        QString const& phoneNo);

    Q_INVOKABLE void setContactEmail(QUuid const& uuid, QString const& email);

    Q_INVOKABLE void removeContact(QUuid const& uuid);
    Q_INVOKABLE void addContact(Contact* contact);

private:
    QList<Contact*> _contacts{
        new Contact{
            "John Doe",
            "3330004567",
            "john.doe@somemail.com",
            this,
        },

        new Contact{
            "Jane Doe",
            "3330004568",
            "jane.doe@somemail.com",
            this,
        },

        new Contact{
            "Alice",
            "3330004569",
            "alice@wonderland.org",
            this,
        },

        new Contact{
            "Bob",
            "3330004560",
            "bob@ross.com",
            this,
        },
    };

    int listIndexByUuid(QUuid const& uuid) const;
    QModelIndex modelIndexByUuid(QUuid const& uuid) const;
};
