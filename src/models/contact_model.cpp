#include "models/contact_model.h"

ContactModel::ContactModel(QObject* parent)
    : QAbstractListModel{parent}
{}

auto ContactModel::rowCount(QModelIndex const& parent) const -> int
{
    Q_UNUSED(parent);
    return _contacts.size();
}

auto ContactModel::roleNames() const -> QHash<int, QByteArray>
{
    return {
        {ContactRoles::ContactUuid, "contactUuid"},
        {ContactRoles::ContactName, "contactName"},
        {ContactRoles::ContactPhoneNo, "contactPhoneNo"},
        {ContactRoles::ContactEmail, "contactEmail"},
    };
}

auto ContactModel::flags(QModelIndex const& index) const -> Qt::ItemFlags
{
    Q_UNUSED(index);
    return Qt::ItemIsSelectable | Qt::ItemIsEditable | Qt::ItemIsEnabled;
}

auto ContactModel::data(QModelIndex const& index, int role) const -> QVariant
{
    auto row = index.row();

    if (row < 0) return {};
    if (row >= rowCount()) return {};

    auto c = _contacts.at(row);

    switch (role) {
    case ContactRoles::ContactUuid: return c->uuid();
    case ContactRoles::ContactName: return c->name();
    case ContactRoles::ContactPhoneNo: return c->phoneNo();
    case ContactRoles::ContactEmail: return c->email();
    }

    Q_ASSERT(false);
    return {};
}

QVariant ContactModel::headerData(
    int section,
    Qt::Orientation orientation,
    int role) const
{
    // headerData for this model is only meaningful for columnar lists with
    // an horizontal header and a single column. It also doesn't make sense
    // to ask anything different than the DisplayRole for our model
    if (section != 0) return {};
    if (orientation != Qt::Horizontal) return {};
    if (role != Qt::DisplayRole) return {};

    return tr("Contact name");
}

auto ContactModel::setData(
    QModelIndex const& index,
    QVariant const& value,
    int role) -> bool
{
    auto row = index.row();

    if (row < 0) return false;
    if (row >= rowCount()) return false;
    if (!value.isValid()) return false;

    auto success = [this](int row) {
        emit dataChanged(this->index(row), this->index(row));
        return true;
    };

    switch (role) {
    case ContactRoles::ContactUuid:
        Q_ASSERT_X(false, "ContactModel::setData", "setting uuid is forbidden");
        return false;

    case ContactRoles::ContactName:
        _contacts[row]->setName(value.toString());
        return success(row);

    case ContactRoles::ContactPhoneNo:
        _contacts[row]->setPhoneNo(value.toString());
        return success(row);

    case ContactRoles::ContactEmail:
        _contacts[row]->setEmail(value.toString());
        return success(row);
    }

    Q_ASSERT(false);
    return false;
}

void ContactModel::setContactName(QUuid const& uuid, QString const& name)
{
    auto idx = modelIndexByUuid(uuid);
    if (!idx.isValid()) return;

    setData(idx, name, ContactRoles::ContactName);
}

void ContactModel::setContactPhoneNo(QUuid const& uuid, QString const& phoneNo)
{
    auto idx = modelIndexByUuid(uuid);
    if (!idx.isValid()) return;

    setData(idx, phoneNo, ContactRoles::ContactPhoneNo);
}

void ContactModel::setContactEmail(QUuid const& uuid, QString const& email)
{
    auto idx = modelIndexByUuid(uuid);
    if (!idx.isValid()) return;

    setData(idx, email, ContactRoles::ContactEmail);
}

void ContactModel::removeContact(const QUuid& uuid)
{
    auto idx = listIndexByUuid(uuid);
    if (idx == -1) return;

    beginRemoveRows({}, idx, idx);
    _contacts.removeAt(idx);
    endRemoveRows();
}

void ContactModel::addContact(Contact* contact)
{
    auto c = new Contact{
        contact->name(),
        contact->phoneNo(),
        contact->email(),
        this,
    };

    beginInsertRows({}, rowCount(), rowCount());
    _contacts.push_back(c);
    endInsertRows();
}

int ContactModel::listIndexByUuid(QUuid const& uuid) const
{
    for (auto i = 0; i < _contacts.size(); ++i) {
        if (_contacts.at(i)->uuid() == uuid) return i;
    }

    return -1;
}
QModelIndex ContactModel::modelIndexByUuid(QUuid const& uuid) const
{
    auto idxs =
        match(index(0), ContactRoles::ContactUuid, uuid, 1, Qt::MatchExactly);

    if (idxs.isEmpty()) return {};
    return idxs.at(0);
}
