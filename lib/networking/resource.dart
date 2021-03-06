
class Resource<T> {
  final Status status;
  final T data;
  final String message;
  final Exception error;

  const Resource({this.data, this.status, this.message, this.error});

  static Resource<T> loading<T>({T data}) =>
      Resource<T>(data: data, status: Status.LOADING);

  static Resource<T> failed<T>({Exception error, T data}) =>
      Resource<T>(error: error, data: data, status: Status.FAILED);

  static Resource<T> success<T>({T data}) =>
      Resource<T>(data: data, status: Status.SUCCESS);
}

enum Status { SUCCESS, FAILED, LOADING }
