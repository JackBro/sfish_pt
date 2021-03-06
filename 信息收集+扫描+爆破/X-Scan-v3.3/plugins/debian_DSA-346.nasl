# This script was automatically generated from the dsa-346
# Debian Security Advisory
# It is released under the Nessus Script Licence.
# Advisory is copyright 1997-2009 Software in the Public Interest, Inc.
# See http://www.debian.org/license
# DSA2nasl Convertor is copyright 2004-2009 Tenable Network Security, Inc.

if (! defined_func('bn_random')) exit(0);

include('compat.inc');

if (description) {
 script_id(15183);
 script_version("$Revision: 1.9 $");
 script_xref(name: "DSA", value: "346");
 script_cve_id("CVE-2003-0536");
 script_bugtraq_id(7275, 7286);

 script_set_attribute(attribute:'synopsis', value: 
'The remote host is missing the DSA-346 security update');
 script_set_attribute(attribute: 'description', value:
'Albert Puigsech Galicia ripe@7a69ezine.org reported that phpsysinfo,
a web-based program to display status information about the system,
contains two vulnerabilities which could allow local files to be read,
or arbitrary PHP code to be executed, under the privileges of the web
server process (usually www-data).  These vulnerabilities require
access to a writable directory on the system in order to be exploited.
For the stable distribution (woody) this problem has been fixed in
version 2.0-3woody1.
');
 script_set_attribute(attribute: 'see_also', value: 
'http://www.debian.org/security/2003/dsa-346');
 script_set_attribute(attribute: 'solution', value: 
'Read http://www.debian.org/security/2003/dsa-346
and install the recommended updated packages.');
script_set_attribute(attribute: 'cvss_vector', value: 'CVSS2#AV:L/AC:L/Au:N/C:P/I:N/A:P');
script_end_attributes();

 script_copyright(english: "This script is (C) 2009 Tenable Network Security, Inc.");
 script_name(english: "[DSA346] DSA-346-1 phpsysinfo");
 script_category(ACT_GATHER_INFO);
 script_family(english: "Debian Local Security Checks");
 script_dependencies("ssh_get_info.nasl");
 script_require_keys("Host/Debian/dpkg-l");
 script_summary(english: "DSA-346-1 phpsysinfo");
 exit(0);
}

include("debian_package.inc");

if ( ! get_kb_item("Host/Debian/dpkg-l") ) exit(1, "Could not obtain the list of packages");

deb_check(prefix: 'phpsysinfo', release: '3.0', reference: '2.0-3woody1');
if (deb_report_get()) security_note(port: 0, extra:deb_report_get());
else exit(0, "Host is not affected");
