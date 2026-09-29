import 'package:equatable/equatable.dart';

/// A web monitor user that may view mobile garage data.
class WebPortalUser extends Equatable {
  const WebPortalUser({
    required this.id,
    required this.name,
    required this.hasAccess,
  });

  final int id;
  final String name;
  final bool hasAccess;

  WebPortalUser copyWith({
    int? id,
    String? name,
    bool? hasAccess,
  }) {
    return WebPortalUser(
      id: id ?? this.id,
      name: name ?? this.name,
      hasAccess: hasAccess ?? this.hasAccess,
    );
  }

  @override
  List<Object?> get props => [id, name, hasAccess];
}
