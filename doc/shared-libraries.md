Shared Libraries
================

## testcoinconsensus

The purpose of this library is to make the verification functionality that is critical to Testcoin's consensus available to other applications, e.g. to language bindings.

### API

The interface is defined in the C header `testcoinconsensus.h` located in  `src/script/testcoinconsensus.h`.

#### Version

`testcoinconsensus_version` returns an `unsigned int` with the API version *(currently at an experimental `0`)*.

#### Script Validation

`testcoinconsensus_verify_script` returns an `int` with the status of the verification. It will be `1` if the input script correctly spends the previous output `scriptPubKey`.

##### Parameters
- `const unsigned char *scriptPubKey` - The previous output script that encumbers spending.
- `unsigned int scriptPubKeyLen` - The number of bytes for the `scriptPubKey`.
- `const unsigned char *txTo` - The transaction with the input that is spending the previous output.
- `unsigned int txToLen` - The number of bytes for the `txTo`.
- `unsigned int nIn` - The index of the input in `txTo` that spends the `scriptPubKey`.
- `unsigned int flags` - The script validation flags *(see below)*.
- `testcoinconsensus_error* err` - Will have the error/success code for the operation *(see below)*.

##### Script Flags
- `testcoinconsensus_SCRIPT_FLAGS_VERIFY_NONE`
- `testcoinconsensus_SCRIPT_FLAGS_VERIFY_P2SH` - Evaluate P2SH ([BIP16](https://github.com/testcoin/bips/blob/master/bip-0016.mediawiki)) subscripts
- `testcoinconsensus_SCRIPT_FLAGS_VERIFY_DERSIG` - Enforce strict DER ([BIP66](https://github.com/testcoin/bips/blob/master/bip-0066.mediawiki)) compliance
- `testcoinconsensus_SCRIPT_FLAGS_VERIFY_NULLDUMMY` - Enforce NULLDUMMY ([BIP147](https://github.com/testcoin/bips/blob/master/bip-0147.mediawiki))
- `testcoinconsensus_SCRIPT_FLAGS_VERIFY_CHECKLOCKTIMEVERIFY` - Enable CHECKLOCKTIMEVERIFY ([BIP65](https://github.com/testcoin/bips/blob/master/bip-0065.mediawiki))
- `testcoinconsensus_SCRIPT_FLAGS_VERIFY_CHECKSEQUENCEVERIFY` - Enable CHECKSEQUENCEVERIFY ([BIP112](https://github.com/testcoin/bips/blob/master/bip-0112.mediawiki))
- `testcoinconsensus_SCRIPT_FLAGS_VERIFY_WITNESS` - Enable WITNESS ([BIP141](https://github.com/testcoin/bips/blob/master/bip-0141.mediawiki))

##### Errors
- `testcoinconsensus_ERR_OK` - No errors with input parameters *(see the return value of `testcoinconsensus_verify_script` for the verification status)*
- `testcoinconsensus_ERR_TX_INDEX` - An invalid index for `txTo`
- `testcoinconsensus_ERR_TX_SIZE_MISMATCH` - `txToLen` did not match with the size of `txTo`
- `testcoinconsensus_ERR_DESERIALIZE` - An error deserializing `txTo`
- `testcoinconsensus_ERR_AMOUNT_REQUIRED` - Input amount is required if WITNESS is used

### Example Implementations
- [NTestcoin](https://github.com/NicolasDorier/NTestcoin/blob/master/NTestcoin/Script.cs#L814) (.NET Bindings)
- [node-libtestcoinconsensus](https://github.com/bitpay/node-libtestcoinconsensus) (Node.js Bindings)
- [java-libtestcoinconsensus](https://github.com/dexX7/java-libtestcoinconsensus) (Java Bindings)
- [testcoinconsensus-php](https://github.com/Bit-Wasp/testcoinconsensus-php) (PHP Bindings)
