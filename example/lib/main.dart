import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_lnd/flutter_lnd.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();

    FlutterLnd.startLndService();

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
    wallet.unlockWallet(
      UnlockWalletRequest()..walletPassword = utf8.encode('password'),
    );

    client.addInvoice(
      Invoice()..amtPaidSat = Int64(10000),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Container(),
      ),
    );
  }
}
