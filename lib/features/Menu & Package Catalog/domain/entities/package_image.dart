import 'package:equatable/equatable.dart';

class PackageImage extends Equatable {
  final String id;
  final String url;
  final String? altText;

  const PackageImage({required this.id, required this.url, this.altText});

  @override
  List<Object?> get props => [id, url, altText];
}
