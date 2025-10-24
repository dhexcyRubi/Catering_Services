import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/package_model.dart';
import 'package_remote_data_source.dart';

class PackageRemoteDataSourceImpl implements PackageRemoteDataSource {
  final FirebaseFirestore firestore;

  PackageRemoteDataSourceImpl(this.firestore);

  @override
  Future<PackageModel> createPackage(PackageModel pkg) async {
    final docRef = firestore.collection('packages').doc(pkg.id);
    await docRef.set(pkg.toMap());
    return pkg;
  }

  @override
  Future<PackageModel> updatePackage(PackageModel pkg) async {
    await firestore.collection('packages').doc(pkg.id).update(pkg.toMap());
    return pkg;
  }

  @override
  Future<bool> deletePackage(String id) async {
    await firestore.collection('packages').doc(id).delete();
    return true;
  }

  @override
  Future<PackageModel?> getPackageById(String id) async {
    final doc = await firestore.collection('packages').doc(id).get();
    if (!doc.exists) return null;
    return PackageModel.fromMap(doc.data()!);
  }

  @override
  Future<List<PackageModel>> listPackages({
  bool publishedOnly = true,
  String? servingStyle,
  int? limit,
  int? offset,
}) async {
  Query query = firestore.collection('packages');

  if (publishedOnly) query = query.where('isPublished', isEqualTo: true);
  if (servingStyle != null) query = query.where('servingStyle', isEqualTo: servingStyle);
  if (limit != null) query = query.limit(limit);

  final snapshot = await query.get();

  // ✅ Explicitly cast e.data() to Map<String, dynamic>
  return snapshot.docs.map((e) {
    final data = e.data() as Map<String, dynamic>;
    // Optionally inject the document ID if your model needs it
    data['id'] = e.id;
    return PackageModel.fromMap(data);
  }).toList();
}
}
