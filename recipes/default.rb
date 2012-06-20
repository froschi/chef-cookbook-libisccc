packages = Array.new

case node[:lsb][:codename]
when "lucid"
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
