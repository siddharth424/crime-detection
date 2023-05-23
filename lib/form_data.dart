class FormData {
  String name;
  String phone;
  // Add other form fields as needed

  FormData({
    required this.name,
    required this.phone,
    // Initialize other form fields as needed
  });

  // Convert form data to a map
  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'phone': phone,
      // Add other form fields to the map
    };
  }

  // Create form data from a map
  factory FormData.fromMap(Map<String, dynamic> map) {
    return FormData(
      name: map['name'],
      phone: map['phone'],
      // Create other form fields from the map
    );
  }
}
