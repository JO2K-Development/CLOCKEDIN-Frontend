class UsersFormatter {
  static toFullName(obj) {
    return "${obj.firstName! ?? ""} ${obj.lastName! ?? ""}";
  }
}