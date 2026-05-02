
import 'storage_service.dart';

class BusinessService {

  static void saveExpenses(List<Map> data) {
    StorageService.save('expenses', data);
  }

  static List<Map> getExpenses() {
    return List<Map>.from(StorageService.get('expenses') ?? []);
  }

  static void saveEmployees(List<Map> data) {
    StorageService.save('employees', data);
  }

  static List<Map> getEmployees() {
    return List<Map>.from(StorageService.get('employees') ?? []);
  }

  static void saveServices(List<Map> data) {
    StorageService.save('services', data);
  }

  static List<Map> getServices() {
    return List<Map>.from(StorageService.get('services') ?? []);
  }

}
