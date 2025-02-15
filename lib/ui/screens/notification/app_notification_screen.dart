import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../../utils/extensions/build_context_extension.dart';
import '../../../utils/constants/app_typography.dart';

@RoutePage()
class AppNotificationScreen extends StatelessWidget {
  const AppNotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade50,
      appBar: AppBar(
        title: Text(
          'Notifications',
          style: AppTypography.titleLarge,
        ),
        leading: IconButton(
          icon: const Icon(Icons.close),
          onPressed: () {
            context.router.maybePop();
          },
        ),
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: context.screenPadding * 0.5,
                ),
                child: ListView.builder(
                  itemCount: 20,
                  shrinkWrap: true,
                  physics: BouncingScrollPhysics(),
                  primary: false,
                  padding: EdgeInsets.fromLTRB(5.0, 5.0, 5.0, context.screenPadding),
                  itemBuilder: (context, index) => _ProfileTiles(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ProfileTiles extends StatelessWidget {
  const _ProfileTiles({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                blurRadius: 10,
                offset: const Offset(-5, 5),
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  DecoratedBox(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Icon(
                        Icons.notifications_none,
                        size: 25,
                      ),
                    ),
                  ),
                  Text(
                    'Notifications',
                    style: AppTypography.bodyLarge.copyWith(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
