Bunchr::Software.new do |t|
  t.name = 'openssl_windows'
  t.version = '1.0.1r'

  windows_openssl_build = "openssl-#{t.version}-x86-windows"

  download_url = "https://github.com/jaym/windows-openssl-build/releases/download/openssl-#{t.version}/#{windows_openssl_build}.tar.lzma"

  t.download_commands << "wget --no-check-certificate -O #{windows_openssl_build}.tar.lzma #{download_url}"
  t.download_commands << "7z x #{windows_openssl_build}.tar.lzma"
  t.download_commands << "tar -xvf #{windows_openssl_build}.tar"

  t.work_dir = 'bin'

  install_prefix = "#{Bunchr.install_dir}\\embedded\\bin"

  t.install_commands << "xcopy libeay32.dll #{install_prefix}\\ /e /y"
  t.install_commands << "xcopy ssleay32.dll #{install_prefix}\\ /e /y"
  t.install_commands << "xcopy openssl.exe #{install_prefix}\\ /e /y"

  CLEAN << install_prefix
end
