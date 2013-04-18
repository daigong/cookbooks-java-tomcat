#find the tarball path
require 'pathname'
tarball_path = Pathname.new(File.dirname(__FILE__)+"/../files/default/").realpath
#set the tarball path
node.default[:java][:tarball_path] = tarball_path

#care about node.default[:java][:java_install_path] 
node.default[:java][:java_file_name] = "jdk7.tar.gz"

node.default[:java][:java_tar] = "#{tarball_path}/#{node[:java_file_name]}"

#care about node.default[:java][:tomcat_install_path]
node.default[:java][:tomcat_file_name] = "tomcat7.tar.gz"
 
node.default[:java][:tomcat_tar] = "#{tarball_path}/#{node[:java][:tomcat_file_name]}"

#install path

node.default[:java][:install_path] = "/usr/local"

node.default[:java][:java_install_path] = "#{node[:java][:install_path]}/jdk7"

node.default[:java][:tomcat_install_path] = "#{node[:java][:install_path]}/tomcat7"
