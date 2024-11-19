enum AccessIdentifiers {
  employee('employee'),
  manager('manager'),
  admin('admin');

  final String value;

  const AccessIdentifiers(this.value);

  // Static method to get an AccessIdentifier by its string value
  static AccessIdentifiers fromString(String input) {
    return AccessIdentifiers.values.firstWhere(
      (identifier) => identifier.value.toLowerCase() == input.toLowerCase(),
      orElse: () => throw ArgumentError('Invalid AccessIdentifier: $input'),
    );
  }

  static bool hasIntersection(List<AccessIdentifiers> identifiers, List<AccessIdentifiers> otherIdentifiers) {
    return identifiers.any((identifier) => otherIdentifiers.contains(identifier));
  }
}