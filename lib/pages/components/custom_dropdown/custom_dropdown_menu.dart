import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sti_startnow/pages/components/custom_dropdown/menu_dropdown.dart';
import 'package:sti_startnow/pages/components/custom_dropdown/menu_item.dart';
import 'package:sti_startnow/theme/app_theme.dart';

class CustomDropdownMenu extends StatefulWidget {
  final List<String> listChoices;
  final String selectedValue;
  final String hint;
  final String label;
  final bool isRequired;
  final bool isEnable;
  final bool isError;
  final Function(int index) onTap;

  const CustomDropdownMenu({
    super.key,
    required this.listChoices,
    required this.selectedValue,
    required this.label,
    this.hint = "",
    this.isRequired = false,
    this.isEnable = true,
    this.isError = false,
    required this.onTap,
  });

  @override
  State<CustomDropdownMenu> createState() => _CustomDropdownMenuState();
}

class _CustomDropdownMenuState extends State<CustomDropdownMenu> {
  final OverlayPortalController dropdownController = OverlayPortalController();

  final link = LayerLink();

  // Button width based on the button width
  double? btnWidth;

  // if the dropdown is showing
  bool isDropDownShowing = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
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

        const SizedBox(height: 5),

        CompositedTransformTarget(
          link: link,
          child: OverlayPortal(
            controller: dropdownController,
            overlayChildBuilder: (context) {
              return GestureDetector(
                onTap: () {
                  dropdownController.toggle();
                  setState(() {
                    isDropDownShowing = !isDropDownShowing;
                  });
                },
                child: Container(
                  color: Colors.transparent,
                  child: CompositedTransformFollower(
                    link: link,
                    targetAnchor: Alignment.bottomLeft,
                    child: Align(
                      alignment: AlignmentDirectional.topStart,

                      // Menu of Items Widget
                      child: MenuDropdown(
                        width: btnWidth,
                        child: List.generate(widget.listChoices.length, (
                          index,
                        ) {
                          return MenuItem(
                            text: widget.listChoices[index],
                            onTap: () {
                              widget.onTap(index);
                              dropdownController.toggle();
                              setState(() {
                                isDropDownShowing = false;
                              });
                            },
                          );
                        }),
                      ),
                    ),
                  ),
                ),
              );
            },

            child: GestureDetector(
              onTap: showDropDown,
              child: Container(
                decoration: BoxDecoration(
                  color: AppTheme.colors.white,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color:
                        isDropDownShowing
                            ? widget.isError
                                ? AppTheme.colors.red
                                : AppTheme.colors.primary
                            : widget.isError
                            ? AppTheme.colors.red
                            : AppTheme.colors.gray,
                    width: 2.0,
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 10,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      widget.selectedValue.isEmpty
                          ? Text(
                            widget.hint,
                            style: GoogleFonts.roboto(
                              color: AppTheme.colors.black,
                              fontSize: 16,
                            ),
                          )
                          : Text(
                            widget.selectedValue,
                            style: GoogleFonts.roboto(
                              color: AppTheme.colors.black,
                              fontSize: 16,
                            ),
                          ),

                      Icon(
                        isDropDownShowing
                            ? Icons.arrow_drop_up_outlined
                            : Icons.arrow_drop_down,
                        size: 30,
                        color: AppTheme.colors.black,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),

        widget.isError
            ? Padding(
              padding: const EdgeInsets.only(left: 8.0, top: 1),
              child: Text(
                "Please choose one",
                style: TextStyle(color: Colors.red[600], fontSize: 12),
              ),
            )
            : Container(),
      ],
    );
  }

  void showDropDown() {
    btnWidth = context.size?.width;
    dropdownController.toggle();
    setState(() {
      isDropDownShowing = !isDropDownShowing;
    });
  }
}
