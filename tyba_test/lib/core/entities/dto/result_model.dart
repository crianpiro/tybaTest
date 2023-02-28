
enum Status {
  success,
  error,
}
class Result<T> {
  Status? status;
  T? data;
  Map<String, String>? errors;

  Result.success(this.data) {
    status = Status.success;
  }

  Result.errors(this.errors) {
    status = Status.error;
  }
}