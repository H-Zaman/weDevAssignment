import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class CButton extends StatelessWidget {
  final VoidCallback onTap;
  final String? title;
  final Color? color;
  final Color? textColor;
  final Color? iconColor;
  final Color? loadColor;
  final Color? onPrimary;
  final String? icon;
  final Widget? widget;
  final bool loading;
  const CButton({Key? key,
    this.title,
    required this.onTap,
    this.loading = false,
    this.loadColor,
    this.color,
    this.icon,
    this.widget,
    this.textColor,
    this.iconColor,
    this.onPrimary,
  });

  @override
  Widget build(BuildContext context) {

    return SizedBox(
        height: 55,
        width: double.infinity,
        child: ElevatedButton(
            onPressed: (){
              FocusScope.of(context).unfocus();
              onTap.call();
            },
            style: ElevatedButton.styleFrom(
              onPrimary: onPrimary ?? Colors.grey,
              primary: color ?? Color(0xffEAEAEC),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(14)
              ),
              elevation: 0,
            ),
            child: loading ? SpinKitThreeBounce(color: loadColor ?? Colors.black, size: 20) : widget == null ? icon == null ? Center(
              child: Text(
                title ?? 'Continue',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: textColor ?? Color(0xff6D6E73)
                ),
              ),
            ) : Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [

                  Container(
                    height: 26,
                    width: 26,
                    child: Image.asset(icon!,fit: BoxFit.cover, color: iconColor),
                  ),
                  Text(
                    title ?? 'Continue',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: textColor ?? Color(0xff6D6E73)
                    ),
                  ),

                  SizedBox(width: 32,),


                ],
              ),
            ): widget
        )
    );
  }
}