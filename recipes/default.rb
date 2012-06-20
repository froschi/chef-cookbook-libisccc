include_recipe "libisc"

packages = Array.new

case node[:lsb][:codename]
when "lucid"
  include_recipe "libcap"
  include_recipe "libxml2"

  packages |= %w/
    libiscc60
  /
when "precise"
  packages |= %w/
    libisccc80
  /
end

packages.each do |pkg|
  package pkg do
    action [:install, :upgrade]
  end
end
