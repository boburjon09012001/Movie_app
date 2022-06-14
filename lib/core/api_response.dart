class ApiResponse<T>{

  Status status;
  T? data;
  String message;

  ApiResponse.initial(this.message):status = Status.INITIAL;
  ApiResponse.loading(this.message):status = Status.LOADING;
  ApiResponse.error(this.message):status = Status.ERROR;
  ApiResponse.completed(this.message):status = Status.COMPLETED;






}



enum Status{
  INITIAL,
  LOADING,
  ERROR,
  COMPLETED

}