class StudentList {
    final int? id;
    final String ci;
    final int migrated;
    final String teacherCi;
    final DateTime createdAt;

    StudentList({
        this.id,
        required this.ci,
        required this.migrated,
        required this.teacherCi,
        required this.createdAt,
    });

    StudentList copyWith({
        int? id,
        String? ci,
        int? migrated,
        String? teacherCi,
        DateTime? createdAt,
    }) => 
        StudentList(
            id: id ?? this.id,
            ci: ci ?? this.ci,
            migrated: migrated ?? this.migrated,
            teacherCi: teacherCi ?? this.teacherCi,
            createdAt: createdAt ?? this.createdAt,
        );

    factory StudentList.fromJson(Map<String, dynamic> json) => StudentList(
        id: json["id"],
        ci: json["ci"],
        migrated: json["migrated"],
        teacherCi: json["teacher_ci"],
        createdAt: DateTime.parse(json["created_at"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "ci": ci,
        "migrated": migrated,
        "teacher_ci": teacherCi,
        "created_at": createdAt.toIso8601String(),
    };
}