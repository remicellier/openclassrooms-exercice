# On crer les repertoires

directory '/root/data' do
	owner 'root'
	group 'root'
	mode '0700'
	action :create
end

directory '/root/log' do
        owner 'root'
        group 'root'
        mode '0700'
        action :create
end

directory '/root/tmp' do
        owner 'root'
        group 'root'
        mode '0700'
        action :create
end

directory '/root/save' do
        owner 'root'
        group 'root'
        mode '0700'
        action :create
end

template '/root/data/exp_purge.cfg' do
	source "exp_purge.cfg.erb"
	owner 'root'
	group 'root'
	mode '0600'
	action :create_if_missing
end

  cron "On sauvegarde les crontabs" do
    action :create
    hour "*/8"
    minute "0"
    command "/usr/local/toolbox/exp_savcron.sh	>> /root/log/`date +\%y\%m\%dexp_savcron.log` 2>&1"
  end

  cron "On purge les fichiers de logs et temporaires" do
    action :create
    hour "2"
    minute "0"
    command "/usr/local/toolbox/exp_purge.sh		>> /root/log/`date +\%y\%m\%dexp_purge.log` 2>&1"
  end
