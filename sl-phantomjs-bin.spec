Name:           sl-phantomjs
Version:        1
Release:        %{VERSION}
Summary:        Smartling phantomjs fork
BuildArch:      x86_64
License:        Proprietary
Group:          Utilities/Console
Requires:       fontconfig
Requires:       freetype

Prefix:         /usr/local/bin


%description
PhantomJS is a headless WebKit scriptable with a JavaScript API.
It has fast and native support for various web standards: DOM handling, CSS selector, JSON, Canvas, and SVG.


%install
%{__install} -p -D -m 0755 %{_sourcedir}/bin/phantomjs %{buildroot}%{prefix}/sl-phantomjs

%files
%{prefix}/sl-phantomjs


%clean
rm -rf %{buildroot}/
