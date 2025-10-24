import '../models/package_model.dart';

abstract class PackageRemoteDataSource {
  Future<PackageModel> createPackage(PackageModel pkg);
  Future<PackageModel> updatePackage(PackageModel pkg);
  Future<bool> deletePackage(String id);
  Future<PackageModel?> getPackageById(String id);
  Future<List<PackageModel>> listPackages({
    bool publishedOnly,
    String? servingStyle,
    int? limit,
    int? offset,
  });
}
