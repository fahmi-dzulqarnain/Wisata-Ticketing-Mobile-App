import 'package:flutter/material.dart';
import 'package:wisata_ticketing/core/core.dart';
import 'package:wisata_ticketing/features/main/widgets/dialogs/logout_ticket_dialog.dart';
import 'package:wisata_ticketing/features/main/widgets/dialogs/sync_data_dialog.dart';
import 'package:wisata_ticketing/features/main/widgets/setting_button.dart';

import 'setting_printer_page.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pengaturan'),
      ),
      body: GridView.count(
        padding: const EdgeInsets.all(24.0),
        crossAxisCount: 2,
        crossAxisSpacing: 15.0,
        mainAxisSpacing: Sizing.lessLarge,
        children: [
          SettingButton(
            iconPath: Assets.icons.settings.printer.path,
            title: 'Printer',
            subtitle: 'Kelola printer',
            onPressed: () {
              context.push(const SettingPrinterPage());
            },
          ),
          SettingButton(
            iconPath: Assets.icons.settings.logout.path,
            title: 'Logout',
            subtitle: 'Keluar dari aplikasi',
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) => const LogoutTicketDialog(),
              );
            },
          ),
          SettingButton(
            iconPath: Assets.icons.settings.syncData.path,
            title: 'Sync Data',
            subtitle: 'Sinkronisasi online',
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) => const SyncDataDialog(),
              );
            },
          ),
        ],
      ),
    );
  }
}
