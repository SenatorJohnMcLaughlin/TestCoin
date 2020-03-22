// Copyright (c) 2016 The Testcoin Core developers
// Distributed under the MIT software license, see the accompanying
// file COPYING or http://www.opensource.org/licenses/mit-license.php.

#ifndef TESTCOIN_WALLET_TEST_FIXTURE_H
#define TESTCOIN_WALLET_TEST_FIXTURE_H

#include "test/test_testcoin.h"

/** Testing setup and teardown for wallet.
 */
struct WalletTestingSetup: public TestingSetup {
    WalletTestingSetup(const std::string& chainName = CBaseChainParams::MAIN);
    ~WalletTestingSetup();
};

#endif

