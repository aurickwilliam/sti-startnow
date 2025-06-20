import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sti_startnow/pages/components/custom_tooltip.dart';
import 'package:sti_startnow/theme/app_theme.dart';

class PasswordInput extends StatefulWidget {
  final TextEditingController controller;
  final String label;
  final String hint;
  final bool isRequired;
  final bool isEnable;
  final bool hasToolTip;
  final String toolTipMessage;
  final bool
  isPasswordChange; // Sa change password lang papakita valid password format
  final bool Function(String)?
  retype; // Para sa retype password sa change password
  final String? altMessage; // Para iba message kapag wala inenter na password

  const PasswordInput({
    super.key,
    required this.controller,
    required this.label,
    required this.hint,
    this.isRequired = false,
    this.isEnable = true,
    this.hasToolTip = false,
    this.toolTipMessage = "",
    this.isPasswordChange = false,
    this.retype,
    this.altMessage,
  });

  @override
  State<PasswordInput> createState() => _PasswordInputState();
}

class _PasswordInputState extends State<PasswordInput> {
  bool hidePassword = true;

  FocusNode focusNode = FocusNode();
  bool isFocused = false;

  @override
  void initState() {
    super.initState();

    // Change the isFocused variable when the user focus on the textfield
    focusNode.addListener(() {
      setState(() {
        isFocused = focusNode.hasFocus;
      });
    });
  }

  @override
  void dispose() {
    focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            RichText(
              text: TextSpan(
                style: GoogleFonts.roboto(
                  color: AppTheme.colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
                children: [
                  TextSpan(text: widget.label),
                  TextSpan(
                    text: widget.isRequired ? "*" : "",
                    style: GoogleFonts.roboto(color: AppTheme.colors.red),
                  ),
                ],
              ),
            ),

            widget.hasToolTip
                ? CustomTooltip(message: widget.toolTipMessage)
                : SizedBox(),
          ],
        ),

        const SizedBox(height: 10),

        TextFormField(
          // Hide Password
          obscureText: hidePassword,

          focusNode: focusNode,
          enabled: widget.isEnable,
          controller: widget.controller,
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: AppTheme.colors.primary,
                width: 2.0,
              ),
              borderRadius: BorderRadius.circular(10),
            ),

            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: AppTheme.colors.gray, width: 2.0),
              borderRadius: BorderRadius.circular(10),
            ),

            errorBorder: OutlineInputBorder(
              borderSide: BorderSide(color: AppTheme.colors.red, width: 2.0),
              borderRadius: BorderRadius.circular(10),
            ),

            focusedErrorBorder: OutlineInputBorder(
              borderSide: BorderSide(color: AppTheme.colors.red, width: 2.0),
              borderRadius: BorderRadius.circular(10),
            ),

            hintText: widget.hint,
            errorStyle: TextStyle(color: Colors.red[600]),

            suffixIcon:
                isFocused
                    ? IconButton(
                      onPressed: () {
                        setState(() {
                          hidePassword = !hidePassword;
                        });
                      },
                      icon: Icon(
                        hidePassword ? Icons.visibility_off : Icons.visibility,
                      ),
                    )
                    : null,
          ),
          style: GoogleFonts.roboto(color: AppTheme.colors.black, fontSize: 16),
          onTapOutside: (event) {
            focusNode.unfocus();
          },

          validator: (input) {
            if (input == null || input.isEmpty) {
              return widget.altMessage ?? "Please enter your password";
            }

            if (widget.isPasswordChange) {
              RegExp passwordPattern = RegExp(
                r"^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)[A-Za-z\d]{12,16}$",
              );

              if (!passwordPattern.hasMatch(input)) {
                return "12-16 characters, one uppercase, one lowercase, one digit";
              }
            }

            if (widget.retype != null) {
              // Kapag hindi niretype ang password
              if (!widget.retype!(input)) {
                return "Does not match new password";
              }
            }

            return null;
          },
          autovalidateMode: AutovalidateMode.onUnfocus,
        ),
      ],
    );
  }
}
