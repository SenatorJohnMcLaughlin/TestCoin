// Copyright (c) 2011-2014 The Testcoin Core developers
// Distributed under the MIT software license, see the accompanying
// file COPYING or http://www.opensource.org/licenses/mit-license.php.

#ifndef TESTCOIN_QT_TESTCOINADDRESSVALIDATOR_H
#define TESTCOIN_QT_TESTCOINADDRESSVALIDATOR_H

#include <QValidator>

/** Base58 entry widget validator, checks for valid characters and
 * removes some whitespace.
 */
class TestcoinAddressEntryValidator : public QValidator
{
    Q_OBJECT

public:
    explicit TestcoinAddressEntryValidator(QObject *parent);

    State validate(QString &input, int &pos) const;
};

/** Testcoin address widget validator, checks for a valid testcoin address.
 */
class TestcoinAddressCheckValidator : public QValidator
{
    Q_OBJECT

public:
    explicit TestcoinAddressCheckValidator(QObject *parent);

    State validate(QString &input, int &pos) const;
};

#endif // TESTCOIN_QT_TESTCOINADDRESSVALIDATOR_H
