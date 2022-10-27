import 'package:flutter/material.dart';
import 'package:reforce_platform/common/static/styles.dart';

class PlatformElevatedButton extends OutlinedButton {
  PlatformElevatedButton(
      {Key? key, required Function() onPressed, required String text})
      : super(
          key: key,
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
           primary: const Color.fromRGBO(239, 55, 62, 1),
          ),
          child: Text(
            text,
            style: AppStyles.buttonOn().copyWith(color: Colors.white),
          ),
        );
}

class PlatformOultinedButton extends OutlinedButton {
  PlatformOultinedButton(
      {Key? key, required Function() onPressed, required String text})
      : super(
          key: key,
          onPressed: onPressed,
          style: OutlinedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            side: const BorderSide(
                width: 1.0, color: Color.fromRGBO(239, 55, 62, 1)),
          ),
          child: Text(text,
              style: AppStyles.buttonOn()
                  .copyWith(color: const Color.fromRGBO(239, 55, 62, 1))),
        );
}
