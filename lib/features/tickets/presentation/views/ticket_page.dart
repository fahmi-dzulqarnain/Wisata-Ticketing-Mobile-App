import 'package:flutter/material.dart';
import 'package:wisata_ticketing/core/core.dart';
import 'package:wisata_ticketing/features/main/models/product_model.dart';
import 'package:wisata_ticketing/features/main/widgets/dialogs/add_ticket_dialog.dart';
import 'package:wisata_ticketing/features/main/widgets/ticket_card.dart';

class TicketPage extends StatelessWidget {
  const TicketPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Padding(
          padding: EdgeInsets.all(20),
            child: Text('Kelola Tiket'),
        ),
        actions: [
          IconButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) => const AddTicketDialog(),
              );
            },
            icon: Assets.icons.plus.svg(),
          ),
          const SpaceWidth(8.0),
        ],
      ),
      body: ListView.separated(
        padding: setPaddingAll(Sizing.lessLarge),
        itemCount: products.length,
        separatorBuilder: (context, index) => const SpaceHeight(20.0),
        itemBuilder: (context, index) => TicketCard(
          item: products[index],
        ),
      ),
    );
  }
}
