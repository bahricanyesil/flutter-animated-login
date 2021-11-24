import 'package:flutter/material.dart';

class LoadingIndicator extends StatelessWidget {
  /// Loading indicator widget to show in processes.
  const LoadingIndicator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Container(
        padding: const EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            _getLoadingIndicator(context),
            _getHeading(context),
          ],
        ),
      );

  Padding _getLoadingIndicator(BuildContext context) => Padding(
        padding: const EdgeInsets.only(bottom: 10),
        child: SizedBox(
          width: 100,
          height: 100,
          child: Center(
            child: CircularProgressIndicator(
              color: Theme.of(context).primaryColor,
              strokeWidth: 3,
            ),
          ),
        ),
      );

  Widget _getHeading(BuildContext context) => const Padding(
        padding: EdgeInsets.only(bottom: 10),
        child: Text('Please Wait...'),
      );
}
