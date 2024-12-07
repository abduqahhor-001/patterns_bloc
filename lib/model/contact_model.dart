class Contact {
  String fullName;
  String phone;
  String id;

  Contact({
    required this.fullName,
    required this.phone,
    required this.id,
  });

  factory Contact.fromJson(Map<String, dynamic> json) => Contact(
    fullName: json["full_name"],
    phone: json["phone"],
    id: json["id"],
  );

  Map<String, dynamic> toJson() => {
    "full_name": fullName,
    "phone": phone,
    "id": id,
  };
}