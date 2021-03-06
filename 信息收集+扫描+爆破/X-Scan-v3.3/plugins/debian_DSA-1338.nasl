# This script was automatically generated from the dsa-1338
# Debian Security Advisory
# It is released under the Nessus Script Licence.
# Advisory is copyright 1997-2009 Software in the Public Interest, Inc.
# See http://www.debian.org/license
# DSA2nasl Convertor is copyright 2004-2009 Tenable Network Security, Inc.

if (! defined_func('bn_random')) exit(0);

include('compat.inc');

if (description) {
 script_id(25781);
 script_version("$Revision: 1.7 $");
 script_xref(name: "DSA", value: "1338");
 script_cve_id("CVE-2007-3089", "CVE-2007-3656", "CVE-2007-3734", "CVE-2007-3735", "CVE-2007-3736", "CVE-2007-3737", "CVE-2007-3738");

 script_set_attribute(attribute:'synopsis', value: 
'The remote host is missing the DSA-1338 security update');
 script_set_attribute(attribute: 'description', value:
'Several remote vulnerabilities have been discovered in the Iceweasel web
browser, an unbranded version of the Firefox browser. The Common 
Vulnerabilities and Exposures project identifies the following problems:
CVE-2007-3089
    Ronen Zilberman and Michal Zalewski discovered that a timing race
    allows the injection of content into about:blank frames.
CVE-2007-3656
    Michal Zalewski discovered that same-origin policies for wyciwyg://
    documents are insufficiently enforced.
CVE-2007-3734
    Bernd Mielke, Boris Zbarsky, David Baron, Daniel Veditz, Jesse Ruderman,
    Lukas Loehrer, Martijn Wargers, Mats Palmgren, Olli Pettay, Paul
    Nickerson and Vladimir Sukhoy discovered crashes in the layout engine,
    which might allow the execution of arbitrary code.
CVE-2007-3735
    Asaf Romano, Jesse Ruderman and Igor Bukanov discovered crashes in the
    javascript engine, which might allow the execution of arbitrary code.
CVE-2007-3736
    <q>moz_bug_r_a4</q> discovered that the addEventListener() and setTimeout()
    functions allow cross-site scripting.
CVE-2007-3737
    <q>moz_bug_r_a4</q> discovered that a programming error in event handling
    allows privilege escalation.
CVE-2007-3738
    <q>shutdown</q> and <q>moz_bug_r_a4</q> discovered that the XPCNativeWrapper allows
    the execution of arbitrary code.
The Mozilla products in the oldstable distribution (sarge) are no longer
supported with security updates. You\'re strongly encouraged to upgrade to
stable as soon as possible.
For the stable distribution (etch) these problems have been fixed in version
2.0.0.5-0etch1. Builds for alpha and mips are not yet available, they will
be provided later.
');
 script_set_attribute(attribute: 'see_also', value: 
'http://www.debian.org/security/2007/dsa-1338');
 script_set_attribute(attribute: 'solution', value: 
'The Debian project recommends that you upgrade your iceweasel packages.');
script_set_attribute(attribute: 'cvss_vector', value: 'CVSS2#AV:N/AC:M/Au:N/C:C/I:C/A:C');
script_end_attributes();

 script_copyright(english: "This script is (C) 2009 Tenable Network Security, Inc.");
 script_name(english: "[DSA1338] DSA-1338-1 iceweasel");
 script_category(ACT_GATHER_INFO);
 script_family(english: "Debian Local Security Checks");
 script_dependencies("ssh_get_info.nasl");
 script_require_keys("Host/Debian/dpkg-l");
 script_summary(english: "DSA-1338-1 iceweasel");
 exit(0);
}

include("debian_package.inc");

if ( ! get_kb_item("Host/Debian/dpkg-l") ) exit(1, "Could not obtain the list of packages");

deb_check(prefix: 'firefox', release: '4.0', reference: '2.0.0.5-0etch1');
deb_check(prefix: 'firefox-dom-inspector', release: '4.0', reference: '2.0.0.5-0etch1');
deb_check(prefix: 'firefox-gnome-support', release: '4.0', reference: '2.0.0.5-0etch1');
deb_check(prefix: 'iceweasel', release: '4.0', reference: '2.0.0.5-0etch1');
deb_check(prefix: 'iceweasel-dbg', release: '4.0', reference: '2.0.0.5-0etch1');
deb_check(prefix: 'iceweasel-dom-inspector', release: '4.0', reference: '2.0.0.5-0etch1');
deb_check(prefix: 'iceweasel-gnome-support', release: '4.0', reference: '2.0.0.5-0etch1');
deb_check(prefix: 'mozilla-firefox', release: '4.0', reference: '2.0.0.5-0etch1');
deb_check(prefix: 'mozilla-firefox-dom-inspector', release: '4.0', reference: '2.0.0.5-0etch1');
deb_check(prefix: 'mozilla-firefox-gnome-support', release: '4.0', reference: '2.0.0.5-0etch1');
if (deb_report_get()) security_hole(port: 0, extra:deb_report_get());
else exit(0, "Host is not affected");
