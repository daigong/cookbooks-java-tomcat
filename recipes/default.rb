#
# Cookbook Name:: ./cookbooks-java-tomcat
# Recipe:: default
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#


#copy java,tar -xzvf jdk
execute "安装jdk 到 #{node[:java][:java_install_path]}" do
	command """
		cd #{node[:java][:tarball_path]};
		cp #{node[:java][:java_file_name]} #{node[:java][:install_path]} -f ;
		cd #{node[:java][:install_path]};
		tar -xzvf #{node[:java][:java_file_name]};
		rm #{node[:java][:java_file_name]} -rf
	"""
end

#java profile

template "/etc/profile.d/java.sh" do
  source "java.sh.erb"
  variables(
    :java_home => node[:java][:java_install_path],
  )
end

#copy tomcat ,tar -xzvf jdk

execute "安装tomcat 到 #{node[:java][:java_install_path]}" do
        command """
                cd #{node[:java][:tarball_path]};
                cp #{node[:java][:tomcat_file_name]} #{node[:java][:install_path]} -f ;
                cd #{node[:java][:install_path]};
                tar -xzvf #{node[:java][:tomcat_file_name]};
                rm #{node[:java][:tomcat_file_name]} -rf
        """
end

#tomcat profile
template "/etc/profile.d/tomcat.sh" do
  source "tomcat.sh.erb"
  variables(
    :tomcat_home => node[:java][:tomcat_install_path],
  )
end

