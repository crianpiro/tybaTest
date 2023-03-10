// To parse this JSON data, do
//
//     final university = universityFromJson(jsonString);
import 'dart:convert';

University universityFromJson(String str) => University.fromJson(json.decode(str));

String universityToJson(University data) => json.encode(data.toJson());

class University {
    University({
        required this.alphaTwoCode,
        required this.domains,
        required this.country,
        this.stateProvince,
        required this.webPages,
        required this.name,
    });

    String alphaTwoCode;
    List<String> domains;
    String country;
    String? stateProvince;
    List<String> webPages;
    String name;

    University copyWith({
        String? alphaTwoCode,
        List<String>? domains,
        String? country,
        String? stateProvince,
        List<String>? webPages,
        String? name,
    }) => 
        University(
            alphaTwoCode: alphaTwoCode ?? this.alphaTwoCode,
            domains: domains ?? this.domains,
            country: country ?? this.country,
            stateProvince: stateProvince ?? this.stateProvince,
            webPages: webPages ?? this.webPages,
            name: name ?? this.name,
        );

    factory University.fromJson(Map<String, dynamic> json) => University(
        alphaTwoCode: json["alpha_two_code"],
        domains: List<String>.from(json["domains"].map((x) => x)),
        country: json["country"],
        stateProvince: json["state-province"],
        webPages: List<String>.from(json["web_pages"].map((x) => x)),
        name: json["name"],
    );

    Map<String, dynamic> toJson() => {
        "alpha_two_code": alphaTwoCode,
        "domains": List<dynamic>.from(domains.map((x) => x)),
        "country": country,
        "state-province": stateProvince,
        "web_pages": List<dynamic>.from(webPages.map((x) => x)),
        "name": name,
    };
}
