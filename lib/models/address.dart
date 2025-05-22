class Address {
  String? streetNumber;
  String? street;
  String? subdivision; // Subdivision / Village / Bldg.
  String? barangay;
  String? city;
  String? province;
  String? zipCode;

  String get fullAddress {
    String formattedAddress = "$streetNumber $street,";

    if (subdivision!.isNotEmpty) {
      formattedAddress += " $subdivision,";
    }

    if (barangay!.isNotEmpty) {
      formattedAddress += " $barangay,";
    }

    formattedAddress += " $city";

    if (province!.isNotEmpty) {
      formattedAddress += ", $province";
    }

    if (zipCode!.isNotEmpty) {
      formattedAddress += ", $zipCode";
    }

    return formattedAddress;
  }
}
