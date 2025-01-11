import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:jus/core/routes/app_router.gr.dart';

@RoutePage()
class AppliedJobsScreen extends StatelessWidget {
  const AppliedJobsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          onPressed: (){
            context.router.push(MenuRoute());
          },
        ),
      ),
    );
  }
}
