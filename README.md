# flutter_lnd

A flutter package which adds a full lnd client on a mobile device.

## Getting started
Minimal example:
```dart
await FlutterLnd.startLndService();

/// Lightning client
final client = LightningClient(
  ClientChannel(
    'lnd-host',
    port: 10009,
  ),
);

/// Wallet rpc client
final wallet = WalletUnlockerClient(
  ClientChannel(
    'lnd-host',
    port: 10009,
  ),
);

/// Unlock the wallet
await wallet.unlockWallet(
  UnlockWalletRequest()..walletPassword = utf8.encode('password'),
);

/// Create an invoice for 10,000 SAT
await client.addInvoice(
  Invoice()..amtPaidSat = Int64(10000),
);
```