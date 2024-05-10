# %undefine __brp_mangle_shebangs
%global __brp_mangle_shebangs %{nil}

Name:     redborder-ale
Version:  %{__version}
Release:  %{__release}%{?dist}
BuildArch: noarch
Summary: redborder ale

License:  GNU AGPLv3
URL:  https://github.com/redBorder/redborder-ale
Source0: %{name}-%{version}.tar.gz

%description
%{summary}

%prep
%setup -qn %{name}-%{version}

%build

%install
mkdir -p %{buildroot}/usr/lib/%{name}
install -D -m 644 resources/systemd/%{name}.service %{buildroot}/usr/lib/systemd/system/%{name}.service
install -D -m 644 conf/schema.pb.rb %{buildroot}/etc/%{name}/schema.pb.rb
install -D -m 755 bin/rb_ale.rb %{buildroot}/var/rb-ale/bin/rb_ale.rb
install -D -m 755 resources/scripts/rb_scan_ale.rb %{buildroot}/bin/rb_scan_ale.rb

%clean
rm -rf %{buildroot}

%pre
getent group %{name} >/dev/null || groupadd -r %{name}
getent passwd %{name} >/dev/null || \
    useradd -r -g %{name} -d / -s /sbin/nologin \
    -c "User of %{name} service" %{name}
exit 0

%post 
systemctl daemon-reload
-p /sbin/ldconfig

%postun -p /sbin/ldconfig

%files
%defattr(755,root,root)
/usr/lib/%{name}
%defattr(755,%{name},root)
/var/rb-ale/bin/rb_ale.rb
/bin/rb_scan_ale.rb
%defattr(644,root,root)
/usr/lib/systemd/system/%{name}.service
/etc/%{name}/schema.pb.rb

%changelog
* Mon Dec 27 2021 Eduardo Reyes <eareyes@redborder.com> - 0.0.1
- first spec version
