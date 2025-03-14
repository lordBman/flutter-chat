import 'package:flutter/material.dart';

class Loading extends StatelessWidget{
    final String? message;

    const Loading({ super.key, this.message });

    @override
    Widget build(BuildContext context) {
        final ColorScheme theme = Theme.of(context).colorScheme;

        return Center(
            child: Column(mainAxisSize: MainAxisSize.min, children: [
                CircularProgressIndicator(color: theme.primary),
                SizedBox(height: 20,),
                Visibility(visible: message != null, child: Text(message ?? ""))
            ])
        );
    }
}