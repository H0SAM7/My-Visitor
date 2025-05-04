import 'package:flutter/material.dart';
import 'package:my_visitor/generated/l10n.dart';

class PyramidText extends StatelessWidget {
  const PyramidText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
            final s= S.of(context);

    return Padding(
      padding: const EdgeInsets.only(top: 80, left: 16, right: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
           s.greatPyramidTitle,
            style: TextStyle(
              color: Color(0xffE09A1E),
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            s.gizaNecropolis,
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
            ),
          ),
        ],
      ),
    );
  }
}
