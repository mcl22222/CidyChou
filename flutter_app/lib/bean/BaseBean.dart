//基本模型，用于网络请求回来数据时进行转换
class BaseBean {
  final String status;
  final String msg;
  final Object data;

  BaseBean(
      {this.status, this.msg, this.data});

  //进行模型的转换
  factory BaseBean.from(Map<String, dynamic> json) {
    return BaseBean(
      status: json['status'],
      msg: json['msg'],
      data: json['data'],
    );
  }
}
