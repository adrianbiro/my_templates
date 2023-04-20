function exists(file, dummy, ret) {
  ret=0;
  if ( (getline dummy < file) >=0 ) {ret = 1; close(file)};
  return ret;
}
#BEGIN{print exists("/path/to/file")}  # 1 or 0
