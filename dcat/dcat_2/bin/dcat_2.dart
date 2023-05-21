import 'package:dcat_2/dcat_2.dart' as dcat_2;
import 'dart:io';


void main() async{
  stdout.writeln('Type something');
  final input = stdin.readLineSync();
  stdout.writeln('You typed: $input');
  
  //https://dart.cn/tutorials/server/cmdline#writing-a-file
  final quotes = File('quotes.txt');
  const stronger = 'That which does not kill us makes us stronger. -Nietzsche';
 
  await quotes.writeAsString(stronger, mode: FileMode.append);

  //
  sample_write_more();

  //获取环境信息
  get_environment_info();

  //设置退出代码
  _handleError('path');
  
}

void sample_write_more() async {
  final quotes = File('quotes.txt').openWrite(mode: FileMode.append);

  quotes.write("Don't cry because it's over, ");
  quotes.writeln('smile because it happened. -Dr. Seuss');
  await quotes.close();
}

//https://dart.cn/tutorials/server/cmdline#getting-environment-information
void get_environment_info() {
  final envVarMap = Platform.environment;

  print('PWD = ${envVarMap['PWD']}');
  print('LOGNAME = ${envVarMap['LOGNAME']}');
  print('PATH = ${envVarMap['PATH']}');
}

//https://dart.cn/tutorials/server/cmdline#setting-exit-codes
Future<void> _handleError(String path) async {
  if (await FileSystemEntity.isDirectory(path)) {
    stderr.writeln('error: $path is a directory');
  } else {
    exitCode = 2;
  }
}