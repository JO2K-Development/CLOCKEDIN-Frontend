enum AccessIdentifier {
  employee('employee'),
  manager('manager'),
  admin('admin');

  final String value;

  const AccessIdentifier(this.value);

  // Static method to get an AccessIdentifier by its string value
  static AccessIdentifier fromString(String input) {
    return AccessIdentifier.values.firstWhere(
      (identifier) => identifier.value.toLowerCase() == input.toLowerCase(),
      orElse: () => throw ArgumentError('Invalid AccessIdentifier: $input'),
    );
  }

  static bool hasIntersection(List<AccessIdentifier> identifiers, List<AccessIdentifier> otherIdentifiers) {
    return identifiers.any((identifier) => otherIdentifiers.contains(identifier));
  }
}