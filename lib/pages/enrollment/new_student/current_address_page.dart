import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:sti_startnow/models/student.dart';
import 'package:sti_startnow/pages/components/buttons/back_next_button.dart';
import 'package:sti_startnow/pages/components/custom_bottom_sheet.dart';
import 'package:sti_startnow/pages/components/number_input.dart';
import 'package:sti_startnow/pages/components/text_input.dart';
import 'package:sti_startnow/pages/enrollment/components/enrollment_header.dart';
import 'package:sti_startnow/pages/enrollment/new_student/permananet_address_page.dart';
import 'package:sti_startnow/providers/database_provider.dart';
import 'package:sti_startnow/theme/app_theme.dart';

class CurrentAddressPage extends StatefulWidget {
  const CurrentAddressPage({super.key});

  @override
  State<CurrentAddressPage> createState() => _CurrentAddressPageState();
}

class _CurrentAddressPageState extends State<CurrentAddressPage> {
  late Student student;

  final _formKey = GlobalKey<FormState>(); // For input validation

  final TextEditingController streetNoController = TextEditingController();
  final TextEditingController streetController = TextEditingController();
  final TextEditingController subdivisionController = TextEditingController();
  final TextEditingController barangayController = TextEditingController();
  final TextEditingController cityController = TextEditingController();
  final TextEditingController provinceController = TextEditingController();
  final TextEditingController zipCodeController = TextEditingController();

  @override
  void initState() {
    student = context.read<DatabaseProvider>().student;

    streetNoController.text = student.currentAddress.streetNumber ?? "";
    streetController.text = student.currentAddress.street ?? "";
    subdivisionController.text = student.currentAddress.subdivision ?? "";
    barangayController.text = student.currentAddress.barangay ?? "";
    cityController.text = student.currentAddress.city ?? "";
    provinceController.text = student.currentAddress.province ?? "";
    zipCodeController.text = student.currentAddress.zipCode ?? "";

    super.initState();
  }

  void saveInput() {
    student.currentAddress.streetNumber = streetNoController.text;
    student.currentAddress.street = streetController.text;
    student.currentAddress.subdivision = subdivisionController.text;
    student.currentAddress.barangay = barangayController.text;
    student.currentAddress.city = cityController.text;
    student.currentAddress.province = provinceController.text;
    student.currentAddress.zipCode = zipCodeController.text;
  }

  @override
  Widget build(BuildContext context) {
    // if is in landscape
    bool isLandscape =
        MediaQuery.of(context).orientation == Orientation.landscape;

    return Scaffold(
      backgroundColor: AppTheme.colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              EnrollmentHeader(
                step1: true,
                step2: true,
                step3: false,
                step4: false,
                title: "Personal Information",
              ),

              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: isLandscape ? 200 : 24,
                  vertical: 10,
                ),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Current Address",
                        style: GoogleFonts.roboto(
                          color: AppTheme.colors.primary,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      const SizedBox(height: 10),

                      Text(
                        "Fill up the necessary information:",
                        style: GoogleFonts.roboto(
                          color: AppTheme.colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),

                      const SizedBox(height: 10),

                      // Street No / Unit No
                      TextInput(
                        controller: streetNoController,
                        label: "Street # / Unit #:",
                        hint: "",
                        isRequired: true,
                        isEnable: true,
                      ),

                      const SizedBox(height: 10),

                      // Street
                      TextInput(
                        controller: streetController,
                        label: "Street:",
                        hint: "",
                        isRequired: true,
                        isEnable: true,
                      ),

                      const SizedBox(height: 10),

                      // Subdivision / Village / Bldg.
                      TextInput(
                        controller: subdivisionController,
                        label: "Subdivision / Village / Bldg.:",
                        hint: "",
                        isRequired: false,
                        isEnable: true,
                      ),

                      const SizedBox(height: 10),

                      // Barangay
                      TextInput(
                        controller: barangayController,
                        label: "Barangay:",
                        hint: "",
                        isRequired: false,
                        isEnable: true,
                      ),

                      const SizedBox(height: 10),

                      // City / Municipality
                      TextInput(
                        controller: cityController,
                        label: "City / Municipality:",
                        hint: "eg. Caloocan",
                        isRequired: true,
                        isEnable: true,
                      ),

                      const SizedBox(height: 10),

                      // Province
                      TextInput(
                        controller: provinceController,
                        label: "Province:",
                        hint: "",
                        isRequired: false,
                        isEnable: true,
                      ),

                      const SizedBox(height: 10),

                      NumberInput(
                        controller: zipCodeController,
                        label: "Zip Code:",
                        hint: "XXXX",
                        isRequired: false,
                        isEnable: true,
                        hasFormat: true,
                        invalidCheck: (input) {
                          RegExp zipPattern = RegExp(r'^\d{4}$');

                          if (zipPattern.hasMatch(input)) {
                            return false;
                          }
                          return true;
                        },
                        invalidMessage: "Please enter a valid zip code",
                      ),

                      const SizedBox(height: 50),

                      BackNextButton(
                        nextPressed: () {
                          if (_formKey.currentState!.validate()) {
                            saveInput();
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder:
                                    (context) => const PermananetAddressPage(),
                              ),
                            );
                          } else {
                            showModalBottomSheet(
                              isScrollControlled: true,
                              context: context,
                              builder: (builder) {
                                return CustomBottomSheet(
                                  isError: true,
                                  title: "Missing Information",
                                  subtitle:
                                      "Please input all the\nnecessary information",
                                );
                              },
                            );
                          }
                        },
                        backPressed: () {
                          saveInput();
                          Navigator.pop(context);
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
