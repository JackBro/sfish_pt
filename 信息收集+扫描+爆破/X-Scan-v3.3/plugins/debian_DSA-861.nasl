# This script was automatically generated from the dsa-861
# Debian Security Advisory
# It is released under the Nessus Script Licence.
# Advisory is copyright 1997-2009 Software in the Public Interest, Inc.
# See http://www.debian.org/license
# DSA2nasl Convertor is copyright 2004-2009 Tenable Network Security, Inc.

if (! defined_func('bn_random')) exit(0);

include('compat.inc');

if (description) {
 script_id(19969);
 script_version("$Revision: 1.7 $");
 script_xref(name: "DSA", value: "861");
 script_cve_id("CVE-2005-2933");

 script_set_attribute(attribute:'synopsis', value: 
'The remote host is missing the DSA-861 security update');
 script_set_attribute(attribute: 'description', value:
'"infamous41md" discovered a buffer overflow in uw-imap, the University
of Washington\'s IMAP Server that allows attackers to execute arbitrary
code.
The old stable distribution (woody) is not affected by this problem.
For the stable distribution (sarge) this problem has been fixed in
version 2002edebian1-11sarge1.
');
 script_set_attribute(attribute: 'see_also', value: 
'http://www.debian.org/security/2005/dsa-861');
 script_set_attribute(attribute: 'solution', value: 
'The Debian project recommends that you upgrade your uw-imap packages.');
script_set_attribute(attribute: 'cvss_vector', value: 'CVSS2#AV:N/AC:L/Au:N/C:P/I:P/A:P');
script_end_attributes();

 script_copyright(english: "This script is (C) 2009 Tenable Network Security, Inc.");
 script_name(english: "[DSA861] DSA-861-1 uw-imap");
 script_category(ACT_GATHER_INFO);
 script_family(english: "Debian Local Security Checks");
 script_dependencies("ssh_get_info.nasl");
 script_require_keys("Host/Debian/dpkg-l");
 script_summary(english: "DSA-861-1 uw-imap");
 exit(0);
}

include("debian_package.inc");

if ( ! get_kb_item("Host/Debian/dpkg-l") ) exit(1, "Could not obtain the list of packages");

deb_check(prefix: 'ipopd', release: '3.1', reference: '2002edebian1-11sarge1');
deb_check(prefix: 'ipopd-ssl', release: '3.1', reference: '2002edebian1-11sarge1');
deb_check(prefix: 'libc-client-dev', release: '3.1', reference: '2002edebian1-11sarge1');
deb_check(prefix: 'libc-client2002edebian', release: '3.1', reference: '2002edebian1-11sarge1');
deb_check(prefix: 'mlock', release: '3.1', reference: '2002edebian1-11sarge1');
deb_check(prefix: 'uw-imapd', release: '3.1', reference: '2002edebian1-11sarge1');
deb_check(prefix: 'uw-imapd-ssl', release: '3.1', reference: '2002edebian1-11sarge1');
deb_check(prefix: 'uw-mailutils', release: '3.1', reference: '2002edebian1-11sarge1');
deb_check(prefix: 'uw-imap', release: '3.1', reference: '2002edebian1-11sarge1');
if (deb_report_get()) security_hole(port: 0, extra:deb_report_get());
else exit(0, "Host is not affected");
