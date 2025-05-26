import 'package:flutter/material.dart';
import 'package:sti_startnow/main.dart';
import 'package:sti_startnow/pages/components/buttons/bottom_button.dart';
import 'package:sti_startnow/pages/components/buttons/delete_button.dart';
import 'package:sti_startnow/pages/components/page_app_bar.dart';
import 'package:sti_startnow/pages/components/text_input.dart';
import 'package:sti_startnow/theme/app_theme.dart';

class EditProgramRowPage extends StatefulWidget {
  final List rowValues;

  const EditProgramRowPage({super.key, required this.rowValues});

  @override
  State<EditProgramRowPage> createState() => _EditProgramRowPageState();
}

class _EditProgramRowPageState extends State<EditProgramRowPage> {
  final TextEditingController programNameController = TextEditingController();
  final TextEditingController acronymController = TextEditingController();
  final TextEditingController departmentController = TextEditingController();
  late final int id; // id ng program sa database
  @override
  void initState() {
    programNameController.text = widget.rowValues[1];
    acronymController.text = widget.rowValues[2];
    departmentController.text = widget.rowValues[3];
    id = int.parse(widget.rowValues[0]);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // if is in landscape
    bool isLandscape =
        MediaQuery.of(context).orientation == Orientation.landscape;

    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: AppTheme.colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.only(
                  bottom: 20
                ),
                child: Column(
                  children: [
                    PageAppBar(title: "Edit Information"),

                    const SizedBox(height: 10),

                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: isLandscape ? 200 : 24,
                        vertical: 10,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              TextInput(
                                controller: programNameController,
                                label: "Program Name:",
                              ),

                              const SizedBox(height: 10),

                              TextInput(
                                controller: acronymController,
                                label: "Acronym:",
                              ),

                              const SizedBox(height: 10),

                              TextInput(
                                controller: departmentController,
                                label: "Department:",
                              ),

                              const SizedBox(height: 10),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ),

            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: isLandscape ? 200 : 24,
                vertical: 10,
              ),
              child: Column(
                children: [
                  BottomButton(
                    // Edit button
                    onPressed: () async {
                      await supabase
                          .from("PROGRAM")
                          .update({
                            'program_name': programNameController.text,
                            'acronym': acronymController.text,
                            'department': departmentController.text,
                          })
                          .eq('id', id);

                      if (context.mounted) {
                        Navigator.pop(context);
                      }
                    },
                    text: "Save",
                  ),

                  const SizedBox(height: 10),

                  DeleteButton(
                    onPressed: () async {
                      await supabase.from("PROGRAM").delete().eq('id', id);

                      if (context.mounted) {
                        Navigator.pop(context);
                      }
                    },
                    text: "Delete",
                  ),
                ],
              ),
            ),
          ],
        )
      ),
    );
  }
}
